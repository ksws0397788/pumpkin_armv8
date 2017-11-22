`timescale 1ns/1ns
module tb_fifo_queue();

	
	parameter QUEUE_SIZE = 16;
	parameter QUEUE_PTR_WIDTH_IN_BITS = 4;
	parameter SINGLE_ENTRY_WIDTH_IN_BITS = 32;
	parameter STORAGE_TYPE = "LUTRAM";

	reg                                             clk_in;
	reg                                             reset_in;//when reset_in ==1,reset the fifo_queue
	reg     [31:0]                                  clk_ctr;

	wire                                            rempty;
	wire                                            wfull;

	reg     [SINGLE_ENTRY_WIDTH_IN_BITS - 1:0]      wdata;
	reg                                             winc;
	wire                                            issue_ack_from_fifo;
	wire    [SINGLE_ENTRY_WIDTH_IN_BITS - 1:0]      rdata;
	wire                                            request_valid_out;
	reg                                             rinc;

	fifo_queue
	#
	(
	        .QUEUE_SIZE(QUEUE_SIZE),
	        .QUEUE_PTR_WIDTH_IN_BITS(QUEUE_PTR_WIDTH_IN_BITS),
	        .SINGLE_ENTRY_WIDTH_IN_BITS(SINGLE_ENTRY_WIDTH_IN_BITS),
	        .STORAGE_TYPE(STORAGE_TYPE)
	)
	fifo_queue
	(
	        .clk_in                 (clk_in),
	        .reset_in               (reset_in),
	        
	        .is_empty_out           (rempty),
	        .is_full_out            (wfull),

	        .request_in             (wdata), 
	        .request_valid_in       (winc),
	        .issue_ack_out          (issue_ack_from_fifo),
	        .request_out            (rdata),
	        .request_valid_out      (request_valid_out),
	        .issue_ack_in           (rinc)
	);

	
	initial begin	
		clk_in =0;
		forever begin
			#5 clk_in=~clk_in;
		end 
	end

	task reset_fifo();
		begin
			reset_in =1;//reset_in valid
			wdata<=$random;
			winc<=0;
			rinc<=0;
			repeat(5)@(posedge clk_in);
			reset_in=0;
		end
	endtask 

	
	initial begin
		bit[SINGLE_ENTRY_WIDTH_IN_BITS-1:0] fifo[$];
		bit[SINGLE_ENTRY_WIDTH_IN_BITS-1:0] data_ft;
		bit full_ft,empty_ft;
		bit winc_ft,rinc_ft;
		bit full_reset,empty_reset;

	//1.reset 
		reset_fifo();
		$display("************** begin test for %m now *************\n");
		$display("********** direct test *************\n");
		//test wfull and rempty when the fifo is on reset state 
		repeat(5) @(posedge clk_in);
		full_reset = wfull==1'b0;
		empty_reset= rempty==1'b1;
		$display("@%5t:wfull reset:%0s",$time,full_reset?"PASS":"FAIL");
		$display("@%5t:rempty reset:%0s",$time,empty_reset?"PASS":"FAIL");

	//2.write data to the fifo
		repeat(5)@(posedge clk_in);
		for(int i=0;i<36;i++)begin //issue_ack_from_fifo needs more cycles,20 cycles fifo is not full
			@(posedge clk_in);
			{data_ft,winc_ft} = {wdata,winc};  // type is bit 
			{wdata,winc}<={$urandom,1'b1};	   // type is reg ,= is wrong 

			if(winc_ft &&  issue_ack_from_fifo) begin
				fifo.push_back(data_ft);
				$display("@%5t:fifo write data =%h",$time,fifo[$]);
			end
		end
		//test wfull 
		winc <=1'b0;
		full_ft = fifo.size==16;
		$display("@%5t:wfull test:%0s",$time,full_ft?"PASS":"FAIL");
		
	//3.read data from the fifo
		repeat(5)@(posedge clk_in);
		for(int i=0;i<36;i++)begin
			@(posedge clk_in);
			rinc_ft= rinc;
			rinc<=1'b1;

			if(rinc_ft && ~rempty)begin
				if(fifo.size ==0)begin
					$display("@%5t:fifo read :data = %0h FAIL,expected empty",$time,rdata);
				end 
				else if(rdata != fifo[0]) begin
					$display("@%5t:fifo read :data =%0h FAIL,expected =%h",$time,rdata,fifo[0]);
					fifo.pop_front();
				end 
				else begin
					$display("@%5t:fifo read :data =%0h,PASS",$time,fifo[0]);
					fifo.pop_front();
				end 

			end 
		end  
		//test rempty
		rinc<=1'b0;
		empty_ft = fifo.size==0;
		$display("@%5t :rempty test :%0s",$time,empty_ft?"PASS":"FAIL");



		$display("**************  test result ****************\n");
		$display("**************  FUll:%0s,EMPTY:0%s **************\n",(full_reset|full_ft)?"ok":"err",(empty_reset|empty_ft)?"ok":"err");
		$display("**************  end test fifo ****************\n");
		$finish;
	end


	
	initial begin	
		$vcdpluson();
	end


endmodule 











