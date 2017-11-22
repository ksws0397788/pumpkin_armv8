module tb_valid_array();

        //
        parameter SINGLE_ELEMENT_SIZE_IN_BITS   = 1;
        parameter NUMBER_SETS                   = 64;
        parameter NUMBER_WAYS                   = 16;
        parameter SET_PTR_WIDTH_IN_BITS         = $clog2(NUMBER_SETS);


        reg                                                           reset_in;
        reg                                                           clk_in;
        reg                                                           access_en_in;
        reg      [SET_PTR_WIDTH_IN_BITS    - 1 : 0]                   access_set_addr_in;     
        reg                                                           write_en_in;
        reg      [NUMBER_WAYS              - 1 : 0]                   write_way_select_in;
        reg      [SINGLE_ELEMENT_SIZE_IN_BITS               - 1 : 0]  write_element_in;
        wire     [SINGLE_ELEMENT_SIZE_IN_BITS * NUMBER_WAYS - 1 : 0]  read_set_valid_out;


        valid_array #(        
            .SINGLE_ELEMENT_SIZE_IN_BITS(SINGLE_ELEMENT_SIZE_IN_BITS),   
            .NUMBER_SETS(NUMBER_SETS),                   
            .NUMBER_WAYS(NUMBER_WAYS),                   
            .SET_PTR_WIDTH_IN_BITS(SET_PTR_WIDTH_IN_BITS)         
        ) DUV_valid_array(

                .reset_in(reset_in),
                .clk_in(clk_in),
                .access_en_in(access_en_in),
                .access_set_addr_in(access_set_addr_in),
                .write_en_in(write_en_in),
                .write_way_select_in(write_way_select_in),
                .write_element_in(write_element_in),
                .read_set_valid_out(read_set_valid_out)

                );

        //
        parameter PERIOD=10;
        initial begin
                clk_in =0;
                forever begin
                      #(PERIOD/2)  clk_in =~clk_in;
                end 
        end 

        task reset_array();
        begin
                reset_in=0;
                repeat(5) @(posedge clk_in);
                reset_in=1;
                access_en_in=0;
                write_en_in=0;
                access_set_addr_in=0;
                write_way_select_in=0;
                write_way_select_in=0;
                $display("reset vaild array\n");
                repeat(5) @(posedge clk_in);
                reset_in=0;
        end 
        endtask


        //
        initial begin   

                integer i;
                $display("********** test for %m begins now ***********\n");

                //reset
                reset_array();

                //write 
                for( i=0;i<NUMBER_WAYS;i++)begin
                        @(posedge clk_in);     
                        write_way_select_in=0;
			            write_way_select_in[i]=1'b1;
                        access_en_in=1;
                        write_en_in=1;
                        access_set_addr_in=i;
                        write_element_in=$random();
                        $display("@%5tns write valid_array: ways is %b, adder is %0d, data is %0d\n",$time,write_way_select_in,access_set_addr_in,write_element_in);
                end
                @(posedge clk_in);
                access_en_in=0;

                //read
                for( i=0;i<NUMBER_WAYS;i++)begin   
                        write_way_select_in=0;
			            write_way_select_in[i]=1'b1;
                        access_en_in=1;
		                write_en_in=0;
                        access_set_addr_in=i;
			            @(posedge clk_in);  
                        $display("@%5tns read valid_array: ways is %b, adder is %0d, data is %16b\n",$time,write_way_select_in,access_set_addr_in,read_set_valid_out);
                end

                $finish();

        end 


        //
        initial begin
                $vcdpluson();
        end 




endmodule
        
