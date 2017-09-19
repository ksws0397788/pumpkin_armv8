// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1733598 Wed Dec 14 22:35:42 MST 2016
// Date        : Thu Aug 10 17:35:19 2017
// Host        : ubuntu running 64-bit Ubuntu 17.04
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/pobu/codes/pumpkin_ARMv8/working_temp/unit_test_single_port_blockram/single_port_blockram.sim/sim_1/impl/timing/single_port_blockram_testbench_time_impl.v
// Design      : single_port_blockram
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7vx690tffg1761-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "5614fab2" *) (* NUMBER_SETS = "64" *) (* POWER_OPT_BRAM_CDC = "0" *) 
(* POWER_OPT_BRAM_SR_ADDR = "0" *) (* POWER_OPT_LOOPED_NET_PERCENTAGE = "0" *) (* SET_PTR_WIDTH_IN_BITS = "6" *) 
(* SINGLE_ELEMENT_SIZE_IN_BITS = "64" *) 
(* NotValidForBitStream *)
module single_port_blockram
   (clk_in,
    access_en_in,
    write_en_in,
    access_set_addr_in,
    write_element_in,
    read_element_out);
  input clk_in;
  input access_en_in;
  input write_en_in;
  input [5:0]access_set_addr_in;
  input [63:0]write_element_in;
  output [63:0]read_element_out;

  wire access_en_in;
  wire access_en_in_IBUF;
  wire [5:0]access_set_addr_in;
  wire [5:0]access_set_addr_in_IBUF;
  wire clk_in;
  wire clk_in_IBUF;
  wire clk_in_IBUF_BUFG;
  wire [63:0]read_element_out;
  wire [63:0]read_element_out_OBUF;
  wire [63:0]write_element_in;
  wire [63:0]write_element_in_IBUF;
  wire write_en_in;
  wire write_en_in_IBUF;
  wire [15:10]NLW_blockram_reg_1_DOBDO_UNCONNECTED;
  wire [1:0]NLW_blockram_reg_1_DOPBDOP_UNCONNECTED;

initial begin
 $sdf_annotate("single_port_blockram_testbench_time_impl.sdf",,,,"tool_control");
