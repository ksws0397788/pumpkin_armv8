

module tb_find_first_one_index();

        parameter VECTOR_LENGTH = 2;


        reg  [VECTOR_LENGTH - 1 : 0]  vector_input;
        wire  [31                : 0] first_one_index;
        reg clk;
        integer i;
        find_first_one_index  #(.VECTOR_LENGTH(VECTOR_LENGTH)) DUV(

                .vector_input(vector_input),
                .first_one_index(first_one_index)
                );


        initial begin
                clk=0;
                forever begin
                     #5   clk=~clk;
                end 
        end



        initial begin
                $display("****** testbench for %m begins now\n");
        
                vector_input=2'b00 ;
        @(posedge clk);
                $display("@%5tns vector_input is %b ,first_one_index is %d \n",$time,vector_input,first_one_index);
                

                vector_input=2'b01 ;
        @(posedge clk);
                $display("@%5tns vector_input is %b ,first_one_index is %d \n",$time,vector_input,first_one_index);
                
        
                vector_input=2'b10 ;
        @(posedge clk);
                $display("@%5tns vector_input is %b ,first_one_index is %d \n",$time,vector_input,first_one_index);

                vector_input=2'b11 ;
        @(posedge clk);
                $display("@%5tns vector_input is %b ,first_one_index is %d \n",$time,vector_input,first_one_index);
                 
        $finish;
                                            
        end


        initial begin
                $vcdpluson();
        end
        
endmodule