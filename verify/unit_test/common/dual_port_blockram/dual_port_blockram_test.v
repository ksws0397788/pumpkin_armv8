`timescale 1ns/1ns
`include "parameters.h"

module dual_port_blockram_test();



	//instance 

	parameter SINGLE_ELEMENT_SIZE_IN_BITS = 64;
	parameter NUMBER_SETS                 = 64;
	parameter SET_PTR_WIDTH_IN_BITS       = 6;

	reg                                        clk_in;
	    
	reg                                        read_en_in;
	reg  [SET_PTR_WIDTH_IN_BITS       - 1 : 0] read_set_addr_in;
	wire [SINGLE_ELEMENT_SIZE_IN_BITS - 1 : 0] read_element_out;

	reg                                        write_en_in;
	reg  [SET_PTR_WIDTH_IN_BITS       - 1 : 0] write_set_addr_in;
	reg  [SINGLE_ELEMENT_SIZE_IN_BITS - 1 : 0] write_element_in;
	wire  [SINGLE_ELEMENT_SIZE_IN_BITS - 1 : 0] evict_element_out;



	dual_port_blockram

	dual_port_blockram_inst
	(
			.clk_in(clk_in),

			.read_en_in(read_en_in),
			.read_set_addr_in(read_set_addr_in),
			.read_element_out(read_element_out),

			.write_en_in(write_en_in),
			.write_set_addr_in(write_set_addr_in),
			.write_element_in(write_element_in),
			.evict_element_out(evict_element_out)
	);


	//generate clk

	parameter PERIOD = 10;
	initial begin
		clk_in = 0;
		forever begin
			#(PERIOD/2) clk_in = ~clk_in;
		end
	end

	//write and read test
	integer i;
	initial begin
		$display("*************** testbench for %m begins now ************\n");
		//write 
		repeat(5) @(posedge clk_in);
		for (i=0;i<NUMBER_SETS;i++)begin	
			write_en_in=1;
			write_set_addr_in=i;
			write_element_in=$random();
			@(posedge clk_in);
			$display("@%5tns write adder to  is %0d ,write data is %0d,evict_element_out is %0d",$time,write_set_addr_in,write_element_in,evict_element_out);
		end


		//read
		repeat(5) @(posedge clk_in);
		write_en_in=0;
		for(i=0;i<NUMBER_SETS;i++)begin
			read_en_in=1;
			read_set_addr_in=i;
			@(posedge clk_in);
			$display("@%5tns read adder is %0d,read data is %0d",$time,read_set_addr_in,read_element_out);
		end
		
		//write then read
		repeat(5) @(posedge clk_in);
		read_en_in=0;
		for (i=0;i<NUMBER_SETS;i++)begin	
			write_en_in=1;
			read_en_in=1;
			write_set_addr_in=i;
			read_set_addr_in=i;
			write_element_in=$random();
			@(posedge clk_in);
			$display("@%5tns write adder to  is %0d ,write data is %0d,evict_element_out is %0d",$time,write_set_addr_in,write_element_in,evict_element_out);
			@(posedge clk_in);
			$display("@%5tns read adder is %0d,read data is %0d",$time,read_set_addr_in,read_element_out);
		end

		//finish
		$finish;
	end

	//generate dump file
	initial begin
		$vcdpluson;
	end





endmodule