end
  IBUF access_en_in_IBUF_inst
       (.I(access_en_in),
        .O(access_en_in_IBUF));
  IBUF \access_set_addr_in_IBUF[0]_inst 
       (.I(access_set_addr_in[0]),
        .O(access_set_addr_in_IBUF[0]));
  IBUF \access_set_addr_in_IBUF[1]_inst 
       (.I(access_set_addr_in[1]),
        .O(access_set_addr_in_IBUF[1]));
  IBUF \access_set_addr_in_IBUF[2]_inst 
       (.I(access_set_addr_in[2]),
        .O(access_set_addr_in_IBUF[2]));
  IBUF \access_set_addr_in_IBUF[3]_inst 
       (.I(access_set_addr_in[3]),
        .O(access_set_addr_in_IBUF[3]));
  IBUF \access_set_addr_in_IBUF[4]_inst 
       (.I(access_set_addr_in[4]),
        .O(access_set_addr_in_IBUF[4]));
  IBUF \access_set_addr_in_IBUF[5]_inst 
       (.I(access_set_addr_in[5]),
        .O(access_set_addr_in_IBUF[5]));
  (* CLOCK_DOMAINS = "COMMON" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "4096" *) 
  (* RTL_RAM_NAME = "blockram" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "63" *) 
  (* bram_ext_slice_begin = "18" *) 
  (* bram_ext_slice_end = "35" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "17" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("NO_CHANGE"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    blockram_reg_0
       (.ADDRARDADDR({1'b0,1'b1,1'b1,1'b1,access_set_addr_in_IBUF,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,access_set_addr_in_IBUF,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk_in_IBUF_BUFG),
        .CLKBWRCLK(clk_in_IBUF_BUFG),
        .DIADI(write_element_in_IBUF[15:0]),
        .DIBDI(write_element_in_IBUF[33:18]),
        .DIPADIP(write_element_in_IBUF[17:16]),
        .DIPBDIP(write_element_in_IBUF[35:34]),
        .DOADO(read_element_out_OBUF[15:0]),
        .DOBDO(read_element_out_OBUF[33:18]),
        .DOPADOP(read_element_out_OBUF[17:16]),
        .DOPBDOP(read_element_out_OBUF[35:34]),
        .ENARDEN(access_en_in_IBUF),
        .ENBWREN(access_en_in_IBUF),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({write_en_in_IBUF,write_en_in_IBUF}),
        .WEBWE({1'b0,1'b0,write_en_in_IBUF,write_en_in_IBUF}));
  (* CLOCK_DOMAINS = "COMMON" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d10" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "4096" *) 
  (* RTL_RAM_NAME = "blockram" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "63" *) 
  (* bram_ext_slice_begin = "54" *) 
  (* bram_ext_slice_end = "63" *) 
  (* bram_slice_begin = "36" *) 
  (* bram_slice_end = "53" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("NO_CHANGE"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    blockram_reg_1
       (.ADDRARDADDR({1'b0,1'b1,1'b1,1'b1,access_set_addr_in_IBUF,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,access_set_addr_in_IBUF,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk_in_IBUF_BUFG),
        .CLKBWRCLK(clk_in_IBUF_BUFG),
        .DIADI(write_element_in_IBUF[51:36]),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,write_element_in_IBUF[63:54]}),
        .DIPADIP(write_element_in_IBUF[53:52]),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO(read_element_out_OBUF[51:36]),
        .DOBDO({NLW_blockram_reg_1_DOBDO_UNCONNECTED[15:10],read_element_out_OBUF[63:54]}),
        .DOPADOP(read_element_out_OBUF[53:52]),
        .DOPBDOP(NLW_blockram_reg_1_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(access_en_in_IBUF),
        .ENBWREN(access_en_in_IBUF),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({write_en_in_IBUF,write_en_in_IBUF}),
        .WEBWE({1'b0,1'b0,write_en_in_IBUF,write_en_in_IBUF}));
  BUFG clk_in_IBUF_BUFG_inst
       (.I(clk_in_IBUF),
        .O(clk_in_IBUF_BUFG));
  IBUF clk_in_IBUF_inst
       (.I(clk_in),
        .O(clk_in_IBUF));
  OBUF \read_element_out_OBUF[0]_inst 
       (.I(read_element_out_OBUF[0]),
        .O(read_element_out[0]));
  OBUF \read_element_out_OBUF[10]_inst 
       (.I(read_element_out_OBUF[10]),
        .O(read_element_out[10]));
  OBUF \read_element_out_OBUF[11]_inst 
       (.I(read_element_out_OBUF[11]),
        .O(read_element_out[11]));
  OBUF \read_element_out_OBUF[12]_inst 
       (.I(read_element_out_OBUF[12]),
        .O(read_element_out[12]));
  OBUF \read_element_out_OBUF[13]_inst 
       (.I(read_element_out_OBUF[13]),
        .O(read_element_out[13]));
  OBUF \read_element_out_OBUF[14]_inst 
       (.I(read_element_out_OBUF[14]),
        .O(read_element_out[14]));
  OBUF \read_element_out_OBUF[15]_inst 
       (.I(read_element_out_OBUF[15]),
        .O(read_element_out[15]));
  OBUF \read_element_out_OBUF[16]_inst 
       (.I(read_element_out_OBUF[16]),
        .O(read_element_out[16]));
  OBUF \read_element_out_OBUF[17]_inst 
       (.I(read_element_out_OBUF[17]),
        .O(read_element_out[17]));
  OBUF \read_element_out_OBUF[18]_inst 
       (.I(read_element_out_OBUF[18]),
        .O(read_element_out[18]));
  OBUF \read_element_out_OBUF[19]_inst 
       (.I(read_element_out_OBUF[19]),
        .O(read_element_out[19]));
  OBUF \read_element_out_OBUF[1]_inst 
       (.I(read_element_out_OBUF[1]),
        .O(read_element_out[1]));
  OBUF \read_element_out_OBUF[20]_inst 
       (.I(read_element_out_OBUF[20]),
        .O(read_element_out[20]));
  OBUF \read_element_out_OBUF[21]_inst 
       (.I(read_element_out_OBUF[21]),
        .O(read_element_out[21]));
  OBUF \read_element_out_OBUF[22]_inst 
       (.I(read_element_out_OBUF[22]),
        .O(read_element_out[22]));
  OBUF \read_element_out_OBUF[23]_inst 
       (.I(read_element_out_OBUF[23]),
        .O(read_element_out[23]));
  OBUF \read_element_out_OBUF[24]_inst 
       (.I(read_element_out_OBUF[24]),
        .O(read_element_out[24]));
  OBUF \read_element_out_OBUF[25]_inst 
       (.I(read_element_out_OBUF[25]),
        .O(read_element_out[25]));
  OBUF \read_element_out_OBUF[26]_inst 
       (.I(read_element_out_OBUF[26]),
        .O(read_element_out[26]));
  OBUF \read_element_out_OBUF[27]_inst 
       (.I(read_element_out_OBUF[27]),
        .O(read_element_out[27]));
  OBUF \read_element_out_OBUF[28]_inst 
       (.I(read_element_out_OBUF[28]),
        .O(read_element_out[28]));
  OBUF \read_element_out_OBUF[29]_inst 
       (.I(read_element_out_OBUF[29]),
        .O(read_element_out[29]));
  OBUF \read_element_out_OBUF[2]_inst 
       (.I(read_element_out_OBUF[2]),
        .O(read_element_out[2]));
  OBUF \read_element_out_OBUF[30]_inst 
       (.I(read_element_out_OBUF[30]),
        .O(read_element_out[30]));
  OBUF \read_element_out_OBUF[31]_inst 
       (.I(read_element_out_OBUF[31]),
        .O(read_element_out[31]));
  OBUF \read_element_out_OBUF[32]_inst 
       (.I(read_element_out_OBUF[32]),
        .O(read_element_out[32]));
  OBUF \read_element_out_OBUF[33]_inst 
       (.I(read_element_out_OBUF[33]),
        .O(read_element_out[33]));
  OBUF \read_element_out_OBUF[34]_inst 
       (.I(read_element_out_OBUF[34]),
        .O(read_element_out[34]));
  OBUF \read_element_out_OBUF[35]_inst 
       (.I(read_element_out_OBUF[35]),
        .O(read_element_out[35]));
  OBUF \read_element_out_OBUF[36]_inst 
       (.I(read_element_out_OBUF[36]),
        .O(read_element_out[36]));
  OBUF \read_element_out_OBUF[37]_inst 
       (.I(read_element_out_OBUF[37]),
        .O(read_element_out[37]));
  OBUF \read_element_out_OBUF[38]_inst 
       (.I(read_element_out_OBUF[38]),
        .O(read_element_out[38]));
  OBUF \read_element_out_OBUF[39]_inst 
       (.I(read_element_out_OBUF[39]),
        .O(read_element_out[39]));
  OBUF \read_element_out_OBUF[3]_inst 
       (.I(read_element_out_OBUF[3]),
        .O(read_element_out[3]));
  OBUF \read_element_out_OBUF[40]_inst 
       (.I(read_element_out_OBUF[40]),
        .O(read_element_out[40]));
  OBUF \read_element_out_OBUF[41]_inst 
       (.I(read_element_out_OBUF[41]),
        .O(read_element_out[41]));
  OBUF \read_element_out_OBUF[42]_inst 
       (.I(read_element_out_OBUF[42]),
        .O(read_element_out[42]));
  OBUF \read_element_out_OBUF[43]_inst 
       (.I(read_element_out_OBUF[43]),
        .O(read_element_out[43]));
  OBUF \read_element_out_OBUF[44]_inst 
       (.I(read_element_out_OBUF[44]),
        .O(read_element_out[44]));
  OBUF \read_element_out_OBUF[45]_inst 
       (.I(read_element_out_OBUF[45]),
        .O(read_element_out[45]));
  OBUF \read_element_out_OBUF[46]_inst 
       (.I(read_element_out_OBUF[46]),
        .O(read_element_out[46]));
  OBUF \read_element_out_OBUF[47]_inst 
       (.I(read_element_out_OBUF[47]),
        .O(read_element_out[47]));
  OBUF \read_element_out_OBUF[48]_inst 
       (.I(read_element_out_OBUF[48]),
        .O(read_element_out[48]));
  OBUF \read_element_out_OBUF[49]_inst 
       (.I(read_element_out_OBUF[49]),
        .O(read_element_out[49]));
  OBUF \read_element_out_OBUF[4]_inst 
       (.I(read_element_out_OBUF[4]),
        .O(read_element_out[4]));
  OBUF \read_element_out_OBUF[50]_inst 
       (.I(read_element_out_OBUF[50]),
        .O(read_element_out[50]));
  OBUF \read_element_out_OBUF[51]_inst 
       (.I(read_element_out_OBUF[51]),
        .O(read_element_out[51]));
  OBUF \read_element_out_OBUF[52]_inst 
       (.I(read_element_out_OBUF[52]),
        .O(read_element_out[52]));
  OBUF \read_element_out_OBUF[53]_inst 
       (.I(read_element_out_OBUF[53]),
        .O(read_element_out[53]));
  OBUF \read_element_out_OBUF[54]_inst 
       (.I(read_element_out_OBUF[54]),
        .O(read_element_out[54]));
  OBUF \read_element_out_OBUF[55]_inst 
       (.I(read_element_out_OBUF[55]),
        .O(read_element_out[55]));
  OBUF \read_element_out_OBUF[56]_inst 
       (.I(read_element_out_OBUF[56]),
        .O(read_element_out[56]));
  OBUF \read_element_out_OBUF[57]_inst 
       (.I(read_element_out_OBUF[57]),
        .O(read_element_out[57]));
  OBUF \read_element_out_OBUF[58]_inst 
       (.I(read_element_out_OBUF[58]),
        .O(read_element_out[58]));
  OBUF \read_element_out_OBUF[59]_inst 
       (.I(read_element_out_OBUF[59]),
        .O(read_element_out[59]));
  OBUF \read_element_out_OBUF[5]_inst 
       (.I(read_element_out_OBUF[5]),
        .O(read_element_out[5]));
  OBUF \read_element_out_OBUF[60]_inst 
       (.I(read_element_out_OBUF[60]),
        .O(read_element_out[60]));
  OBUF \read_element_out_OBUF[61]_inst 
       (.I(read_element_out_OBUF[61]),
        .O(read_element_out[61]));
  OBUF \read_element_out_OBUF[62]_inst 
       (.I(read_element_out_OBUF[62]),
        .O(read_element_out[62]));
  OBUF \read_element_out_OBUF[63]_inst 
       (.I(read_element_out_OBUF[63]),
        .O(read_element_out[63]));
  OBUF \read_element_out_OBUF[6]_inst 
       (.I(read_element_out_OBUF[6]),
        .O(read_element_out[6]));
  OBUF \read_element_out_OBUF[7]_inst 
       (.I(read_element_out_OBUF[7]),
        .O(read_element_out[7]));
  OBUF \read_element_out_OBUF[8]_inst 
       (.I(read_element_out_OBUF[8]),
        .O(read_element_out[8]));
  OBUF \read_element_out_OBUF[9]_inst 
       (.I(read_element_out_OBUF[9]),
        .O(read_element_out[9]));
  IBUF \write_element_in_IBUF[0]_inst 
       (.I(write_element_in[0]),
        .O(write_element_in_IBUF[0]));
  IBUF \write_element_in_IBUF[10]_inst 
       (.I(write_element_in[10]),
        .O(write_element_in_IBUF[10]));
  IBUF \write_element_in_IBUF[11]_inst 
       (.I(write_element_in[11]),
        .O(write_element_in_IBUF[11]));
  IBUF \write_element_in_IBUF[12]_inst 
       (.I(write_element_in[12]),
        .O(write_element_in_IBUF[12]));
  IBUF \write_element_in_IBUF[13]_inst 
       (.I(write_element_in[13]),
        .O(write_element_in_IBUF[13]));
  IBUF \write_element_in_IBUF[14]_inst 
       (.I(write_element_in[14]),
        .O(write_element_in_IBUF[14]));
  IBUF \write_element_in_IBUF[15]_inst 
       (.I(write_element_in[15]),
        .O(write_element_in_IBUF[15]));
  IBUF \write_element_in_IBUF[16]_inst 
       (.I(write_element_in[16]),
        .O(write_element_in_IBUF[16]));
  IBUF \write_element_in_IBUF[17]_inst 
       (.I(write_element_in[17]),
        .O(write_element_in_IBUF[17]));
  IBUF \write_element_in_IBUF[18]_inst 
       (.I(write_element_in[18]),
        .O(write_element_in_IBUF[18]));
  IBUF \write_element_in_IBUF[19]_inst 
       (.I(write_element_in[19]),
        .O(write_element_in_IBUF[19]));
  IBUF \write_element_in_IBUF[1]_inst 
       (.I(write_element_in[1]),
        .O(write_element_in_IBUF[1]));
  IBUF \write_element_in_IBUF[20]_inst 
       (.I(write_element_in[20]),
        .O(write_element_in_IBUF[20]));
  IBUF \write_element_in_IBUF[21]_inst 
       (.I(write_element_in[21]),
        .O(write_element_in_IBUF[21]));
  IBUF \write_element_in_IBUF[22]_inst 
       (.I(write_element_in[22]),
        .O(write_element_in_IBUF[22]));
  IBUF \write_element_in_IBUF[23]_inst 
       (.I(write_element_in[23]),
        .O(write_element_in_IBUF[23]));
  IBUF \write_element_in_IBUF[24]_inst 
       (.I(write_element_in[24]),
        .O(write_element_in_IBUF[24]));
  IBUF \write_element_in_IBUF[25]_inst 
       (.I(write_element_in[25]),
        .O(write_element_in_IBUF[25]));
  IBUF \write_element_in_IBUF[26]_inst 
       (.I(write_element_in[26]),
        .O(write_element_in_IBUF[26]));
  IBUF \write_element_in_IBUF[27]_inst 
       (.I(write_element_in[27]),
        .O(write_element_in_IBUF[27]));
  IBUF \write_element_in_IBUF[28]_inst 
       (.I(write_element_in[28]),
        .O(write_element_in_IBUF[28]));
  IBUF \write_element_in_IBUF[29]_inst 
       (.I(write_element_in[29]),
        .O(write_element_in_IBUF[29]));
  IBUF \write_element_in_IBUF[2]_inst 
       (.I(write_element_in[2]),
        .O(write_element_in_IBUF[2]));
  IBUF \write_element_in_IBUF[30]_inst 
       (.I(write_element_in[30]),
        .O(write_element_in_IBUF[30]));
  IBUF \write_element_in_IBUF[31]_inst 
       (.I(write_element_in[31]),
        .O(write_element_in_IBUF[31]));
  IBUF \write_element_in_IBUF[32]_inst 
       (.I(write_element_in[32]),
        .O(write_element_in_IBUF[32]));
  IBUF \write_element_in_IBUF[33]_inst 
       (.I(write_element_in[33]),
        .O(write_element_in_IBUF[33]));
  IBUF \write_element_in_IBUF[34]_inst 
       (.I(write_element_in[34]),
        .O(write_element_in_IBUF[34]));
  IBUF \write_element_in_IBUF[35]_inst 
       (.I(write_element_in[35]),
        .O(write_element_in_IBUF[35]));
  IBUF \write_element_in_IBUF[36]_inst 
       (.I(write_element_in[36]),
        .O(write_element_in_IBUF[36]));
  IBUF \write_element_in_IBUF[37]_inst 
       (.I(write_element_in[37]),
        .O(write_element_in_IBUF[37]));
  IBUF \write_element_in_IBUF[38]_inst 
       (.I(write_element_in[38]),
        .O(write_element_in_IBUF[38]));
  IBUF \write_element_in_IBUF[39]_inst 
       (.I(write_element_in[39]),
        .O(write_element_in_IBUF[39]));
  IBUF \write_element_in_IBUF[3]_inst 
       (.I(write_element_in[3]),
        .O(write_element_in_IBUF[3]));
  IBUF \write_element_in_IBUF[40]_inst 
       (.I(write_element_in[40]),
        .O(write_element_in_IBUF[40]));
  IBUF \write_element_in_IBUF[41]_inst 
       (.I(write_element_in[41]),
        .O(write_element_in_IBUF[41]));
  IBUF \write_element_in_IBUF[42]_inst 
       (.I(write_element_in[42]),
        .O(write_element_in_IBUF[42]));
  IBUF \write_element_in_IBUF[43]_inst 
       (.I(write_element_in[43]),
        .O(write_element_in_IBUF[43]));
  IBUF \write_element_in_IBUF[44]_inst 
       (.I(write_element_in[44]),
        .O(write_element_in_IBUF[44]));
  IBUF \write_element_in_IBUF[45]_inst 
       (.I(write_element_in[45]),
        .O(write_element_in_IBUF[45]));
  IBUF \write_element_in_IBUF[46]_inst 
       (.I(write_element_in[46]),
        .O(write_element_in_IBUF[46]));
  IBUF \write_element_in_IBUF[47]_inst 
       (.I(write_element_in[47]),
        .O(write_element_in_IBUF[47]));
  IBUF \write_element_in_IBUF[48]_inst 
       (.I(write_element_in[48]),
        .O(write_element_in_IBUF[48]));
  IBUF \write_element_in_IBUF[49]_inst 
       (.I(write_element_in[49]),
        .O(write_element_in_IBUF[49]));
  IBUF \write_element_in_IBUF[4]_inst 
       (.I(write_element_in[4]),
        .O(write_element_in_IBUF[4]));
  IBUF \write_element_in_IBUF[50]_inst 
       (.I(write_element_in[50]),
        .O(write_element_in_IBUF[50]));
  IBUF \write_element_in_IBUF[51]_inst 
       (.I(write_element_in[51]),
        .O(write_element_in_IBUF[51]));
  IBUF \write_element_in_IBUF[52]_inst 
       (.I(write_element_in[52]),
        .O(write_element_in_IBUF[52]));
  IBUF \write_element_in_IBUF[53]_inst 
       (.I(write_element_in[53]),
        .O(write_element_in_IBUF[53]));
  IBUF \write_element_in_IBUF[54]_inst 
       (.I(write_element_in[54]),
        .O(write_element_in_IBUF[54]));
  IBUF \write_element_in_IBUF[55]_inst 
       (.I(write_element_in[55]),
        .O(write_element_in_IBUF[55]));
  IBUF \write_element_in_IBUF[56]_inst 
       (.I(write_element_in[56]),
        .O(write_element_in_IBUF[56]));
  IBUF \write_element_in_IBUF[57]_inst 
       (.I(write_element_in[57]),
        .O(write_element_in_IBUF[57]));
  IBUF \write_element_in_IBUF[58]_inst 
       (.I(write_element_in[58]),
        .O(write_element_in_IBUF[58]));
  IBUF \write_element_in_IBUF[59]_inst 
       (.I(write_element_in[59]),
        .O(write_element_in_IBUF[59]));
  IBUF \write_element_in_IBUF[5]_inst 
       (.I(write_element_in[5]),
        .O(write_element_in_IBUF[5]));
  IBUF \write_element_in_IBUF[60]_inst 
       (.I(write_element_in[60]),
        .O(write_element_in_IBUF[60]));
  IBUF \write_element_in_IBUF[61]_inst 
       (.I(write_element_in[61]),
        .O(write_element_in_IBUF[61]));
  IBUF \write_element_in_IBUF[62]_inst 
       (.I(write_element_in[62]),
        .O(write_element_in_IBUF[62]));
  IBUF \write_element_in_IBUF[63]_inst 
       (.I(write_element_in[63]),
        .O(write_element_in_IBUF[63]));
  IBUF \write_element_in_IBUF[6]_inst 
       (.I(write_element_in[6]),
        .O(write_element_in_IBUF[6]));
  IBUF \write_element_in_IBUF[7]_inst 
       (.I(write_element_in[7]),
        .O(write_element_in_IBUF[7]));
  IBUF \write_element_in_IBUF[8]_inst 
       (.I(write_element_in[8]),
        .O(write_element_in_IBUF[8]));
  IBUF \write_element_in_IBUF[9]_inst 
       (.I(write_element_in[9]),
        .O(write_element_in_IBUF[9]));
  IBUF write_en_in_IBUF_inst
       (.I(write_en_in),
        .O(write_en_in_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
