module tb_single_port_lutram();

                
               
        parameter SINGLE_ELEMENT_SIZE_IN_BITS = 64;
        parameter NUMBER_SETS                 = 64;
        parameter SET_PTR_WIDTH_IN_BITS       = $clog2(NUMBER_SETS);

        reg                                                  reset_in;
        reg                                                   clk_in;

        reg                                                   access_en_in;
        reg                                                   write_en_in;
        reg      [SET_PTR_WIDTH_IN_BITS       - 1 : 0]        access_set_addr_in;

        reg      [SINGLE_ELEMENT_SIZE_IN_BITS - 1 : 0]        write_element_in;
        wire     [SINGLE_ELEMENT_SIZE_IN_BITS - 1 : 0]        read_element_out;


        single_port_lutram  tb_single_port_lutram
        (
                        .reset_in(reset_in),
                        .clk_in(clk_in),
                        .access_en_in(access_en_in),
                        .write_en_in(write_en_in),
                        .access_set_addr_in(access_set_addr_in),
                        .write_element_in(write_element_in),
                        .read_element_out(read_element_out)
        );



        parameter PERIOD =10;
        initial begin
                clk_in =0;
                forever begin
                        #(PERIOD/2) clk_in=~clk_in;
                end
        end

        task reset_lutram();
                reset_in=0;
                repeat(5) @(posedge clk_in);
                reset_in=1;
                repeat(5) @(posedge clk_in);
                reset_in=0;
        endtask


 
        initial begin
                integer i;
                $display("****** test for %m begins now\n");
                //reset
                reset_lutram();
                for(i=0;i<NUMBER_SETS;i++)begin
                        @(posedge clk_in);
                        access_set_addr_in=i;
                        $display("@%5tns read adder is :%0d,read data is:%0d\n",$time,access_set_addr_in,read_element_out);
                end

                //write 
                for (i=0;i<NUMBER_SETS;i++)begin
                        @(posedge clk_in);
                        access_en_in=1;
                        write_en_in=1;
                        access_set_addr_in=i;
                        write_element_in<=$random;
                        $display("@%5tns write adder is :%0d,write data is :%0d\n",$time,access_set_addr_in,write_element_in);
                end

                //read 
                for(i=0;i<NUMBER_SETS;i++)begin
                        @(posedge clk_in);
                        access_set_addr_in=i;
                        $display("@%5tns read adder is :%0d,read data is:%0d\n",$time,access_set_addr_in,read_element_out);
                end
                
                //write then read
                for(i=0;i<10;i++)begin
                        @(posedge clk_in);
                        access_en_in=1;
                        write_en_in=1;
                        access_set_addr_in=i;
                        write_element_in<=$random;
                        $display("@%5tns write adder is :%0d,write data is :%0d\n",$time,access_set_addr_in,write_element_in);
                        @(posedge clk_in);
                        $display("@%5tns read adder is :%0d,read data is:%0d\n",$time,access_set_addr_in,read_element_out);
                end
                $finish;

        end


    
        initial begin
                $vcdpluson;
        end

endmodule 


