module spp_main_ctrl
(
        input reset_in,
        input clk_in,

        // input request queue
        output                                                                                                  ack_to_input_request_queue_out,
        input           [`ADDR_WIDTH                                                             - 1 : 0]       access_address_in, 
        input                                                                                                   access_address_valid_in,

        // prefetch output queue
        output reg      [`ADDR_WIDTH                                                             - 1 : 0]       prefetch_to_output_queue_out,
        output reg                                                                                              prefetch_to_output_queue_valid_out,
        input                                                                                                   output_queue_ack_in,

        // signature table
        // sig_tag_common
        output reg                                                                                              access_en_to_sig_tag_out,
        output reg      [$clog2(`SIG_TABLE_SET)                                                  - 1 : 0]       access_set_addr_to_sig_tag_out,
        output reg                                                                                              write_en_to_sig_tag_out,
        output reg      [`SIG_TABLE_ASSOCIATIVITY                                                - 1 : 0]       way_select_to_sig_tag_out,
                
        // sig valid array
        input           [`SIG_TABLE_ASSOCIATIVITY                                                - 1 : 0]       read_set_page_valid_in,

        // sig page tag array
        input           [`SIG_PAGE_NUM_TAG_BITS * `SIG_TABLE_ASSOCIATIVITY                       - 1 : 0]       read_set_page_tag_in,
        output reg      [`SIG_PAGE_NUM_TAG_BITS                                                  - 1 : 0]       write_page_tag_out,

        // sig_data_common
        output reg                                                                                              access_en_to_sig_data_out,
        output reg      [$clog2(`SIG_TABLE_SET)                                                  - 1 : 0]       access_set_addr_to_sig_data_out,
        output reg                                                                                              write_en_to_sig_data_out,
        output reg      [`SIG_TABLE_ASSOCIATIVITY                                                - 1 : 0]       way_select_to_sig_data_out,

        // sig array
        input           [`SIG_LENTH * `SIG_TABLE_ASSOCIATIVITY                                   - 1 : 0]       read_set_sig_in,
        output reg      [`SIG_LENTH                                                              - 1 : 0]       write_sig_out,

        // sig blockID array
        input           [5:0]                                                                                   read_sig_blockID_in,    
        output reg      [5:0]                                                                                   write_sig_blockID_out,

        // pattern table
        // pt_sig_tag_common
        output reg                                                                                              access_en_to_pt_sig_tag_out,
        output reg      [$clog2(`PT_TABLE_SIG_SET)                                               - 1 : 0]       access_set_addr_to_pt_sig_tag_out,
        output reg                                                                                              way_select_to_pt_sig_tag_out,
        output reg      [`PT_TABLE_SIG_ASSOCIATIVITY                                             - 1 : 0]       write_en_to_pt_sig_tag_out,

        // pt_sig_valid
        input           [`PT_TABLE_SIG_ASSOCIATIVITY                                             - 1 : 0]       read_set_pt_valid_in,

        // pt_sig_tag
        input           [`PT_TABLE_SIG_TAG_BITS * `PT_TABLE_SIG_ASSOCIATIVITY                    - 1 : 0]       read_set_pt_sig_tag_in,
        output reg      [`PT_TABLE_SIG_TAG_BITS                                                  - 1 : 0]       write_pt_sig_tag_out,

        // pt_sig_counter
        output reg                                                                                              access_en_to_pt_sig_data_out,
        output reg      [$clog2(`PT_TABLE_SIG_SET)                                               - 1 : 0]       access_set_addr_to_pt_sig_data_out,
        output reg                                                                                              way_select_to_pt_sig_data_out,
        output reg      [`PT_TABLE_SIG_ASSOCIATIVITY                                             - 1 : 0]       write_en_to_pt_sig_data_out,
                
        input           [`PT_TABLE_SIG_COUNTER_BITS * `PT_TABLE_SIG_COUNTER_BITS                 - 1 : 0]       read_set_pt_sig_counter_in,
        output reg      [`PT_TABLE_SIG_COUNTER_BITS                                              - 1 : 0]       write_pt_sig_counter_out,

                
        // pt_delta_tag_common
        output reg                                                                                              access_en_to_pt_delta_tag_out,
        output reg      [$clog2(`PT_TABLE_DELTA_SET)                                             - 1 : 0]       access_set_addr_to_pt_delta_tag_out,
        output reg      [`PT_TABLE_DELTA_ASSOCIATIVITY                                           - 1 : 0]       way_select_to_pt_delta_tag_out,
        output reg                                                                                              write_en_to_pt_delta_tag_out,

        // pt_delta_valid
        input           [`PT_TABLE_DELTA_ASSOCIATIVITY                                           - 1 : 0]       read_set_pt_delta_valid_in,
                        
        // pt_delta
        input           [`PT_TABLE_DELTA_ASSOCIATIVITY * `DELTA_BITS                             - 1 : 0]       read_set_pt_delta_in,
        output reg      [`DELTA_BITS                                                             - 1 : 0]       write_pt_delta_out,

        // pt_delta_counter
        output reg                                                                                              access_en_to_pt_delta_data_out,
        output reg      [$clog2(`PT_TABLE_DELTA_SET)                                             - 1 : 0]       access_set_addr_to_pt_delta_data_out,
        output reg      [`PT_TABLE_DELTA_ASSOCIATIVITY                                           - 1 : 0]       way_select_to_pt_delta_data_out,
        output reg                                                                                              write_en_to_pt_delta_data_out,
                
        input           [`PT_TABLE_DELTA_COUNTER_BITS * `PT_TABLE_DELTA_ASSOCIATIVITY            - 1 : 0]       read_set_pt_delta_counter_in,
        output reg      [`PT_TABLE_DELTA_COUNTER_BITS                                            - 1 : 0]       write_pt_delta_counter_out
);

`define IDLE                                                            0
`define SIG_TABLE_ACCESS                                                1
`define SIG_TABLE_UPDATE_AND_PATTERN_TABLE_SIG_ACCESS                   2
`define PATTERN_TABLE_SIG_UPDATE_AND_PATTERN_TABLE_DELTA_ACCESS         3
`define PATTERN_TABLE_DELTA_UPDATE_AND_PREFETCH_ISSUE                   4

reg [2:0] stage;

always@(posedge clk_in, posedge reset_in)
begin
        if(reset_in)
        begin
                stage <= `IDLE;
        end

        else
        begin
                case(stage)
                begin 

                        `IDLE :
                        begin
                                if(access_address_valid_in) 
                                begin
                                        stage <= `SIG_TABLE_ACCESS;
                                end
                        end

                        `SIG_TABLE_ACCESS:
                        begin
                                if(1) 
                                begin
                                        stage <= stage + 1'b1;
                                end
                        end

                        `SIG_TABLE_UPDATE_AND_PATTERN_TABLE_SIG_ACCESS:
                        begin
                                if(1) 
                                begin
                                        stage <= stage + 1'b1;
                                end
                        end

                        `PATTERN_TABLE_SIG_UPDATE_AND_PATTERN_TABLE_DELTA_ACCESS:
                        begin
                                if(1) 
                                begin
                                        stage <= stage + 1'b1;
                                end
                        end

                        `PATTERN_TABLE_DELTA_UPDATE_AND_PREFETCH_ISSUE:
                        begin
                                if(1) 
                                begin
                                        stage <= `IDLE;
                                end
                        end

                endcase
        end
end

// sig table aux signals
wire [`SIG_TABLE_ASSOCIATIVITY - 1 : 0] page_matched_vector;
wire [5:0]                              current_blockID = access_address_in[11:6];
wire [5:0]                              last_blockID    = read_sig_blockID_in[page_matched_index];
wire [6:0]                              blockID_delta   = current_blockID - last_blockID;

reg  [`SIG_TABLE_ASSOCIATIVITY - 1 : 0] sig_table_replace_ptr;
reg  [`SIG_LENTH - 1 : 0]               signature_to_pt_access;
reg  [6:0]                              blockID_delta_to_pt_access;
reg                                     sig_table_hit;
reg  [31:0]                             page_matched_index;

generate
        genvar gen;

        for(gen = 0; gen < `SIG_TABLE_ASSOCIATIVITY; gen = gen + 1)
        begin
                assign page_matched_vector[gen] = read_set_page_valid_in[gen] & 
                                         ( read_set_page_tag_in[(gen+1) * `SIG_PAGE_NUM_TAG_BITS - 1 : gen * `SIG_PAGE_NUM_TAG_BITS] == 
                                         ( (access_address_in >> (12 + `SIG_PAGE_SET_INDEX_BITS)) & (`SIG_PAGE_NUM_TAG_BITS - 1)));
        end
endgenerate

`define encoder_case(count) { {(`SIG_TABLE_ASSOCIATIVITY - (count) - 1){1'b1}}, {{1'b0}}, {(count){1'bx}} } : page_matched_index <= (count)
always@(*)
begin
    casex(page_matched_vector)
    
    default:
    begin
        page_matched_index <= 0;    
    end 
       
        `encoder_case(1);
        `encoder_case(2);
        `encoder_case(3);
        `encoder_case(4);
        `encoder_case(5);
        `encoder_case(6);
        `encoder_case(7);
        `encoder_case(8);
        `encoder_case(9);
        `encoder_case(10);
        `encoder_case(11);
        `encoder_case(12);
        `encoder_case(13);
        `encoder_case(14);
        `encoder_case(15);
        `encoder_case(16);
        `encoder_case(17);
        `encoder_case(18);
        `encoder_case(19);
        `encoder_case(20);
        `encoder_case(21);
        `encoder_case(22);
        `encoder_case(23);
        `encoder_case(24);
        `encoder_case(25);
        `encoder_case(26);
        `encoder_case(27);
        `encoder_case(28);
        `encoder_case(29);
        `encoder_case(30);
        `encoder_case(31);
        
   endcase
end

// sig_table
always@(posedge clk_in, posedge reset_in)
begin
        if(reset)
        begin
                access_en_to_sig_tag_out        <= 1'b0;
                access_set_addr_to_sig_tag_out  <= {($clog2(`SIG_TABLE_SET)){1'b0}};
                write_en_to_sig_tag_out         <= 1'b0;
                way_select_to_sig_tag_out       <= {(`SIG_TABLE_ASSOCIATIVITY){1'b0}};
                write_page_tag_out              <= {(`SIG_PAGE_NUM_TAG_BITS){1'b0}};

                access_en_to_sig_data_out       <= 1'b0;
                access_set_addr_to_sig_data_out <= {($clog2(`SIG_TABLE_SET)){1'b0}};
                write_en_to_sig_data_out        <= 1'b0;
                way_select_to_sig_data_out      <= {(`SIG_TABLE_ASSOCIATIVITY){1'b0}};

                write_sig_out                   <= {(`SIG_LENTH){1'b0}};
                write_sig_blockID_out           <= 6'b0;

                signature_to_pt_access          <= {(`SIG_LENTH){1'b0}};
                blockID_delta_to_pt_access      <= 7'b0;
                sig_table_hit                   <= 1'b0;

                sig_table_replace_ptr           <= {1'b1, (`SIG_TABLE_ASSOCIATIVITY-1){1'b0}};
        end

        else
        begin
                case(stage)
                begin
                        `IDLE:
                        begin
                                if(stage == `IDLE & access_address_valid_in)
                                begin
                                        access_en_to_sig_tag_out        <= 1'b1;
                                        access_set_addr_to_sig_tag_out  <= (access_address_in >> 12);
                                        write_en_to_sig_tag_out         <= 1'b0;
                                        way_select_to_sig_tag_out       <= {(`SIG_TABLE_ASSOCIATIVITY){1'b1}};
                                        write_page_tag_out              <= {(`SIG_PAGE_NUM_TAG_BITS){1'b0}};

                                        access_en_to_sig_data_out       <= 1'b1;
                                        access_set_addr_to_sig_data_out <= (access_address_in >> 12);
                                        write_en_to_sig_data_out        <= 1'b0;
                                        way_select_to_sig_data_out      <= {(`SIG_TABLE_ASSOCIATIVITY){1'b1}};

                                        write_sig_out                   <= {(`SIG_LENTH){1'b0}};
                                        write_sig_blockID_out           <= 6'b0;
                                end
                        end

                        `SIG_TABLE_ACCESS:
                        begin
                                // page matched
                                if(|page_matched_vector)
                                begin
                                        access_en_to_sig_tag_out        <= 1'b0;
                                        access_set_addr_to_sig_tag_out  <= {($clog2(`SIG_TABLE_SET)){1'b0}};
                                        write_en_to_sig_tag_out         <= 1'b0;
                                        way_select_to_sig_tag_out       <= {(`SIG_TABLE_ASSOCIATIVITY){1'b0}};
                                        write_page_tag_out              <= {(`SIG_PAGE_NUM_TAG_BITS){1'b0}};

                                        access_en_to_sig_data_out       <= 1'b1;
                                        access_set_addr_to_sig_data_out <= (access_address_in >> 12);
                                        write_en_to_sig_data_out        <= 1'b1;
                                        way_select_to_sig_data_out      <= page_matched_vector;

                                        write_sig_out                   <= ((read_set_sig_in[page_matched_index] << `SIG_SHIFT) ^ blockID_delta) & {(`SIG_LENTH){1'b1}};
                                        write_sig_blockID_out           <= 6'b0;

                                        sig_table_hit                   <= 1'b1;
                                        signature_to_pt_access          <= read_set_sig_in[page_matched_index];
                                        blockID_delta_to_pt_access      <= blockID_delta;

                                        sig_table_replace_ptr           <= sig_table_replace_ptr;
                                end

                                // page miss
                                else
                                begin
                                        access_en_to_sig_tag_out        <= 1'b1;
                                        access_set_addr_to_sig_tag_out  <= (access_address_in >> 12);
                                        write_en_to_sig_tag_out         <= 1'b1;
                                        way_select_to_sig_tag_out       <= sig_table_replace_ptr;
                                        write_page_tag_out              <= (access_address_in >> (12 + `SIG_PAGE_SET_INDEX_BITS)) & (`SIG_PAGE_NUM_TAG_BITS - 1));

                                        access_en_to_sig_data_out       <= 1'b1;
                                        access_set_addr_to_sig_data_out <= (access_address_in >> 12);
                                        write_en_to_sig_data_out        <= 1'b1;
                                        way_select_to_sig_data_out      <= page_matched_vector;

                                        write_sig_out                   <= current_blockID;
                                        write_sig_blockID_out           <= current_blockID;

                                        sig_table_hit                   <= 1'b0;
                                        signature_to_pt_access          <= 0;
                                        blockID_delta_to_pt_access      <= 0;

                                        sig_table_replace_ptr           <= (sig_table_replace_ptr >> 1) | (sig_table_replace_ptr<<(`SIG_TABLE_ASSOCIATIVITY-1)); // right rorate
                                end
                        end

                        default:
                        begin
                                access_en_to_sig_tag_out        <= 1'b0;
                                access_set_addr_to_sig_tag_out  <= {($clog2(`SIG_TABLE_SET)){1'b0}};
                                write_en_to_sig_tag_out         <= 1'b0;
                                way_select_to_sig_tag_out       <= {(`SIG_TABLE_ASSOCIATIVITY){1'b0}};
                                write_page_tag_out              <= {(`SIG_PAGE_NUM_TAG_BITS){1'b0}};

                                access_en_to_sig_data_out       <= 1'b0;
                                access_set_addr_to_sig_data_out <= {($clog2(`SIG_TABLE_SET)){1'b0}};
                                write_en_to_sig_data_out        <= 1'b0;
                                way_select_to_sig_data_out      <= {(`SIG_TABLE_ASSOCIATIVITY){1'b0}};

                                write_sig_out                   <= {(`SIG_LENTH){1'b0}};
                                write_sig_blockID_out           <= 6'b0;

                                signature_to_pt_access          <= {(`SIG_LENTH){1'b0}};
                                blockID_delta_to_pt_access      <= 7'b0;
                                sig_table_hit                   <= 1'b0;

                                sig_table_replace_ptr           <= {1'b1, (`SIG_TABLE_ASSOCIATIVITY-1){1'b0}};
                        end
                endcase
        end
end

// pattern table
always@(posedge clk_in, posedge reset_in)
begin
        if(reset)
        begin
                access_en_to_pt_sig_tag_out                     <= 1'b0;
                access_set_addr_to_pt_sig_tag_out               <= {($clog2(`PT_TABLE_SIG_SET)){1'b0}};
                way_select_to_pt_sig_tag_out                    <= {(`PT_TABLE_SIG_ASSOCIATIVITY){1'b0}};
                write_en_to_pt_sig_tag_out                      <= 1'b0;
                write_pt_sig_tag_out                            <= {(`PT_TABLE_SIG_TAG_BITS){1'b0}};
                
                access_en_to_pt_sig_data_out                    <= 1'b0;
                access_set_addr_to_pt_sig_data_out              <= {($clog2(`PT_TABLE_SIG_SET)){1'b0}};
                way_select_to_pt_sig_data_out                   <= {(`PT_TABLE_SIG_ASSOCIATIVITY){1'b0}};
                write_en_to_pt_sig_data_out                     <= 1'b0;
                write_pt_sig_counter_out                        <= {(`PT_TABLE_SIG_COUNTER_BITS){1'b0}};

                access_en_to_pt_delta_tag_out                   <= 1'b0;
                access_set_addr_to_pt_delta_tag_out             <= {($clog2(`PT_TABLE_DELTA_SET)){1'b0}};
                way_select_to_pt_delta_tag_out                  <= {(`PT_TABLE_DELTA_ASSOCIATIVITY){1'b0}};
                write_en_to_pt_delta_tag_out                    <= 1'b0;
                write_pt_delta_out                              <= {(`DELTA_BITS){1'b0}};

                access_en_to_pt_delta_data_out                  <= 1'b0;
                access_set_addr_to_pt_delta_data_out            <= {($clog2(`PT_TABLE_DELTA_SET)){1'b0}};
                way_select_to_pt_delta_data_out                 <= {(`PT_TABLE_DELTA_ASSOCIATIVITY){1'b0}};
                write_en_to_pt_delta_data_out                   <= 1'b0;
                write_pt_delta_counter_out                      <= {(`PT_TABLE_DELTA_COUNTER_BITS){1'b0}};
        end

        else
        begin
                case(stage)

                `SIG_TABLE_UPDATE_AND_PATTERN_TABLE_SIG_ACCESS
                begin
                        
                end


        end
end

read_set_pt_valid_in
read_set_pt_sig_tag_in
read_set_pt_sig_counter_in
read_set_pt_delta_valid_in
read_set_pt_delta_in
read_set_pt_delta_counter_in