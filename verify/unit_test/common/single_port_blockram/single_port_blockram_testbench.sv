module tb_single_port_blockram();





    parameter SINGLE_ELEMENT_SIZE_IN_BITS = 64;
    parameter NUMBER_SETS                 = 64;
    parameter SET_PTR_WIDTH_IN_BITS       = $clog2(NUMBER_SETS);

	reg clk_in;
	reg access_en_in;
	reg write_en_in;
	reg [SET_PTR_WIDTH_IN_BITS-1:0] access_set_addr_in;
	reg [SINGLE_ELEMENT_SIZE_IN_BITS-1:0] write_element_in;
	wire [SINGLE_ELEMENT_SIZE_IN_BITS-1:0] read_element_out;


	single_port_blockram DUV_single_port_blockram(
		.clk_in(clk_in),
		.access_en_in(access_en_in),
		.write_element_in(write_element_in),
		.access_set_addr_in(access_set_addr_in),
		.write_en_in(write_en_in),
		.read_element_out(read_element_out)
		);


	parameter PERIOD = 10;
	initial begin
		clk_in = 0;
		forever begin
			#(PERIOD/2) clk_in = ~clk_in;
		end
	end



	
	initial begin
		$display("***********Begin test single_port_blockram********************\n");
		for (i=0;i<NUMBER_SETS;i++) begin
			@(posedge clk_in);
			access_en_in=1'b1;
			write_en_in = 1'b1;
			write_element_in = $urandom;
			access_set_addr_in = i;
			$display("%5t:BLOCKROM write:data = %d,adder=%d\n",$time,write_element_in,access_set_addr_in);
			
		end
		for (int i=0;i<NUMBER_SETS;i++) begin
			@(posedge clk_in);
			access_en_in=1'b1;
			write_en_in = 1'b0;
			write_element_in = $urandom;
			access_set_addr_in = i;
			$display("%5t:BLOCKROM read:data = %d,adder=%d\n",$time,read_element_out,access_set_addr_in);
		end

		$finish;
	end



	initial begin
		$vcdpluson();
	end

endmodule 