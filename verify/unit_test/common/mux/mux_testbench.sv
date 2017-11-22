`timescale 1ns/1ns
`include "parameters.h"

module mux_testbench();



parameter NUMBER_WAYS = 8;
parameter SINGLE_ELEMENT_SIZE_IN_BITS = 4;


reg     [NUMBER_WAYS * SINGLE_ELEMENT_SIZE_IN_BITS - 1:0]       way_packed_in;
reg     [NUMBER_WAYS - 1 : 0]                                   sel_in;
wire    [SINGLE_ELEMENT_SIZE_IN_BITS - 1:0]                     way_packed_out;

mux_8
#
(
        .NUMBER_WAYS(NUMBER_WAYS),
        .SINGLE_ELEMENT_SIZE_IN_BITS(SINGLE_ELEMENT_SIZE_IN_BITS)
)
mux_8
(
        .way_packed_in                  (way_packed_in),
        .sel_in                         (sel_in),
        .way_packed_out                 (way_packed_out)
);



reg clk;
reg reset_in; //high  valid

initial begin
        clk=0;
        forever begin
                #5  clk=~clk;
        end
end

task reset_mux();
        begin
                reset_in=0;
                repeat(5) @(posedge clk);
                reset_in =1;
                repeat(5) @(posedge clk);
                reset_in=0;
                way_packed_in=$random;
        end
endtask



initial begin
        $display("*****  test for %m begins now *******\n");
        reset_mux();
        for(int i=0;i<8;i++) begin
                sel_in=1'b0;
                sel_in[i] = 1'b1;
                @(posedge clk);
                $display("@%5tns  way_packed_in is : %0h,sel_in is %8b,way_packed_out is %0h",$time,way_packed_in,sel_in,way_packed_out);
        end
        $finish;
end



initial begin
        $vcdpluson();
end


endmodule
