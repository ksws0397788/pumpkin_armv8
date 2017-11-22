module tb_associative_data_array();




        parameter SINGLE_ELEMENT_SIZE_IN_BITS   = 64;
        parameter NUMBER_SETS                   = 64;
        parameter NUMBER_WAYS                   = 16;
        parameter SET_PTR_WIDTH_IN_BITS         = $clog2(NUMBER_SETS);


        reg                                                          reset_in;
        reg                                                          clk_in;

        reg                                                          access_en_in;
        reg                                                          write_en_in;
        
        reg  [SET_PTR_WIDTH_IN_BITS       - 1 : 0]                   access_set_addr_in;
        reg  [NUMBER_WAYS                 - 1 : 0]                   way_select_in;
        
        wire [SINGLE_ELEMENT_SIZE_IN_BITS - 1 : 0]                   read_single_element_out;
        wire [SINGLE_ELEMENT_SIZE_IN_BITS * NUMBER_WAYS - 1 : 0]     read_set_element_out;
        reg  [SINGLE_ELEMENT_SIZE_IN_BITS - 1 : 0]                   write_single_element_in;

        associative_data_array DUV (
                .reset_in(reset_in),
                .clk_in(clk_in),
                .access_en_in(access_en_in),
                .write_en_in(write_en_in),
                .access_set_addr_in(access_set_addr_in),
                .way_select_in(way_select_in),
                .read_single_element_out(read_single_element_out),
                .read_set_element_out(read_set_element_out),
                .write_single_element_in(write_single_element_in)
        );



        initial begin
                clk_in=0;
                forever begin
                        #5 clk_in=~clk_in;
                end
        end
        task reset_array();
                reset_in=0;
                repeat(5) @(posedge clk_in);
                $display("reset now\n");
                reset_in =1;
                repeat(5) @(posedge clk_in);
                reset_in =0;
        endtask      
        

        initial begin
                integer i;
                $display("********** test for %m begins now ***********\n");

                //reset
                reset_array();

                //write 
                for( i=0;i<NUMBER_WAYS;i++)begin
                        @(posedge clk_in);     
                        way_select_in=0;
                        way_select_in[i]=1'b1;
                        access_en_in=1;
                        write_en_in=1;
                        access_set_addr_in=i;
                        write_single_element_in=$random();
                        $display("@%5tns write array: ways is %b, adder is %0d, data is %0h\n",$time,way_select_in,access_set_addr_in,write_single_element_in);
                end
                @(posedge clk_in);
                access_en_in=0;      

                //read set mode
                                
                for( i=0;i<NUMBER_WAYS;i++)begin   
                        way_select_in=0;
                        way_select_in[i]=1'b1;
                        access_en_in=1;
                        write_en_in=0;
                        access_set_addr_in=i;
                        @(posedge clk_in);  
                        $display("@%5tns read set_array: ways is %b, adder is %0d, data is %0h\n",$time,way_select_in,access_set_addr_in,read_set_element_out);
                end

                //read single mode 
                for( i=0;i<NUMBER_WAYS;i++)begin   
                        way_select_in=0;
                        way_select_in[i]=1'b1;
                        access_en_in=1;
                        write_en_in=0;
                        access_set_addr_in=i;
                        @(posedge clk_in);  
                        $display("@%5tns read single_array: ways is %b, adder is %0d, data is %0h\n",$time,way_select_in,access_set_addr_in,read_single_element_out);
                end









                $finish();
        end

        initial begin
                $vcdpluson();
        end 

    

endmodule