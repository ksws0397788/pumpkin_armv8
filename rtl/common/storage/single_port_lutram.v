module single_port_lutram
#(
        parameter SINGLE_ELEMENT_SIZE_IN_BITS = 64,
        parameter NUMBER_SETS                 = 64,
        parameter SET_PTR_WIDTH_IN_BITS       = $clog2(NUMBER_SETS)
)
(
        input                                                   reset_in,
        input                                                   clk_in,

        input                                                   access_en_in,
        input                                                   write_en_in,
        input      [SET_PTR_WIDTH_IN_BITS       - 1 : 0]        access_set_addr_in,

        input      [SINGLE_ELEMENT_SIZE_IN_BITS - 1 : 0]        write_element_in,
        output    reg [SINGLE_ELEMENT_SIZE_IN_BITS - 1 : 0]        read_element_out
);

reg [SINGLE_ELEMENT_SIZE_IN_BITS - 1 : 0] lutram [NUMBER_SETS - 1 : 0];

integer set_index;

always @(posedge clk_in, posedge reset_in)
begin
        if(reset_in)
        begin
                for(set_index = 0; set_index < NUMBER_SETS; set_index = set_index + 1)
                begin
                        lutram[set_index] <= {(SINGLE_ELEMENT_SIZE_IN_BITS){1'b0}};
                end
        end
        
        else if(access_en_in)
        begin
                if(write_en_in)
                begin
                        lutram[access_set_addr_in] <= write_element_in;
                end
        end

end


always @(posedge clk_in, posedge reset_in)
begin
        if(reset_in)
        begin
                read_element_out <= 0;
        end
        
        else if(access_en_in)
        begin
                if(!write_en_in)
                begin
                        read_element_out <= lutram[access_set_addr_in];
                end
        end
        
end



endmodule
