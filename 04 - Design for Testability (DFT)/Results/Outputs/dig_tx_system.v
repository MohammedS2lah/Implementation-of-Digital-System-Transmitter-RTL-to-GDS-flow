/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Mon May 19 10:26:18 2025
/////////////////////////////////////////////////////////////


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   n1;

  AO22X1_LVT U1 ( .A1(SEL), .A2(IN_1), .A3(IN_0), .A4(n1), .Y(OUT) );
  INVX1_LVT U2 ( .A(SEL), .Y(n1) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   n1;

  AO22X1_LVT U1 ( .A1(SEL), .A2(IN_1), .A3(IN_0), .A4(n1), .Y(OUT) );
  INVX1_LVT U2 ( .A(SEL), .Y(n1) );
endmodule


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   n1;

  AO22X1_LVT U1 ( .A1(SEL), .A2(IN_1), .A3(IN_0), .A4(n1), .Y(OUT) );
  INVX1_LVT U2 ( .A(SEL), .Y(n1) );
endmodule


module dig_tx_clock_gating_0 ( i_dig_tx_clock_gating_clk, 
        i_dig_tx_clock_gating_enable, o_dig_tx_clock_gating_gated_clock );
  input i_dig_tx_clock_gating_clk, i_dig_tx_clock_gating_enable;
  output o_dig_tx_clock_gating_gated_clock;
  wire   enable_latch, n1;

  AND2X1_LVT U2 ( .A1(enable_latch), .A2(i_dig_tx_clock_gating_clk), .Y(
        o_dig_tx_clock_gating_gated_clock) );
  LATCHX1_LVT enable_latch_reg ( .CLK(n1), .D(i_dig_tx_clock_gating_enable), 
        .Q(enable_latch) );
  INVX1_LVT U3 ( .A(i_dig_tx_clock_gating_clk), .Y(n1) );
endmodule


module dig_tx_clock_gating_1 ( i_dig_tx_clock_gating_clk, 
        i_dig_tx_clock_gating_enable, o_dig_tx_clock_gating_gated_clock );
  input i_dig_tx_clock_gating_clk, i_dig_tx_clock_gating_enable;
  output o_dig_tx_clock_gating_gated_clock;
  wire   enable_latch, n1;

  LATCHX1_LVT enable_latch_reg ( .CLK(n1), .D(i_dig_tx_clock_gating_enable), 
        .Q(enable_latch) );
  AND2X1_LVT U2 ( .A1(enable_latch), .A2(i_dig_tx_clock_gating_clk), .Y(
        o_dig_tx_clock_gating_gated_clock) );
  INVX1_LVT U3 ( .A(i_dig_tx_clock_gating_clk), .Y(n1) );
endmodule


module dig_tx_rst_sync_test_0 ( i_dig_tx_rst_sync_clk, i_dig_tx_rst_sync_rst_n, 
        o_dig_tx_rst_sync_rst_n, test_si, test_so, test_se );
  input i_dig_tx_rst_sync_clk, i_dig_tx_rst_sync_rst_n, test_si, test_se;
  output o_dig_tx_rst_sync_rst_n, test_so;
  wire   n3, n8;

  SDFFARX1_LVT sync_flops_reg_0_ ( .D(1'b1), .SI(test_si), .SE(test_se), .CLK(
        i_dig_tx_rst_sync_clk), .RSTB(i_dig_tx_rst_sync_rst_n), .Q(n8), .QN(n3) );
  SDFFASX2_HVT sync_flops_reg_1_ ( .D(n3), .SI(n8), .SE(test_se), .CLK(
        i_dig_tx_rst_sync_clk), .SETB(i_dig_tx_rst_sync_rst_n), .Q(test_so), 
        .QN(o_dig_tx_rst_sync_rst_n) );
endmodule


module dig_tx_rst_sync_test_1 ( i_dig_tx_rst_sync_clk, i_dig_tx_rst_sync_rst_n, 
        o_dig_tx_rst_sync_rst_n, test_si, test_so, test_se );
  input i_dig_tx_rst_sync_clk, i_dig_tx_rst_sync_rst_n, test_si, test_se;
  output o_dig_tx_rst_sync_rst_n, test_so;
  wire   n4, n9;

  SDFFARX1_LVT sync_flops_reg_0_ ( .D(1'b1), .SI(test_si), .SE(test_se), .CLK(
        i_dig_tx_rst_sync_clk), .RSTB(i_dig_tx_rst_sync_rst_n), .Q(n9), .QN(n4) );
  SDFFASX1_LVT sync_flops_reg_1_ ( .D(n4), .SI(n9), .SE(test_se), .CLK(
        i_dig_tx_rst_sync_clk), .SETB(i_dig_tx_rst_sync_rst_n), .Q(test_so), 
        .QN(o_dig_tx_rst_sync_rst_n) );
endmodule


module spi_slave_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  HADDX1_LVT U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX1_LVT U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1_LVT U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1_LVT U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1_LVT U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1_LVT U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  XOR2X1_HVT U1 ( .A1(carry[7]), .A2(A[7]), .Y(SUM[7]) );
  INVX0_HVT U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module spi_slave ( i_scan_mode, i_ioring_rst_n, o_dout, i_status, i_sck, 
        i_sck_neg, i_csn, i_mosi, o_miso_ena, o_miso, o_rf_addr, i_rf_din, 
        o_rf_wre, fifo_wr_enable );
  output [7:0] o_dout;
  input [15:0] i_status;
  output [7:0] o_rf_addr;
  input [7:0] i_rf_din;
  input i_scan_mode, i_ioring_rst_n, i_sck, i_sck_neg, i_csn, i_mosi;
  output o_miso_ena, o_miso, o_rf_wre, fifo_wr_enable;
  wire   N40, csn_scn, csn_d, csn_d_scn, miso_rde_strt_nxt, N138, N139, N154,
         N162, N163, N164, N165, N166, N167, N168, N169, N198, N199, N200,
         N201, N202, N203, N204, N205, N207, N208, N239, N240, N241, N242,
         N243, N244, N245, N246, N285, N286, N291, N292, N293, n64, n65, n66,
         n74, n75, n76, n121, n130, n131, n133, n134, n135, n136, n137, n1380,
         n1390, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n1540, n155, n156, n157, n158, n159, n160,
         n161, n1620, n1630, n1640, n1650, n1660, n1670, n1680, n1690, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, net26482, net26483,
         net26485, net26488, net26490, net26508, net26510, net26518, net26521,
         net26522, net26525, net26526, net26527, net26530, net26532, net26535,
         net26540, net26544, net26545, net26557, net26558, net26561, net26566,
         net26567, net26569, net26570, U5_net26479, U5_net26477, U5_net26475,
         U5_net26470, U5_net26466, U5_net26465, U5_net26459, net27749,
         net27764, net27788, net27791, net27805, net27845, net27846, net27890,
         net27889, net27909, net27908, net27914, net27913, net27965, net27966,
         net28029, net28038, net28075, net28138, net28137, net26524, net26520,
         net26501, net26494, net26491, net26498, net26496, net26493, net26492,
         net28124, net28039, net27831, net26538, net26536, U5_net26464,
         U5_net26463, U5_net26462, U5_net26461, U5_net26458, N206, N1370,
         net28146, net28128, net28080, net27765, net26572, net26556, net26555,
         net26537, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n400, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n67;
  wire   [2:0] state_tx;
  wire   [15:1] status_reg;
  wire   [1:0] state_reg;
  wire   [7:0] rf_add_reg;

  SDFFASX1_LVT csn_d_reg ( .D(1'b0), .SI(1'b0), .SE(1'b0), .CLK(i_sck), .SETB(
        n48), .Q(csn_d) );
  SDFFNARX1_LVT state_tx_reg_2_ ( .D(N293), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n50), .Q(state_tx[2]), .QN(net27965) );
  SDFFNARX1_LVT state_tx_reg_0_ ( .D(N291), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n50), .Q(state_tx[0]), .QN(net28029) );
  SDFFNARX1_LVT flag_reg_reg ( .D(n121), .SI(1'b0), .SE(1'b0), .CLK(i_sck_neg), 
        .RSTB(n50), .Q(net26501), .QN(n131) );
  SDFFNARX1_LVT status_reg_reg_1_ ( .D(n178), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n50), .Q(status_reg[1]) );
  SDFFNARX1_LVT status_reg_reg_2_ ( .D(n177), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n50), .Q(status_reg[2]) );
  SDFFNARX1_LVT status_reg_reg_3_ ( .D(n176), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n50), .Q(status_reg[3]) );
  SDFFNARX1_LVT status_reg_reg_4_ ( .D(n175), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n50), .Q(status_reg[4]) );
  SDFFNARX1_LVT status_reg_reg_5_ ( .D(n174), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n50), .Q(status_reg[5]) );
  SDFFNARX1_LVT status_reg_reg_6_ ( .D(n173), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n49), .Q(status_reg[6]) );
  SDFFNARX1_LVT status_reg_reg_7_ ( .D(n172), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n50), .Q(status_reg[7]) );
  SDFFNARX1_LVT status_reg_reg_8_ ( .D(n171), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n49), .Q(status_reg[8]) );
  SDFFNARX1_LVT status_reg_reg_9_ ( .D(n170), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n50), .Q(status_reg[9]) );
  SDFFNARX1_LVT status_reg_reg_10_ ( .D(n1690), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n49), .Q(status_reg[10]) );
  SDFFNARX1_LVT status_reg_reg_11_ ( .D(n1680), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n49), .Q(status_reg[11]) );
  SDFFNARX1_LVT status_reg_reg_12_ ( .D(n1670), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n49), .Q(status_reg[12]) );
  SDFFNARX1_LVT status_reg_reg_13_ ( .D(n1660), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n50), .Q(status_reg[13]) );
  SDFFNARX1_LVT status_reg_reg_14_ ( .D(n1650), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n51), .Q(status_reg[14]) );
  SDFFNARX1_LVT status_reg_reg_15_ ( .D(n1640), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n50), .Q(status_reg[15]), .QN(n11) );
  SDFFARX1_LVT mosi_reg_reg_0_ ( .D(n153), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n48), .Q(net26490), .QN(n137) );
  SDFFARX1_LVT mosi_reg_reg_2_ ( .D(n151), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n48), .Q(net26488), .QN(n135) );
  SDFFNARX1_LVT miso_rde_strt_reg ( .D(miso_rde_strt_nxt), .SI(1'b0), .SE(1'b0), .CLK(i_sck_neg), .RSTB(n50), .Q(n10), .QN(n130) );
  SDFFNARX1_LVT miso_reg_reg_1_ ( .D(n160), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n51), .Q(n57) );
  SDFFNARX1_LVT miso_reg_reg_2_ ( .D(n159), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n51), .Q(n58) );
  SDFFNARX1_LVT miso_reg_reg_3_ ( .D(n158), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n51), .Q(n59) );
  SDFFNARX1_LVT miso_reg_reg_4_ ( .D(n157), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n51), .Q(n60) );
  SDFFNARX1_LVT miso_reg_reg_5_ ( .D(n156), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n51), .Q(n61) );
  SDFFNARX1_LVT miso_reg_reg_6_ ( .D(n155), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n51), .Q(net26510) );
  SDFFNARX1_LVT miso_reg_reg_7_ ( .D(n1540), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .RSTB(n51), .Q(n30) );
  SDFFARX1_LVT rf_add_reg_reg_0_ ( .D(n145), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n49), .Q(rf_add_reg[0]) );
  SDFFARX1_LVT rf_add_reg_reg_1_ ( .D(n144), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n49), .Q(rf_add_reg[1]) );
  SDFFARX1_LVT rf_add_reg_reg_2_ ( .D(n143), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n48), .Q(rf_add_reg[2]) );
  SDFFARX1_LVT rf_add_reg_reg_3_ ( .D(n142), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n48), .Q(rf_add_reg[3]) );
  SDFFARX1_LVT rf_add_reg_reg_4_ ( .D(n141), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n49), .Q(rf_add_reg[4]) );
  SDFFARX1_LVT rf_add_reg_reg_5_ ( .D(n140), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n49), .Q(rf_add_reg[5]) );
  SDFFARX1_LVT rf_add_reg_reg_6_ ( .D(n1390), .SI(1'b0), .SE(1'b0), .CLK(i_sck), .RSTB(n49), .Q(rf_add_reg[6]) );
  SDFFARX1_LVT rf_add_reg_reg_7_ ( .D(n1380), .SI(1'b0), .SE(1'b0), .CLK(i_sck), .RSTB(n49), .Q(rf_add_reg[7]) );
  OR2X1_LVT U3 ( .A1(i_scan_mode), .A2(i_csn), .Y(o_miso_ena) );
  SDFFARX2_LVT bit_cnt_reg_reg_0_ ( .D(n1630), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck), .RSTB(n63), .Q(net27913), .QN(n64) );
  SDFFNASX1_LVT state_tx_reg_1_ ( .D(n62), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck_neg), .SETB(n48), .Q(net27966), .QN(state_tx[1]) );
  SDFFARX2_LVT bit_cnt_reg_reg_1_ ( .D(n1620), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck), .RSTB(n63), .Q(net27889), .QN(n65) );
  SDFFARX1_LVT state_reg_reg_0_ ( .D(net28038), .SI(1'b0), .SE(1'b0), .CLK(
        i_sck), .RSTB(n48), .Q(state_reg[0]), .QN(net27764) );
  SDFFARX2_LVT mosi_reg_reg_5_ ( .D(n148), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n48), .QN(n75) );
  SDFFARX2_LVT mosi_reg_reg_3_ ( .D(n150), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n48), .QN(n134) );
  SDFFARX1_LVT mosi_reg_reg_7_ ( .D(n146), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n49), .Q(net28137), .QN(n133) );
  SDFFARX1_LVT mosi_reg_reg_1_ ( .D(n152), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n48), .Q(n9), .QN(n136) );
  SDFFASX1_LVT state_reg_reg_1_ ( .D(n3), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .SETB(n48), .Q(n8), .QN(state_reg[1]) );
  SDFFARX1_LVT mosi_reg_reg_4_ ( .D(n149), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n48), .Q(n7), .QN(n74) );
  SDFFARX1_LVT mosi_reg_reg_6_ ( .D(n147), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n48), .Q(n6), .QN(n76) );
  SDFFARX1_LVT state_reg_reg_2_ ( .D(n2), .SI(1'b0), .SE(1'b0), .CLK(i_sck), 
        .RSTB(n49), .Q(n18), .QN(net27908) );
  SDFFARX2_LVT bit_cnt_reg_reg_2_ ( .D(n161), .SI(1'b0), .SE(1'b0), .CLK(i_sck), .RSTB(n63), .QN(n66) );
  NAND2X0_RVT U4 ( .A1(net26570), .A2(n24), .Y(net26566) );
  OR2X2_RVT U5 ( .A1(n53), .A2(n4), .Y(net26483) );
  INVX2_LVT U6 ( .A(n19), .Y(n1) );
  DELLN2X2_RVT U8 ( .A(n32), .Y(n2) );
  NAND3X2_LVT U10 ( .A1(n14), .A2(n24), .A3(n22), .Y(n4) );
  AND2X1_LVT U11 ( .A1(n18), .A2(n4), .Y(n5) );
  INVX2_LVT U12 ( .A(n66), .Y(n14) );
  AND2X1_HVT U13 ( .A1(o_rf_wre), .A2(n6), .Y(o_dout[6]) );
  OR2X2_LVT U15 ( .A1(net27764), .A2(net27765), .Y(n19) );
  INVX1_LVT U16 ( .A(net27764), .Y(n16) );
  NAND2X0_RVT U17 ( .A1(net27965), .A2(net27966), .Y(net26520) );
  OR3X2_LVT U18 ( .A1(n27), .A2(net28029), .A3(state_tx[1]), .Y(net26496) );
  INVX2_LVT U19 ( .A(net27965), .Y(n27) );
  INVX0_HVT U20 ( .A(net27966), .Y(n12) );
  NAND3X0_LVT U21 ( .A1(state_reg[0]), .A2(n8), .A3(N286), .Y(n13) );
  NOR3X0_LVT U22 ( .A1(net28128), .A2(net26482), .A3(net26485), .Y(net27791)
         );
  NAND2X0_LVT U23 ( .A1(net26555), .A2(net28146), .Y(n17) );
  INVX1_LVT U24 ( .A(n133), .Y(n20) );
  NAND2X0_LVT U25 ( .A1(n18), .A2(n4), .Y(net26545) );
  AO222X1_LVT U26 ( .A1(N206), .A2(U5_net26462), .A3(n16), .A4(U5_net26463), 
        .A5(n15), .A6(n16), .Y(net28039) );
  AO222X1_LVT U27 ( .A1(N206), .A2(U5_net26462), .A3(n16), .A4(U5_net26463), 
        .A5(n1), .A6(n16), .Y(U5_net26461) );
  AND3X1_LVT U28 ( .A1(net26555), .A2(net28146), .A3(net26537), .Y(net27765)
         );
  INVX1_LVT U29 ( .A(net26556), .Y(net26537) );
  INVX0_RVT U30 ( .A(net26537), .Y(net28124) );
  INVX1_LVT U31 ( .A(net26572), .Y(net26555) );
  NAND2X0_LVT U32 ( .A1(net26555), .A2(net28146), .Y(net26557) );
  NAND4X0_LVT U33 ( .A1(net28080), .A2(n134), .A3(n75), .A4(n20), .Y(net26572)
         );
  DELLN2X2_RVT U34 ( .A(net28137), .Y(net28075) );
  AND3X1_RVT U35 ( .A1(n74), .A2(n20), .A3(n75), .Y(n21) );
  INVX1_LVT U36 ( .A(n76), .Y(net28080) );
  AOI21X1_LVT U37 ( .A1(n135), .A2(n136), .A3(net28128), .Y(net28146) );
  INVX1_LVT U38 ( .A(n74), .Y(net28128) );
  NAND3X0_LVT U39 ( .A1(n14), .A2(n24), .A3(n22), .Y(net26556) );
  NAND2X0_LVT U40 ( .A1(net26556), .A2(state_reg[1]), .Y(net26540) );
  INVX2_LVT U41 ( .A(n65), .Y(n22) );
  NAND2X0_RVT U42 ( .A1(net26569), .A2(net27889), .Y(n25) );
  NAND3X0_LVT U43 ( .A1(n23), .A2(n14), .A3(n22), .Y(net26535) );
  INVX2_LVT U44 ( .A(n64), .Y(n24) );
  AND3X1_LVT U45 ( .A1(n76), .A2(n135), .A3(n24), .Y(n23) );
  XNOR2X1_HVT U46 ( .A1(n25), .A2(n14), .Y(n161) );
  NAND4X0_LVT U47 ( .A1(n21), .A2(n137), .A3(n134), .A4(n136), .Y(net26536) );
  INVX1_LVT U48 ( .A(n134), .Y(net26482) );
  INVX1_LVT U49 ( .A(n75), .Y(net26485) );
  AO221X1_LVT U50 ( .A1(U5_net26458), .A2(U5_net26459), .A3(N1370), .A4(
        net27831), .A5(U5_net26461), .Y(N291) );
  INVX1_LVT U51 ( .A(net27909), .Y(U5_net26459) );
  INVX2_LVT U52 ( .A(net27908), .Y(net27909) );
  AND2X1_LVT U53 ( .A1(N206), .A2(U5_net26464), .Y(U5_net26458) );
  AO221X1_LVT U54 ( .A1(U5_net26458), .A2(U5_net26459), .A3(N1370), .A4(
        net27831), .A5(net28039), .Y(net28038) );
  INVX1_LVT U55 ( .A(n8), .Y(U5_net26464) );
  OR3X1_LVT U56 ( .A1(state_reg[0]), .A2(U5_net26464), .A3(N208), .Y(
        U5_net26479) );
  NAND3X0_LVT U57 ( .A1(net27764), .A2(U5_net26464), .A3(n5), .Y(U5_net26475)
         );
  NAND2X0_LVT U58 ( .A1(U5_net26464), .A2(U5_net26470), .Y(U5_net26466) );
  OAI22X1_LVT U59 ( .A1(n67), .A2(net26536), .A3(net26522), .A4(net26538), .Y(
        N1370) );
  INVX0_LVT U60 ( .A(state_reg[0]), .Y(net26538) );
  AND2X1_HVT U61 ( .A1(net26561), .A2(net26538), .Y(net27845) );
  NAND2X0_LVT U62 ( .A1(net26538), .A2(net28124), .Y(N206) );
  INVX4_LVT U63 ( .A(n4), .Y(net26522) );
  AND3X2_LVT U64 ( .A1(n8), .A2(net27764), .A3(U5_net26459), .Y(net27831) );
  NAND2X0_LVT U65 ( .A1(N138), .A2(net27831), .Y(U5_net26465) );
  NAND2X0_LVT U66 ( .A1(N139), .A2(net27831), .Y(U5_net26477) );
  AND2X1_LVT U67 ( .A1(net27909), .A2(n8), .Y(U5_net26462) );
  NAND2X0_RVT U68 ( .A1(n8), .A2(U5_net26459), .Y(U5_net26463) );
  XNOR2X2_LVT U69 ( .A1(n27), .A2(state_tx[1]), .Y(n26) );
  OA22X1_LVT U70 ( .A1(n11), .A2(net26496), .A3(net26498), .A4(n26), .Y(
        net26493) );
  NAND2X0_HVT U71 ( .A1(state_tx[2]), .A2(n12), .Y(net26530) );
  NAND4X0_LVT U72 ( .A1(status_reg[15]), .A2(net26501), .A3(net27965), .A4(
        net28029), .Y(net26492) );
  NAND4X0_LVT U73 ( .A1(net26491), .A2(net26492), .A3(net26493), .A4(net26494), 
        .Y(o_miso) );
  NAND2X0_LVT U74 ( .A1(status_reg[15]), .A2(net28029), .Y(net26498) );
  AND3X2_HVT U75 ( .A1(net26521), .A2(net26496), .A3(n131), .Y(net27805) );
  AO222X1_LVT U76 ( .A1(status_reg[15]), .A2(net26526), .A3(status_reg[14]), 
        .A4(net26527), .A5(i_status[14]), .A6(net27749), .Y(n1640) );
  NAND2X0_LVT U77 ( .A1(i_status[15]), .A2(net27749), .Y(net26494) );
  AO21X1_LVT U78 ( .A1(net26524), .A2(net28029), .A3(net26501), .Y(n121) );
  NAND3X0_LVT U79 ( .A1(state_tx[0]), .A2(n28), .A3(n29), .Y(net26491) );
  AND2X1_LVT U80 ( .A1(state_tx[2]), .A2(net27966), .Y(n29) );
  AO22X1_LVT U81 ( .A1(n130), .A2(n30), .A3(i_rf_din[7]), .A4(n10), .Y(n28) );
  AND2X1_LVT U82 ( .A1(net26518), .A2(n10), .Y(net27846) );
  AO222X1_LVT U83 ( .A1(net26508), .A2(n30), .A3(net27788), .A4(net26510), 
        .A5(i_rf_din[6]), .A6(net27846), .Y(n1540) );
  AND3X1_HVT U84 ( .A1(n131), .A2(net26524), .A3(net28029), .Y(net27749) );
  INVX1_LVT U85 ( .A(net26520), .Y(net26524) );
  AO22X1_LVT U86 ( .A1(net26522), .A2(n31), .A3(net26524), .A4(state_tx[0]), 
        .Y(miso_rde_strt_nxt) );
  AO21X1_HVT U87 ( .A1(state_tx[0]), .A2(net27966), .A3(net26525), .Y(n31) );
  AO21X1_HVT U88 ( .A1(state_tx[0]), .A2(net26520), .A3(net26532), .Y(net26526) );
  NAND3X2_RVT U89 ( .A1(net26520), .A2(net27966), .A3(net26521), .Y(net26508)
         );
  AND2X1_LVT U90 ( .A1(net26518), .A2(n130), .Y(net27788) );
  NAND3X2_LVT U91 ( .A1(net26520), .A2(net28029), .A3(net26530), .Y(net26521)
         );
  AND2X1_LVT U92 ( .A1(net28138), .A2(n9), .Y(n400) );
  INVX1_LVT U93 ( .A(net28137), .Y(net28138) );
  MUX21X1_RVT U94 ( .A1(net26490), .A2(n9), .S0(net26567), .Y(n152) );
  MUX21X1_HVT U95 ( .A1(rf_add_reg[6]), .A2(n6), .S0(net26522), .Y(N204) );
  XOR2X1_RVT U96 ( .A1(net27914), .A2(net26567), .Y(n1630) );
  MUX21X1_HVT U97 ( .A1(rf_add_reg[7]), .A2(net28075), .S0(net26522), .Y(N205)
         );
  NAND4X0_LVT U98 ( .A1(n47), .A2(U5_net26475), .A3(n13), .A4(U5_net26477), 
        .Y(n32) );
  NAND2X0_RVT U99 ( .A1(U5_net26459), .A2(state_reg[0]), .Y(n33) );
  NAND2X0_LVT U100 ( .A1(n34), .A2(N285), .Y(n45) );
  INVX1_LVT U101 ( .A(n33), .Y(n34) );
  INVX1_RVT U102 ( .A(net26521), .Y(net26525) );
  NOR2X2_LVT U103 ( .A1(net26526), .A2(net27805), .Y(net26527) );
  AO22X1_RVT U104 ( .A1(status_reg[1]), .A2(net26526), .A3(i_status[0]), .A4(
        net27749), .Y(n178) );
  OR3X1_LVT U105 ( .A1(net27909), .A2(state_reg[0]), .A3(N154), .Y(U5_net26470) );
  NAND2X0_LVT U106 ( .A1(i_rf_din[0]), .A2(net27846), .Y(n35) );
  NAND2X0_RVT U107 ( .A1(net26508), .A2(n57), .Y(n36) );
  NAND2X0_LVT U108 ( .A1(n35), .A2(n36), .Y(n160) );
  INVX1_LVT U109 ( .A(net27913), .Y(net27914) );
  INVX0_LVT U110 ( .A(net26566), .Y(net26569) );
  AO222X1_HVT U111 ( .A1(N242), .A2(n39), .A3(N201), .A4(n37), .A5(
        rf_add_reg[3]), .A6(n42), .Y(o_rf_addr[3]) );
  AO222X1_HVT U112 ( .A1(N243), .A2(n39), .A3(N202), .A4(n37), .A5(
        rf_add_reg[4]), .A6(n42), .Y(o_rf_addr[4]) );
  AO222X1_HVT U113 ( .A1(N244), .A2(n39), .A3(N203), .A4(n37), .A5(
        rf_add_reg[5]), .A6(n42), .Y(o_rf_addr[5]) );
  AO222X1_HVT U114 ( .A1(N245), .A2(n39), .A3(N204), .A4(n37), .A5(
        rf_add_reg[6]), .A6(n42), .Y(o_rf_addr[6]) );
  AO222X1_HVT U115 ( .A1(N246), .A2(n39), .A3(N205), .A4(n37), .A5(
        rf_add_reg[7]), .A6(n42), .Y(o_rf_addr[7]) );
  AND3X1_RVT U116 ( .A1(state_reg[0]), .A2(net26522), .A3(net26558), .Y(n41)
         );
  INVX1_LVT U117 ( .A(net27889), .Y(net27890) );
  AND2X1_LVT U118 ( .A1(n43), .A2(net27764), .Y(n37) );
  INVX1_LVT U119 ( .A(net26570), .Y(net26567) );
  INVX2_LVT U120 ( .A(csn_scn), .Y(n48) );
  INVX2_LVT U121 ( .A(csn_scn), .Y(n49) );
  INVX2_LVT U122 ( .A(csn_scn), .Y(n50) );
  INVX1_LVT U123 ( .A(csn_scn), .Y(n51) );
  NAND2X0_HVT U124 ( .A1(net27909), .A2(n8), .Y(n42) );
  AND2X1_LVT U125 ( .A1(n16), .A2(net26561), .Y(n38) );
  AND2X1_LVT U126 ( .A1(n16), .A2(n43), .Y(n39) );
  MUX21X1_LVT U127 ( .A1(csn_d), .A2(N40), .S0(i_scan_mode), .Y(csn_d_scn) );
  MUX21X1_LVT U128 ( .A1(i_csn), .A2(N40), .S0(i_scan_mode), .Y(csn_scn) );
  INVX1_LVT U129 ( .A(i_ioring_rst_n), .Y(N40) );
  AO222X1_LVT U130 ( .A1(N239), .A2(n39), .A3(N198), .A4(n37), .A5(
        rf_add_reg[0]), .A6(n42), .Y(o_rf_addr[0]) );
  AO222X1_LVT U131 ( .A1(N240), .A2(n39), .A3(N199), .A4(n37), .A5(
        rf_add_reg[1]), .A6(n42), .Y(o_rf_addr[1]) );
  AO222X1_LVT U132 ( .A1(N241), .A2(n39), .A3(N200), .A4(n37), .A5(
        rf_add_reg[2]), .A6(n42), .Y(o_rf_addr[2]) );
  INVX1_LVT U133 ( .A(n42), .Y(n43) );
  NAND3X0_LVT U134 ( .A1(n44), .A2(U5_net26466), .A3(U5_net26465), .Y(N292) );
  AND2X1_LVT U135 ( .A1(n45), .A2(n46), .Y(n44) );
  NAND4X0_LVT U136 ( .A1(n47), .A2(U5_net26475), .A3(n13), .A4(U5_net26477), 
        .Y(N293) );
  NAND2X0_LVT U137 ( .A1(net27909), .A2(U5_net26479), .Y(n47) );
  XOR2X1_HVT U138 ( .A1(net26566), .A2(net27890), .Y(n1620) );
  MUX21X1_HVT U139 ( .A1(net26482), .A2(n7), .S0(net26567), .Y(n149) );
  AO222X1_RVT U140 ( .A1(N166), .A2(n38), .A3(net27845), .A4(n7), .A5(
        rf_add_reg[4]), .A6(net26483), .Y(n141) );
  AND2X1_HVT U141 ( .A1(o_rf_wre), .A2(n7), .Y(o_dout[4]) );
  MUX21X1_HVT U142 ( .A1(rf_add_reg[4]), .A2(n7), .S0(net26522), .Y(N202) );
  MUX21X1_HVT U143 ( .A1(n7), .A2(net26485), .S0(net26567), .Y(n148) );
  MUX21X1_HVT U144 ( .A1(net26485), .A2(n6), .S0(net26567), .Y(n147) );
  MUX21X1_HVT U145 ( .A1(n6), .A2(net28075), .S0(net26567), .Y(n146) );
  INVX0_LVT U146 ( .A(net27909), .Y(net26558) );
  XNOR2X1_HVT U147 ( .A1(state_reg[1]), .A2(net27909), .Y(n53) );
  INVX2_LVT U148 ( .A(n56), .Y(o_rf_wre) );
  NAND2X0_LVT U149 ( .A1(n41), .A2(n17), .Y(n52) );
  MUX21X1_LVT U150 ( .A1(n52), .A2(net26558), .S0(state_reg[1]), .Y(net26570)
         );
  MUX21X1_LVT U151 ( .A1(i_mosi), .A2(net26490), .S0(net26567), .Y(n153) );
  MUX21X1_LVT U152 ( .A1(n9), .A2(net26488), .S0(net26567), .Y(n151) );
  MUX21X1_LVT U153 ( .A1(net26488), .A2(net26482), .S0(net26567), .Y(n150) );
  INVX1_LVT U154 ( .A(csn_d_scn), .Y(n63) );
  INVX1_LVT U204 ( .A(N292), .Y(n62) );
  NAND2X0_LVT U205 ( .A1(n8), .A2(n4), .Y(N154) );
  INVX1_LVT U206 ( .A(net26483), .Y(net26561) );
  AO222X1_LVT U208 ( .A1(N164), .A2(n38), .A3(net27845), .A4(net26488), .A5(
        rf_add_reg[2]), .A6(net26483), .Y(n143) );
  AO222X1_LVT U209 ( .A1(N163), .A2(n38), .A3(net27845), .A4(n9), .A5(
        rf_add_reg[1]), .A6(net26483), .Y(n144) );
  AO222X1_LVT U210 ( .A1(N162), .A2(n38), .A3(net27845), .A4(net26490), .A5(
        rf_add_reg[0]), .A6(net26483), .Y(n145) );
  MUX21X1_LVT U211 ( .A1(rf_add_reg[7]), .A2(N169), .S0(net26522), .Y(N246) );
  MUX21X1_LVT U212 ( .A1(rf_add_reg[6]), .A2(N168), .S0(net26522), .Y(N245) );
  MUX21X1_LVT U213 ( .A1(rf_add_reg[5]), .A2(N167), .S0(net26522), .Y(N244) );
  MUX21X1_LVT U214 ( .A1(rf_add_reg[4]), .A2(N166), .S0(net26522), .Y(N243) );
  MUX21X1_LVT U215 ( .A1(rf_add_reg[3]), .A2(N165), .S0(net26522), .Y(N242) );
  MUX21X1_LVT U216 ( .A1(rf_add_reg[2]), .A2(N164), .S0(net26522), .Y(N241) );
  MUX21X1_LVT U217 ( .A1(rf_add_reg[1]), .A2(N163), .S0(net26522), .Y(N240) );
  MUX21X1_LVT U218 ( .A1(rf_add_reg[0]), .A2(N162), .S0(net26522), .Y(N239) );
  NAND2X0_LVT U219 ( .A1(net26558), .A2(n4), .Y(N208) );
  MUX21X1_LVT U221 ( .A1(rf_add_reg[5]), .A2(net26485), .S0(net26522), .Y(N203) );
  MUX21X1_LVT U222 ( .A1(rf_add_reg[3]), .A2(net26482), .S0(net26522), .Y(N201) );
  MUX21X1_LVT U223 ( .A1(rf_add_reg[2]), .A2(net26488), .S0(net26522), .Y(N200) );
  MUX21X1_LVT U224 ( .A1(rf_add_reg[1]), .A2(n9), .S0(net26522), .Y(N199) );
  MUX21X1_LVT U225 ( .A1(rf_add_reg[0]), .A2(net26490), .S0(net26522), .Y(N198) );
  AO21X1_LVT U226 ( .A1(n17), .A2(net27909), .A3(n5), .Y(N286) );
  AO21X1_LVT U227 ( .A1(net26557), .A2(state_reg[1]), .A3(N207), .Y(N285) );
  NAND4X0_LVT U229 ( .A1(net26544), .A2(n400), .A3(net27791), .A4(net26490), 
        .Y(n54) );
  NAND2X0_LVT U230 ( .A1(n54), .A2(net26545), .Y(N139) );
  NAND4X0_LVT U231 ( .A1(net26544), .A2(n137), .A3(net27791), .A4(n400), .Y(
        n55) );
  NAND2X0_LVT U232 ( .A1(n55), .A2(net26540), .Y(N138) );
  AND3X1_LVT U233 ( .A1(net28038), .A2(n62), .A3(n32), .Y(fifo_wr_enable) );
  NAND2X0_LVT U234 ( .A1(n41), .A2(state_reg[1]), .Y(n56) );
  INVX1_LVT U235 ( .A(net26530), .Y(net26532) );
  AO222X1_LVT U236 ( .A1(status_reg[2]), .A2(net26526), .A3(status_reg[1]), 
        .A4(net26527), .A5(i_status[1]), .A6(net27749), .Y(n177) );
  AO222X1_LVT U237 ( .A1(status_reg[3]), .A2(net26526), .A3(status_reg[2]), 
        .A4(net26527), .A5(i_status[2]), .A6(net27749), .Y(n176) );
  AO222X1_LVT U238 ( .A1(status_reg[4]), .A2(net26526), .A3(status_reg[3]), 
        .A4(net26527), .A5(i_status[3]), .A6(net27749), .Y(n175) );
  AO222X1_LVT U239 ( .A1(status_reg[5]), .A2(net26526), .A3(status_reg[4]), 
        .A4(net26527), .A5(i_status[4]), .A6(net27749), .Y(n174) );
  AO222X1_LVT U240 ( .A1(status_reg[6]), .A2(net26526), .A3(status_reg[5]), 
        .A4(net26527), .A5(i_status[5]), .A6(net27749), .Y(n173) );
  AO222X1_LVT U241 ( .A1(status_reg[7]), .A2(net26526), .A3(status_reg[6]), 
        .A4(net26527), .A5(i_status[6]), .A6(net27749), .Y(n172) );
  AO222X1_LVT U242 ( .A1(status_reg[8]), .A2(net26526), .A3(status_reg[7]), 
        .A4(net26527), .A5(i_status[7]), .A6(net27749), .Y(n171) );
  AO222X1_LVT U243 ( .A1(status_reg[9]), .A2(net26526), .A3(status_reg[8]), 
        .A4(net26527), .A5(i_status[8]), .A6(net27749), .Y(n170) );
  AO222X1_LVT U244 ( .A1(status_reg[10]), .A2(net26526), .A3(status_reg[9]), 
        .A4(net26527), .A5(i_status[9]), .A6(net27749), .Y(n1690) );
  AO222X1_LVT U245 ( .A1(status_reg[11]), .A2(net26526), .A3(status_reg[10]), 
        .A4(net26527), .A5(i_status[10]), .A6(net27749), .Y(n1680) );
  AO222X1_LVT U246 ( .A1(status_reg[12]), .A2(net26526), .A3(status_reg[11]), 
        .A4(net26527), .A5(i_status[11]), .A6(net27749), .Y(n1670) );
  AO222X1_LVT U247 ( .A1(status_reg[13]), .A2(net26526), .A3(status_reg[12]), 
        .A4(net26527), .A5(i_status[12]), .A6(net27749), .Y(n1660) );
  AO222X1_LVT U248 ( .A1(status_reg[14]), .A2(net26526), .A3(status_reg[13]), 
        .A4(net26527), .A5(i_status[13]), .A6(net27749), .Y(n1650) );
  INVX1_LVT U249 ( .A(net26508), .Y(net26518) );
  AO222X1_LVT U250 ( .A1(net26508), .A2(n58), .A3(net27788), .A4(n57), .A5(
        i_rf_din[1]), .A6(net27846), .Y(n159) );
  AO222X1_LVT U251 ( .A1(net26508), .A2(n59), .A3(net27788), .A4(n58), .A5(
        i_rf_din[2]), .A6(net27846), .Y(n158) );
  AO222X1_LVT U252 ( .A1(net26508), .A2(n60), .A3(net27788), .A4(n59), .A5(
        i_rf_din[3]), .A6(net27846), .Y(n157) );
  AO222X1_LVT U253 ( .A1(net26508), .A2(n61), .A3(net27788), .A4(n60), .A5(
        i_rf_din[4]), .A6(net27846), .Y(n156) );
  AO222X1_LVT U254 ( .A1(net26508), .A2(net26510), .A3(net27788), .A4(n61), 
        .A5(i_rf_din[5]), .A6(net27846), .Y(n155) );
  AND2X1_LVT U255 ( .A1(o_rf_wre), .A2(net26490), .Y(o_dout[0]) );
  AND2X1_LVT U256 ( .A1(o_rf_wre), .A2(n9), .Y(o_dout[1]) );
  AND2X1_LVT U257 ( .A1(o_rf_wre), .A2(net26488), .Y(o_dout[2]) );
  AND2X1_LVT U258 ( .A1(o_rf_wre), .A2(net26482), .Y(o_dout[3]) );
  AND2X1_LVT U259 ( .A1(o_rf_wre), .A2(net26485), .Y(o_dout[5]) );
  AND2X1_LVT U260 ( .A1(o_rf_wre), .A2(net28075), .Y(o_dout[7]) );
  AO222X1_LVT U261 ( .A1(N169), .A2(n38), .A3(net27845), .A4(net28075), .A5(
        rf_add_reg[7]), .A6(net26483), .Y(n1380) );
  AO222X1_LVT U262 ( .A1(N168), .A2(n38), .A3(net27845), .A4(n6), .A5(
        rf_add_reg[6]), .A6(net26483), .Y(n1390) );
  AO222X1_LVT U263 ( .A1(N167), .A2(n38), .A3(net27845), .A4(net26485), .A5(
        rf_add_reg[5]), .A6(net26483), .Y(n140) );
  AO222X1_LVT U264 ( .A1(N165), .A2(n38), .A3(net27845), .A4(net26482), .A5(
        rf_add_reg[3]), .A6(net26483), .Y(n142) );
  INVX0_HVT U7 ( .A(n19), .Y(n15) );
  INVX0_LVT U228 ( .A(net26544), .Y(n67) );
  spi_slave_DW01_inc_0 r102 ( .A(rf_add_reg), .SUM({N169, N168, N167, N166, 
        N165, N164, N163, N162}) );
  DELLN1X2_RVT U9 ( .A(n62), .Y(n3) );
  INVX1_LVT U14 ( .A(net26535), .Y(net26544) );
  NAND3X2_LVT U220 ( .A1(net27909), .A2(net27764), .A3(N207), .Y(n46) );
  INVX0_LVT U265 ( .A(net26540), .Y(N207) );
endmodule


module dig_tx_fifo_synchronizer_PTR_WIDTH3_0 ( i_dig_tx_fifo_synchronizer_clk, 
        i_dig_tx_fifo_synchronizer_rst_n, i_dig_tx_fifo_synchronizer_d_in, 
        o_dig_tx_fifo_synchronizer_d_out );
  input [3:0] i_dig_tx_fifo_synchronizer_d_in;
  output [3:0] o_dig_tx_fifo_synchronizer_d_out;
  input i_dig_tx_fifo_synchronizer_clk, i_dig_tx_fifo_synchronizer_rst_n;
  wire   n3, n6, n9, n12;

  SDFFARX1_LVT metastable_flop_reg_3_ ( .D(i_dig_tx_fifo_synchronizer_d_in[3]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n12) );
  SDFFASX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_3_ ( .D(n12), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[3]) );
  SDFFARX1_LVT metastable_flop_reg_2_ ( .D(i_dig_tx_fifo_synchronizer_d_in[2]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n9) );
  SDFFASX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_2_ ( .D(n9), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[2]) );
  SDFFARX1_LVT metastable_flop_reg_1_ ( .D(i_dig_tx_fifo_synchronizer_d_in[1]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n6) );
  SDFFASX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_1_ ( .D(n6), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[1]) );
  SDFFARX1_LVT metastable_flop_reg_0_ ( .D(i_dig_tx_fifo_synchronizer_d_in[0]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n3) );
  SDFFASX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_0_ ( .D(n3), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[0]) );
endmodule


module dig_tx_fifo_synchronizer_PTR_WIDTH3_1 ( i_dig_tx_fifo_synchronizer_clk, 
        i_dig_tx_fifo_synchronizer_rst_n, i_dig_tx_fifo_synchronizer_d_in, 
        o_dig_tx_fifo_synchronizer_d_out );
  input [3:0] i_dig_tx_fifo_synchronizer_d_in;
  output [3:0] o_dig_tx_fifo_synchronizer_d_out;
  input i_dig_tx_fifo_synchronizer_clk, i_dig_tx_fifo_synchronizer_rst_n;
  wire   n13, n16, n19, n22;

  SDFFARX1_LVT metastable_flop_reg_3_ ( .D(i_dig_tx_fifo_synchronizer_d_in[3]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n13) );
  SDFFASX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_3_ ( .D(n13), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[3]) );
  SDFFARX1_LVT metastable_flop_reg_2_ ( .D(i_dig_tx_fifo_synchronizer_d_in[2]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n16) );
  SDFFASX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_2_ ( .D(n16), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[2]) );
  SDFFARX1_LVT metastable_flop_reg_1_ ( .D(i_dig_tx_fifo_synchronizer_d_in[1]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n19) );
  SDFFASX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_1_ ( .D(n19), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[1]) );
  SDFFARX1_LVT metastable_flop_reg_0_ ( .D(i_dig_tx_fifo_synchronizer_d_in[0]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n22) );
  SDFFASX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_0_ ( .D(n22), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[0]) );
endmodule


module dig_tx_fifo_wr_ptr_handler_PTR_WIDTH3 ( 
        i_dig_tx_fifo_wr_ptr_handler_clk26, 
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n, 
        i_dig_tx_fifo_wr_ptr_handler_wr_en, 
        i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync, 
        o_dig_tx_fifo_wr_ptr_handler_b_wptr, 
        o_dig_tx_fifo_wr_ptr_handler_g_wptr, o_dig_tx_fifo_wr_ptr_handler_full
 );
  input [3:0] i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync;
  output [3:0] o_dig_tx_fifo_wr_ptr_handler_b_wptr;
  output [3:0] o_dig_tx_fifo_wr_ptr_handler_g_wptr;
  input i_dig_tx_fifo_wr_ptr_handler_clk26,
         i_dig_tx_fifo_wr_ptr_handler_wr_rst_n,
         i_dig_tx_fifo_wr_ptr_handler_wr_en;
  output o_dig_tx_fifo_wr_ptr_handler_full;
  wire   wfull, n10, n11, n12, n14, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32;
  wire   [2:0] b_wptr_next;
  wire   [2:0] g_wptr_next;

  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_0_ ( .D(b_wptr_next[0]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]) );
  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_full_reg ( .D(wfull), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_full), .QN(n10) );
  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_3_ ( .D(n12), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[3]) );
  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_2_ ( .D(g_wptr_next[2]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[2]) );
  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_1_ ( .D(g_wptr_next[1]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[1]) );
  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_0_ ( .D(g_wptr_next[0]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[0]) );
  SDFFARX1_RVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_1_ ( .D(b_wptr_next[1]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[1]) );
  SDFFARX1_RVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_2_ ( .D(b_wptr_next[2]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[2]) );
  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_3_ ( .D(n12), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[3]), .QN(n11) );
  INVX0_RVT U12 ( .A(n25), .Y(g_wptr_next[0]) );
  NAND2X0_RVT U13 ( .A1(n10), .A2(i_dig_tx_fifo_wr_ptr_handler_wr_en), .Y(n17)
         );
  XOR2X2_LVT U15 ( .A1(i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[3]), .A2(n12), 
        .Y(n29) );
  XOR2X2_LVT U16 ( .A1(n16), .A2(n11), .Y(n31) );
  NBUFFX2_LVT U19 ( .A(n31), .Y(n12) );
  INVX1_LVT U20 ( .A(i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[2]), .Y(n14) );
  XOR2X1_LVT U21 ( .A1(n18), .A2(o_dig_tx_fifo_wr_ptr_handler_b_wptr[1]), .Y(
        n21) );
  XOR2X2_LVT U23 ( .A1(n23), .A2(n14), .Y(n28) );
  INVX1_LVT U24 ( .A(n30), .Y(wfull) );
  NAND3X0_LVT U25 ( .A1(i_dig_tx_fifo_wr_ptr_handler_wr_en), .A2(n10), .A3(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]), .Y(n18) );
  XOR2X2_LVT U27 ( .A1(n17), .A2(o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]), .Y(
        n22) );
  INVX1_LVT U28 ( .A(n22), .Y(b_wptr_next[0]) );
  INVX1_LVT U29 ( .A(n21), .Y(b_wptr_next[1]) );
  XOR2X2_LVT U30 ( .A1(n19), .A2(o_dig_tx_fifo_wr_ptr_handler_b_wptr[2]), .Y(
        n20) );
  XOR2X2_LVT U31 ( .A1(n31), .A2(n20), .Y(n23) );
  INVX1_LVT U32 ( .A(n23), .Y(g_wptr_next[2]) );
  XOR2X2_LVT U33 ( .A1(n21), .A2(b_wptr_next[2]), .Y(n24) );
  INVX1_LVT U34 ( .A(n24), .Y(g_wptr_next[1]) );
  XOR2X2_LVT U35 ( .A1(n22), .A2(b_wptr_next[1]), .Y(n25) );
  XOR2X2_LVT U36 ( .A1(n24), .A2(i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[1]), 
        .Y(n27) );
  XOR2X2_LVT U37 ( .A1(n25), .A2(i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[0]), 
        .Y(n26) );
  NAND4X0_LVT U38 ( .A1(n28), .A2(n29), .A3(n27), .A4(n26), .Y(n30) );
  OR2X1_LVT U17 ( .A1(n32), .A2(n18), .Y(n16) );
  NAND2X2_LVT U22 ( .A1(o_dig_tx_fifo_wr_ptr_handler_b_wptr[2]), .A2(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[1]), .Y(n32) );
  NAND4X0_LVT U14 ( .A1(i_dig_tx_fifo_wr_ptr_handler_wr_en), .A2(n10), .A3(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]), .A4(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[1]), .Y(n19) );
  INVX2_LVT U18 ( .A(n20), .Y(b_wptr_next[2]) );
endmodule


module dig_tx_fifo_re_ptr_handler_PTR_WIDTH3 ( 
        i_dig_tx_fifo_re_ptr_handler_clk32, 
        i_dig_tx_fifo_re_ptr_handler_re_rst_n, 
        i_dig_tx_fifo_re_ptr_handler_re_en, 
        i_dig_tx_fifo_re_ptr_handler_g_wptr_sync, 
        o_dig_tx_fifo_re_ptr_handler_b_rptr, 
        o_dig_tx_fifo_re_ptr_handler_g_rptr, 
        o_dig_tx_fifo_re_ptr_handler_empty );
  input [3:0] i_dig_tx_fifo_re_ptr_handler_g_wptr_sync;
  output [3:0] o_dig_tx_fifo_re_ptr_handler_b_rptr;
  output [3:0] o_dig_tx_fifo_re_ptr_handler_g_rptr;
  input i_dig_tx_fifo_re_ptr_handler_clk32,
         i_dig_tx_fifo_re_ptr_handler_re_rst_n,
         i_dig_tx_fifo_re_ptr_handler_re_en;
  output o_dig_tx_fifo_re_ptr_handler_empty;
  wire   n46, n47, b_rptr_next_1_, imediate_empty, n11, n16, n10, n12, n13,
         n14, n15, n17, n18, n19, n20, n21, n22, n24, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;
  wire   [2:1] g_rptr_next;

  SDFFASX1_LVT o_dig_tx_fifo_re_ptr_handler_empty_reg ( .D(imediate_empty), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .SETB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_empty), .QN(n11) );
  SDFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_3_ ( .D(n18), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_b_rptr[3]), .QN(n19) );
  SDFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_3_ ( .D(n18), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[3]) );
  SDFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_2_ ( .D(g_rptr_next[2]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[2]) );
  SDFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_1_ ( .D(g_rptr_next[1]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[1]) );
  SDFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_0_ ( .D(n45), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[0]) );
  SDFFASX2_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_2_ ( .D(n16), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .SETB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(n20), .QN(
        o_dig_tx_fifo_re_ptr_handler_b_rptr[2]) );
  SDFFARX2_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_0_ ( .D(n14), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(n47), .QN(n24) );
  SDFFARX2_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_1_ ( .D(b_rptr_next_1_), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(n46), .QN(n22) );
  INVX0_LVT U12 ( .A(n28), .Y(n29) );
  XNOR3X2_LVT U13 ( .A1(i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[1]), .A2(n21), 
        .A3(n26), .Y(n35) );
  AND2X2_LVT U14 ( .A1(i_dig_tx_fifo_re_ptr_handler_re_en), .A2(n15), .Y(n26)
         );
  NAND2X0_LVT U15 ( .A1(i_dig_tx_fifo_re_ptr_handler_re_en), .A2(n17), .Y(n27)
         );
  INVX4_LVT U16 ( .A(n34), .Y(b_rptr_next_1_) );
  NAND2X0_LVT U17 ( .A1(i_dig_tx_fifo_re_ptr_handler_re_en), .A2(n11), .Y(n30)
         );
  NAND2X0_LVT U18 ( .A1(i_dig_tx_fifo_re_ptr_handler_re_en), .A2(n15), .Y(n38)
         );
  XOR2X2_LVT U19 ( .A1(b_rptr_next_1_), .A2(n14), .Y(n45) );
  XOR2X2_LVT U20 ( .A1(n44), .A2(b_rptr_next_1_), .Y(g_rptr_next[1]) );
  XNOR3X2_LVT U21 ( .A1(i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[0]), .A2(n12), 
        .A3(n10), .Y(n33) );
  NBUFFX2_LVT U22 ( .A(n30), .Y(n10) );
  INVX2_LVT U23 ( .A(n22), .Y(o_dig_tx_fifo_re_ptr_handler_b_rptr[1]) );
  XNOR2X1_LVT U24 ( .A1(n19), .A2(i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[2]), 
        .Y(n13) );
  XOR2X2_LVT U25 ( .A1(n38), .A2(n21), .Y(n16) );
  INVX2_LVT U26 ( .A(n24), .Y(o_dig_tx_fifo_re_ptr_handler_b_rptr[0]) );
  INVX1_LVT U27 ( .A(n47), .Y(n12) );
  XOR2X1_LVT U28 ( .A1(n10), .A2(n12), .Y(n14) );
  AND2X1_LVT U29 ( .A1(n46), .A2(n17), .Y(n15) );
  AND2X1_LVT U30 ( .A1(n47), .A2(n11), .Y(n17) );
  XNOR3X1_LVT U31 ( .A1(i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[3]), .A2(
        o_dig_tx_fifo_re_ptr_handler_b_rptr[3]), .A3(n29), .Y(n43) );
  XOR2X2_LVT U32 ( .A1(n28), .A2(n19), .Y(n18) );
  INVX1_LVT U33 ( .A(n20), .Y(n21) );
  XOR2X2_LVT U34 ( .A1(n27), .A2(n46), .Y(n34) );
  NAND2X0_LVT U35 ( .A1(n26), .A2(n21), .Y(n28) );
  INVX1_LVT U36 ( .A(n33), .Y(n32) );
  INVX1_LVT U37 ( .A(n35), .Y(n31) );
  NAND3X0_LVT U38 ( .A1(n32), .A2(n31), .A3(b_rptr_next_1_), .Y(n37) );
  NAND3X0_LVT U39 ( .A1(n35), .A2(n34), .A3(n33), .Y(n36) );
  NAND2X0_LVT U40 ( .A1(n37), .A2(n36), .Y(n42) );
  NAND3X0_LVT U41 ( .A1(n26), .A2(n13), .A3(n21), .Y(n39) );
  OA221X1_LVT U42 ( .A1(n26), .A2(n13), .A3(n21), .A4(n13), .A5(n39), .Y(n40)
         );
  XOR2X2_LVT U43 ( .A1(n40), .A2(n16), .Y(n41) );
  AND3X1_LVT U44 ( .A1(n43), .A2(n42), .A3(n41), .Y(imediate_empty) );
  INVX1_LVT U45 ( .A(n16), .Y(n44) );
  XOR2X2_LVT U46 ( .A1(n18), .A2(n44), .Y(g_rptr_next[2]) );
endmodule


module dig_tx_fifo_mem_FIFO_DEPTH8_REGISTER_WIDTH12_PTR_WIDTH3_test_1 ( 
        i_dig_tx_fifo_mem_clk26, i_dig_tx_fifo_mem_wr_en, 
        i_dig_tx_fifo_mem_b_wptr, i_dig_tx_fifo_mem_b_rptr, 
        i_dig_tx_fifo_mem_data_in, i_dig_tx_fifo_mem_full, 
        o_dig_tx_fifo_mem_data_out, test_si, test_so, test_se );
  input [3:0] i_dig_tx_fifo_mem_b_wptr;
  input [3:0] i_dig_tx_fifo_mem_b_rptr;
  input [11:0] i_dig_tx_fifo_mem_data_in;
  output [11:0] o_dig_tx_fifo_mem_data_out;
  input i_dig_tx_fifo_mem_clk26, i_dig_tx_fifo_mem_wr_en,
         i_dig_tx_fifo_mem_full, test_si, test_se;
  output test_so;
  wire   n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, C222_net26373,
         C222_net26362, C222_net26361, C222_net26360, C222_net26355,
         C222_net26354, C222_net26352, C222_net26351, C222_net26348,
         C222_net26347, C222_net26346, C222_net26345, C222_net26300, net27782,
         net27836, net27979, net28179, net28208, net28207, C222_net26358,
         C222_net26356, net30532, net47357, net47434, net30504, net30484,
         C222_net26339, C222_net26338, C222_net26337, C222_net26301, net47405,
         net28166, net27844, net27801, net27796, C222_net26371, C222_net26349,
         C222_net26343, C222_net26341, C222_net26340, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343;
  wire   [95:0] fifo;

  SDFFX1_LVT fifo_reg_0__11_ ( .D(n215), .SI(n333), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[95]), .QN(n332) );
  SDFFX1_LVT fifo_reg_0__10_ ( .D(n214), .SI(n334), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[94]), .QN(n333) );
  SDFFX1_LVT fifo_reg_0__9_ ( .D(n213), .SI(n335), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[93]), .QN(n334) );
  SDFFX1_LVT fifo_reg_0__8_ ( .D(n212), .SI(n336), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[92]), .QN(n335) );
  SDFFX1_LVT fifo_reg_0__7_ ( .D(n211), .SI(n337), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[91]), .QN(n336) );
  SDFFX1_LVT fifo_reg_0__6_ ( .D(n210), .SI(n338), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[90]), .QN(n337) );
  SDFFX1_LVT fifo_reg_0__5_ ( .D(n209), .SI(n339), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[89]), .QN(n338) );
  SDFFX1_LVT fifo_reg_0__4_ ( .D(n208), .SI(n340), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[88]), .QN(n339) );
  SDFFX1_LVT fifo_reg_0__3_ ( .D(n207), .SI(n341), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[87]), .QN(n340) );
  SDFFX1_LVT fifo_reg_0__2_ ( .D(n206), .SI(n342), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[86]), .QN(n341) );
  SDFFX1_LVT fifo_reg_0__1_ ( .D(n205), .SI(n343), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[85]), .QN(n342) );
  SDFFX1_LVT fifo_reg_0__0_ ( .D(n204), .SI(test_si), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[84]), .QN(n343) );
  SDFFX1_LVT fifo_reg_1__11_ ( .D(n203), .SI(n108), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[83]), .QN(n321) );
  SDFFX1_LVT fifo_reg_1__10_ ( .D(n202), .SI(n322), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[82]), .QN(n108) );
  SDFFX1_LVT fifo_reg_1__9_ ( .D(n201), .SI(n323), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[81]), .QN(n322) );
  SDFFX1_LVT fifo_reg_1__8_ ( .D(n200), .SI(n324), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[80]), .QN(n323) );
  SDFFX1_LVT fifo_reg_1__7_ ( .D(n199), .SI(n325), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[79]), .QN(n324) );
  SDFFX1_LVT fifo_reg_1__6_ ( .D(n198), .SI(n326), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[78]), .QN(n325) );
  SDFFX1_LVT fifo_reg_1__5_ ( .D(n197), .SI(n327), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[77]), .QN(n326) );
  SDFFX1_LVT fifo_reg_1__4_ ( .D(n196), .SI(n328), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[76]), .QN(n327) );
  SDFFX1_LVT fifo_reg_1__3_ ( .D(n195), .SI(n329), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[75]), .QN(n328) );
  SDFFX1_LVT fifo_reg_1__2_ ( .D(n194), .SI(n330), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[74]), .QN(n329) );
  SDFFX1_LVT fifo_reg_1__1_ ( .D(n193), .SI(n331), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[73]), .QN(n330) );
  SDFFX1_LVT fifo_reg_1__0_ ( .D(n192), .SI(n332), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[72]), .QN(n331) );
  SDFFX1_LVT fifo_reg_2__11_ ( .D(n191), .SI(n310), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[71]), .QN(n309) );
  SDFFX1_LVT fifo_reg_2__10_ ( .D(n190), .SI(n311), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[70]), .QN(n310) );
  SDFFX1_LVT fifo_reg_2__9_ ( .D(n189), .SI(n312), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[69]), .QN(n311) );
  SDFFX1_LVT fifo_reg_2__8_ ( .D(n188), .SI(n313), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[68]), .QN(n312) );
  SDFFX1_LVT fifo_reg_2__7_ ( .D(n187), .SI(n314), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[67]), .QN(n313) );
  SDFFX1_LVT fifo_reg_2__6_ ( .D(n186), .SI(n315), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[66]), .QN(n314) );
  SDFFX1_LVT fifo_reg_2__5_ ( .D(n185), .SI(n316), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[65]), .QN(n315) );
  SDFFX1_LVT fifo_reg_2__4_ ( .D(n184), .SI(n317), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[64]), .QN(n316) );
  SDFFX1_LVT fifo_reg_2__3_ ( .D(n183), .SI(n318), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[63]), .QN(n317) );
  SDFFX1_LVT fifo_reg_2__2_ ( .D(n182), .SI(n319), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[62]), .QN(n318) );
  SDFFX1_LVT fifo_reg_2__1_ ( .D(n181), .SI(n320), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[61]), .QN(n319) );
  SDFFX1_LVT fifo_reg_2__0_ ( .D(n180), .SI(n321), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[60]), .QN(n320) );
  SDFFX1_LVT fifo_reg_3__11_ ( .D(n179), .SI(n298), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[59]), .QN(n297) );
  SDFFX1_LVT fifo_reg_3__10_ ( .D(n178), .SI(n299), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[58]), .QN(n298) );
  SDFFX1_LVT fifo_reg_3__9_ ( .D(n177), .SI(n300), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[57]), .QN(n299) );
  SDFFX1_LVT fifo_reg_3__8_ ( .D(n176), .SI(n301), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[56]), .QN(n300) );
  SDFFX1_LVT fifo_reg_3__7_ ( .D(n175), .SI(n302), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[55]), .QN(n301) );
  SDFFX1_LVT fifo_reg_3__6_ ( .D(n174), .SI(n303), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[54]), .QN(n302) );
  SDFFX1_LVT fifo_reg_3__5_ ( .D(n173), .SI(n304), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[53]), .QN(n303) );
  SDFFX1_LVT fifo_reg_3__4_ ( .D(n172), .SI(n305), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[52]), .QN(n304) );
  SDFFX1_LVT fifo_reg_3__3_ ( .D(n171), .SI(n306), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[51]), .QN(n305) );
  SDFFX1_LVT fifo_reg_3__2_ ( .D(n170), .SI(n307), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[50]), .QN(n306) );
  SDFFX1_LVT fifo_reg_3__1_ ( .D(n169), .SI(n308), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[49]), .QN(n307) );
  SDFFX1_LVT fifo_reg_3__0_ ( .D(n168), .SI(n309), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[48]), .QN(n308) );
  SDFFX1_LVT fifo_reg_4__11_ ( .D(n167), .SI(n286), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[47]), .QN(n285) );
  SDFFX1_LVT fifo_reg_4__10_ ( .D(n166), .SI(n287), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[46]), .QN(n286) );
  SDFFX1_LVT fifo_reg_4__9_ ( .D(n165), .SI(n288), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[45]), .QN(n287) );
  SDFFX1_LVT fifo_reg_4__8_ ( .D(n164), .SI(n289), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[44]), .QN(n288) );
  SDFFX1_LVT fifo_reg_4__7_ ( .D(n163), .SI(n290), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[43]), .QN(n289) );
  SDFFX1_LVT fifo_reg_4__6_ ( .D(n162), .SI(n291), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[42]), .QN(n290) );
  SDFFX1_LVT fifo_reg_4__5_ ( .D(n161), .SI(n292), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[41]), .QN(n291) );
  SDFFX1_LVT fifo_reg_4__4_ ( .D(n160), .SI(n293), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[40]), .QN(n292) );
  SDFFX1_LVT fifo_reg_4__3_ ( .D(n159), .SI(n294), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[39]), .QN(n293) );
  SDFFX1_LVT fifo_reg_4__2_ ( .D(n158), .SI(n295), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[38]), .QN(n294) );
  SDFFX1_LVT fifo_reg_4__1_ ( .D(n157), .SI(n296), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[37]), .QN(n295) );
  SDFFX1_LVT fifo_reg_4__0_ ( .D(n156), .SI(n297), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[36]), .QN(n296) );
  SDFFX1_LVT fifo_reg_5__11_ ( .D(n155), .SI(n100), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[35]), .QN(n274) );
  SDFFX1_LVT fifo_reg_5__10_ ( .D(n154), .SI(n275), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[34]), .QN(n100) );
  SDFFX1_LVT fifo_reg_5__9_ ( .D(n153), .SI(n276), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[33]), .QN(n275) );
  SDFFX1_LVT fifo_reg_5__8_ ( .D(n152), .SI(n277), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[32]), .QN(n276) );
  SDFFX1_LVT fifo_reg_5__7_ ( .D(n151), .SI(n278), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[31]), .QN(n277) );
  SDFFX1_LVT fifo_reg_5__6_ ( .D(n150), .SI(n279), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[30]), .QN(n278) );
  SDFFX1_LVT fifo_reg_5__5_ ( .D(n149), .SI(n280), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[29]), .QN(n279) );
  SDFFX1_LVT fifo_reg_5__4_ ( .D(n148), .SI(n281), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[28]), .QN(n280) );
  SDFFX1_LVT fifo_reg_5__3_ ( .D(n147), .SI(n282), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[27]), .QN(n281) );
  SDFFX1_LVT fifo_reg_5__2_ ( .D(n146), .SI(n283), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[26]), .QN(n282) );
  SDFFX1_LVT fifo_reg_5__1_ ( .D(n145), .SI(n284), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[25]), .QN(n283) );
  SDFFX1_LVT fifo_reg_5__0_ ( .D(n144), .SI(n285), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[24]), .QN(n284) );
  SDFFX1_LVT fifo_reg_6__11_ ( .D(n143), .SI(n263), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[23]), .QN(n262) );
  SDFFX1_LVT fifo_reg_6__10_ ( .D(n142), .SI(n264), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[22]), .QN(n263) );
  SDFFX1_LVT fifo_reg_6__9_ ( .D(n141), .SI(n265), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[21]), .QN(n264) );
  SDFFX1_LVT fifo_reg_6__8_ ( .D(n140), .SI(n266), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[20]), .QN(n265) );
  SDFFX1_LVT fifo_reg_6__7_ ( .D(n139), .SI(n267), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[19]), .QN(n266) );
  SDFFX1_LVT fifo_reg_6__6_ ( .D(n138), .SI(n268), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[18]), .QN(n267) );
  SDFFX1_LVT fifo_reg_6__5_ ( .D(n137), .SI(n269), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[17]), .QN(n268) );
  SDFFX1_LVT fifo_reg_6__4_ ( .D(n136), .SI(n270), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[16]), .QN(n269) );
  SDFFX1_LVT fifo_reg_6__3_ ( .D(n135), .SI(n271), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[15]), .QN(n270) );
  SDFFX1_LVT fifo_reg_6__2_ ( .D(n134), .SI(n272), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[14]), .QN(n271) );
  SDFFX1_LVT fifo_reg_6__1_ ( .D(n133), .SI(n273), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[13]), .QN(n272) );
  SDFFX1_LVT fifo_reg_6__0_ ( .D(n132), .SI(n274), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[12]), .QN(n273) );
  SDFFX1_LVT fifo_reg_7__11_ ( .D(n131), .SI(n251), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[11]), .QN(test_so) );
  SDFFX1_LVT fifo_reg_7__10_ ( .D(n130), .SI(n252), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[10]), .QN(n251) );
  SDFFX1_LVT fifo_reg_7__9_ ( .D(n129), .SI(n253), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[9]), .QN(n252) );
  SDFFX1_LVT fifo_reg_7__8_ ( .D(n128), .SI(n254), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[8]), .QN(n253) );
  SDFFX1_LVT fifo_reg_7__7_ ( .D(n127), .SI(n255), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[7]), .QN(n254) );
  SDFFX1_LVT fifo_reg_7__6_ ( .D(n126), .SI(n256), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[6]), .QN(n255) );
  SDFFX1_LVT fifo_reg_7__5_ ( .D(n125), .SI(n257), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[5]), .QN(n256) );
  SDFFX1_LVT fifo_reg_7__4_ ( .D(n124), .SI(n258), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[4]), .QN(n257) );
  SDFFX1_LVT fifo_reg_7__3_ ( .D(n123), .SI(n259), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[3]), .QN(n258) );
  SDFFX1_LVT fifo_reg_7__2_ ( .D(n122), .SI(n260), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[2]), .QN(n259) );
  SDFFX1_LVT fifo_reg_7__1_ ( .D(n121), .SI(n261), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[1]), .QN(n260) );
  SDFFX1_LVT fifo_reg_7__0_ ( .D(n120), .SI(n262), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[0]), .QN(n261) );
  INVX1_LVT U98 ( .A(net30504), .Y(net30484) );
  NAND3X0_LVT U99 ( .A1(n97), .A2(net30504), .A3(fifo[9]), .Y(C222_net26346)
         );
  NAND3X0_LVT U100 ( .A1(fifo[8]), .A2(n97), .A3(net30504), .Y(C222_net26338)
         );
  AND2X1_LVT U101 ( .A1(n97), .A2(net30504), .Y(net27782) );
  OR3X2_LVT U102 ( .A1(i_dig_tx_fifo_mem_b_rptr[1]), .A2(C222_net26373), .A3(
        net30504), .Y(C222_net26356) );
  AND2X1_LVT U103 ( .A1(n97), .A2(net30484), .Y(net27836) );
  AND2X1_LVT U104 ( .A1(i_dig_tx_fifo_mem_b_rptr[1]), .A2(
        i_dig_tx_fifo_mem_b_rptr[0]), .Y(n97) );
  AND2X4_LVT U105 ( .A1(n107), .A2(n110), .Y(n98) );
  AND2X4_LVT U106 ( .A1(n109), .A2(n107), .Y(n99) );
  NAND3X0_RVT U107 ( .A1(C222_net26343), .A2(fifo[58]), .A3(n97), .Y(
        C222_net26355) );
  INVX1_LVT U108 ( .A(C222_net26356), .Y(C222_net26301) );
  INVX0_LVT U109 ( .A(i_dig_tx_fifo_mem_b_rptr[2]), .Y(net47405) );
  AND3X2_LVT U110 ( .A1(i_dig_tx_fifo_mem_b_wptr[0]), .A2(n110), .A3(n247), 
        .Y(n101) );
  AND3X4_LVT U111 ( .A1(n109), .A2(n248), .A3(n247), .Y(n102) );
  AND3X4_LVT U112 ( .A1(n110), .A2(n248), .A3(n247), .Y(n103) );
  AND3X2_LVT U113 ( .A1(i_dig_tx_fifo_mem_b_wptr[1]), .A2(n110), .A3(n248), 
        .Y(n104) );
  AND3X4_LVT U114 ( .A1(n109), .A2(i_dig_tx_fifo_mem_b_wptr[1]), .A3(n248), 
        .Y(n105) );
  AND3X4_LVT U115 ( .A1(n109), .A2(i_dig_tx_fifo_mem_b_wptr[0]), .A3(n247), 
        .Y(n106) );
  AND2X1_LVT U116 ( .A1(i_dig_tx_fifo_mem_b_wptr[1]), .A2(
        i_dig_tx_fifo_mem_b_wptr[0]), .Y(n107) );
  INVX4_LVT U117 ( .A(C222_net26358), .Y(C222_net26300) );
  NAND3X2_LVT U118 ( .A1(i_dig_tx_fifo_mem_b_rptr[0]), .A2(C222_net26371), 
        .A3(i_dig_tx_fifo_mem_b_rptr[2]), .Y(C222_net26358) );
  NAND3X0_LVT U119 ( .A1(n97), .A2(fifo[10]), .A3(net30504), .Y(C222_net26354)
         );
  AND3X2_LVT U120 ( .A1(C222_net26373), .A2(C222_net26371), .A3(
        i_dig_tx_fifo_mem_b_rptr[2]), .Y(net27796) );
  AOI221X1_LVT U121 ( .A1(fifo[44]), .A2(net27796), .A3(fifo[92]), .A4(
        net27844), .A5(C222_net26341), .Y(C222_net26340) );
  NAND4X0_LVT U122 ( .A1(C222_net26340), .A2(C222_net26338), .A3(C222_net26339), .A4(C222_net26337), .Y(o_dig_tx_fifo_mem_data_out[8]) );
  AO22X1_LVT U123 ( .A1(net28166), .A2(fifo[68]), .A3(fifo[20]), .A4(net27801), 
        .Y(C222_net26341) );
  MUX21X1_LVT U124 ( .A1(fifo[44]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(
        n102), .Y(n164) );
  INVX0_HVT U125 ( .A(net27796), .Y(net28207) );
  AOI221X1_LVT U126 ( .A1(fifo[45]), .A2(net27796), .A3(fifo[93]), .A4(
        net27844), .A5(C222_net26349), .Y(C222_net26348) );
  NAND2X0_LVT U127 ( .A1(fifo[46]), .A2(net27796), .Y(C222_net26351) );
  INVX2_LVT U128 ( .A(i_dig_tx_fifo_mem_b_rptr[1]), .Y(C222_net26371) );
  AND3X1_LVT U129 ( .A1(C222_net26371), .A2(C222_net26343), .A3(C222_net26373), 
        .Y(net27844) );
  AND3X1_LVT U130 ( .A1(C222_net26371), .A2(net30484), .A3(C222_net26373), .Y(
        net28179) );
  INVX2_LVT U131 ( .A(i_dig_tx_fifo_mem_b_rptr[0]), .Y(C222_net26373) );
  MUX21X1_LVT U132 ( .A1(fifo[92]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(
        n103), .Y(n212) );
  NAND2X0_LVT U133 ( .A1(net27844), .A2(fifo[94]), .Y(C222_net26362) );
  INVX1_LVT U134 ( .A(i_dig_tx_fifo_mem_b_rptr[2]), .Y(C222_net26343) );
  INVX2_LVT U135 ( .A(C222_net26343), .Y(net30504) );
  MUX21X1_LVT U136 ( .A1(fifo[68]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(
        n104), .Y(n188) );
  AND3X1_LVT U137 ( .A1(net47405), .A2(C222_net26373), .A3(
        i_dig_tx_fifo_mem_b_rptr[1]), .Y(net28166) );
  NAND2X0_RVT U138 ( .A1(fifo[70]), .A2(net28166), .Y(C222_net26360) );
  DELLN1X2_LVT U139 ( .A(net28166), .Y(net30532) );
  AO22X1_LVT U140 ( .A1(net28166), .A2(fifo[69]), .A3(fifo[21]), .A4(net27801), 
        .Y(C222_net26349) );
  MUX21X1_LVT U141 ( .A1(fifo[20]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(
        n105), .Y(n140) );
  AND3X2_LVT U142 ( .A1(i_dig_tx_fifo_mem_b_rptr[1]), .A2(C222_net26373), .A3(
        i_dig_tx_fifo_mem_b_rptr[2]), .Y(net27801) );
  NAND2X0_LVT U143 ( .A1(fifo[22]), .A2(net27801), .Y(C222_net26361) );
  NAND3X4_LVT U144 ( .A1(fifo[56]), .A2(net30484), .A3(n97), .Y(C222_net26337)
         );
  NAND3X4_LVT U145 ( .A1(n97), .A2(net30484), .A3(fifo[57]), .Y(C222_net26345)
         );
  AOI22X1_LVT U146 ( .A1(fifo[32]), .A2(C222_net26300), .A3(C222_net26301), 
        .A4(fifo[80]), .Y(C222_net26339) );
  AOI22X1_LVT U147 ( .A1(fifo[33]), .A2(C222_net26300), .A3(C222_net26301), 
        .A4(fifo[81]), .Y(C222_net26347) );
  MUX21X1_LVT U148 ( .A1(fifo[56]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(n98), .Y(n176) );
  MUX21X1_LVT U149 ( .A1(fifo[32]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(
        n106), .Y(n152) );
  MUX21X1_LVT U150 ( .A1(fifo[80]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(
        n101), .Y(n200) );
  INVX0_LVT U151 ( .A(C222_net26356), .Y(net47434) );
  NBUFFX2_LVT U152 ( .A(net27801), .Y(net47357) );
  OA22X1_LVT U153 ( .A1(C222_net26356), .A2(n108), .A3(C222_net26358), .A4(
        n100), .Y(C222_net26352) );
  MUX21X1_LVT U154 ( .A1(fifo[8]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(n99), 
        .Y(n128) );
  INVX1_LVT U155 ( .A(net28207), .Y(net28208) );
  NBUFFX2_LVT U156 ( .A(net27836), .Y(net27979) );
  AND3X2_LVT U157 ( .A1(i_dig_tx_fifo_mem_b_wptr[2]), .A2(
        i_dig_tx_fifo_mem_wr_en), .A3(n246), .Y(n109) );
  AND3X1_LVT U158 ( .A1(i_dig_tx_fifo_mem_wr_en), .A2(n246), .A3(n245), .Y(
        n110) );
  OR3X1_LVT U159 ( .A1(n111), .A2(n112), .A3(n113), .Y(
        o_dig_tx_fifo_mem_data_out[0]) );
  AO221X1_LVT U160 ( .A1(fifo[24]), .A2(C222_net26300), .A3(fifo[72]), .A4(
        net47434), .A5(n114), .Y(n113) );
  AO22X1_LVT U161 ( .A1(fifo[48]), .A2(net27979), .A3(fifo[0]), .A4(net27782), 
        .Y(n114) );
  AO22X1_LVT U162 ( .A1(fifo[84]), .A2(net28179), .A3(fifo[36]), .A4(net28208), 
        .Y(n112) );
  AO22X1_LVT U163 ( .A1(fifo[60]), .A2(net30532), .A3(fifo[12]), .A4(net47357), 
        .Y(n111) );
  OR3X1_LVT U164 ( .A1(n115), .A2(n116), .A3(n117), .Y(
        o_dig_tx_fifo_mem_data_out[1]) );
  AO221X1_LVT U165 ( .A1(fifo[25]), .A2(C222_net26300), .A3(fifo[73]), .A4(
        net47434), .A5(n118), .Y(n117) );
  AO22X1_LVT U166 ( .A1(fifo[49]), .A2(net27979), .A3(fifo[1]), .A4(net27782), 
        .Y(n118) );
  AO22X1_LVT U167 ( .A1(fifo[85]), .A2(net28179), .A3(fifo[37]), .A4(net28208), 
        .Y(n116) );
  AO22X1_LVT U168 ( .A1(fifo[61]), .A2(net30532), .A3(fifo[13]), .A4(net47357), 
        .Y(n115) );
  OR3X1_LVT U169 ( .A1(n119), .A2(n216), .A3(n217), .Y(
        o_dig_tx_fifo_mem_data_out[2]) );
  AO221X1_LVT U170 ( .A1(fifo[26]), .A2(C222_net26300), .A3(fifo[74]), .A4(
        net47434), .A5(n218), .Y(n217) );
  AO22X1_LVT U171 ( .A1(fifo[50]), .A2(net27979), .A3(fifo[2]), .A4(net27782), 
        .Y(n218) );
  AO22X1_LVT U172 ( .A1(fifo[86]), .A2(net28179), .A3(fifo[38]), .A4(net28208), 
        .Y(n216) );
  AO22X1_LVT U173 ( .A1(fifo[62]), .A2(net30532), .A3(fifo[14]), .A4(net47357), 
        .Y(n119) );
  OR3X1_LVT U174 ( .A1(n219), .A2(n220), .A3(n221), .Y(
        o_dig_tx_fifo_mem_data_out[3]) );
  AO221X1_LVT U175 ( .A1(fifo[27]), .A2(C222_net26300), .A3(fifo[75]), .A4(
        net47434), .A5(n222), .Y(n221) );
  AO22X1_LVT U176 ( .A1(fifo[51]), .A2(net27979), .A3(fifo[3]), .A4(net27782), 
        .Y(n222) );
  AO22X1_LVT U177 ( .A1(fifo[87]), .A2(net28179), .A3(fifo[39]), .A4(net28208), 
        .Y(n220) );
  AO22X1_LVT U178 ( .A1(fifo[63]), .A2(net30532), .A3(fifo[15]), .A4(net47357), 
        .Y(n219) );
  OR3X1_LVT U179 ( .A1(n223), .A2(n224), .A3(n225), .Y(
        o_dig_tx_fifo_mem_data_out[4]) );
  AO221X1_LVT U180 ( .A1(fifo[28]), .A2(C222_net26300), .A3(fifo[76]), .A4(
        net47434), .A5(n226), .Y(n225) );
  AO22X1_LVT U181 ( .A1(fifo[52]), .A2(net27979), .A3(fifo[4]), .A4(net27782), 
        .Y(n226) );
  AO22X1_LVT U182 ( .A1(fifo[88]), .A2(net28179), .A3(fifo[40]), .A4(net28208), 
        .Y(n224) );
  AO22X1_LVT U183 ( .A1(fifo[64]), .A2(net30532), .A3(fifo[16]), .A4(net47357), 
        .Y(n223) );
  OR3X1_LVT U184 ( .A1(n227), .A2(n228), .A3(n229), .Y(
        o_dig_tx_fifo_mem_data_out[5]) );
  AO221X1_LVT U185 ( .A1(fifo[29]), .A2(C222_net26300), .A3(fifo[77]), .A4(
        net47434), .A5(n230), .Y(n229) );
  AO22X1_LVT U186 ( .A1(fifo[53]), .A2(net27979), .A3(fifo[5]), .A4(net27782), 
        .Y(n230) );
  AO22X1_LVT U187 ( .A1(fifo[89]), .A2(net28179), .A3(fifo[41]), .A4(net28208), 
        .Y(n228) );
  AO22X1_LVT U188 ( .A1(fifo[65]), .A2(net30532), .A3(fifo[17]), .A4(net47357), 
        .Y(n227) );
  OR3X1_LVT U189 ( .A1(n231), .A2(n232), .A3(n233), .Y(
        o_dig_tx_fifo_mem_data_out[6]) );
  AO221X1_LVT U190 ( .A1(fifo[30]), .A2(C222_net26300), .A3(fifo[78]), .A4(
        net47434), .A5(n234), .Y(n233) );
  AO22X1_LVT U191 ( .A1(fifo[54]), .A2(net27979), .A3(fifo[6]), .A4(net27782), 
        .Y(n234) );
  AO22X1_LVT U192 ( .A1(fifo[90]), .A2(net28179), .A3(fifo[42]), .A4(net28208), 
        .Y(n232) );
  AO22X1_LVT U193 ( .A1(fifo[66]), .A2(net30532), .A3(fifo[18]), .A4(net47357), 
        .Y(n231) );
  OR3X1_LVT U194 ( .A1(n235), .A2(n236), .A3(n237), .Y(
        o_dig_tx_fifo_mem_data_out[7]) );
  AO221X1_LVT U195 ( .A1(fifo[31]), .A2(C222_net26300), .A3(fifo[79]), .A4(
        net47434), .A5(n238), .Y(n237) );
  AO22X1_LVT U196 ( .A1(fifo[55]), .A2(net27979), .A3(fifo[7]), .A4(net27782), 
        .Y(n238) );
  AO22X1_LVT U197 ( .A1(fifo[91]), .A2(net28179), .A3(fifo[43]), .A4(net28208), 
        .Y(n236) );
  AO22X1_LVT U198 ( .A1(fifo[67]), .A2(net30532), .A3(fifo[19]), .A4(net47357), 
        .Y(n235) );
  NAND4X0_LVT U199 ( .A1(C222_net26348), .A2(C222_net26346), .A3(C222_net26347), .A4(C222_net26345), .Y(o_dig_tx_fifo_mem_data_out[9]) );
  NAND4X0_LVT U200 ( .A1(n239), .A2(C222_net26351), .A3(C222_net26352), .A4(
        n240), .Y(o_dig_tx_fifo_mem_data_out[10]) );
  AND2X1_LVT U201 ( .A1(C222_net26354), .A2(C222_net26355), .Y(n240) );
  AND3X1_LVT U202 ( .A1(C222_net26360), .A2(C222_net26361), .A3(C222_net26362), 
        .Y(n239) );
  OR3X1_LVT U203 ( .A1(n241), .A2(n242), .A3(n243), .Y(
        o_dig_tx_fifo_mem_data_out[11]) );
  AO221X1_LVT U204 ( .A1(fifo[35]), .A2(C222_net26300), .A3(fifo[83]), .A4(
        net47434), .A5(n244), .Y(n243) );
  AO22X1_LVT U205 ( .A1(fifo[59]), .A2(net27979), .A3(fifo[11]), .A4(net27782), 
        .Y(n244) );
  AO22X1_LVT U206 ( .A1(fifo[95]), .A2(net28179), .A3(fifo[47]), .A4(net28208), 
        .Y(n242) );
  AO22X1_LVT U207 ( .A1(fifo[71]), .A2(net30532), .A3(fifo[23]), .A4(net47357), 
        .Y(n241) );
  INVX1_LVT U208 ( .A(i_dig_tx_fifo_mem_full), .Y(n246) );
  MUX21X1_LVT U209 ( .A1(fifo[10]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(
        n99), .Y(n130) );
  MUX21X1_LVT U210 ( .A1(fifo[9]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(n99), 
        .Y(n129) );
  MUX21X1_LVT U211 ( .A1(fifo[7]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(n99), 
        .Y(n127) );
  MUX21X1_LVT U212 ( .A1(fifo[6]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(n99), 
        .Y(n126) );
  MUX21X1_LVT U213 ( .A1(fifo[5]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(n99), 
        .Y(n125) );
  MUX21X1_LVT U214 ( .A1(fifo[4]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(n99), 
        .Y(n124) );
  MUX21X1_LVT U215 ( .A1(fifo[3]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(n99), 
        .Y(n123) );
  MUX21X1_LVT U216 ( .A1(fifo[2]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(n99), 
        .Y(n122) );
  MUX21X1_LVT U217 ( .A1(fifo[1]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(n99), 
        .Y(n121) );
  MUX21X1_LVT U218 ( .A1(fifo[0]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(n99), 
        .Y(n120) );
  INVX1_LVT U219 ( .A(i_dig_tx_fifo_mem_b_wptr[0]), .Y(n248) );
  MUX21X1_LVT U220 ( .A1(fifo[22]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(
        n105), .Y(n142) );
  MUX21X1_LVT U221 ( .A1(fifo[21]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(
        n105), .Y(n141) );
  MUX21X1_LVT U222 ( .A1(fifo[19]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(
        n105), .Y(n139) );
  MUX21X1_LVT U223 ( .A1(fifo[18]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(
        n105), .Y(n138) );
  MUX21X1_LVT U224 ( .A1(fifo[17]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(
        n105), .Y(n137) );
  MUX21X1_LVT U225 ( .A1(fifo[16]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(
        n105), .Y(n136) );
  MUX21X1_LVT U226 ( .A1(fifo[15]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        n105), .Y(n135) );
  MUX21X1_LVT U227 ( .A1(fifo[14]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        n105), .Y(n134) );
  MUX21X1_LVT U228 ( .A1(fifo[13]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        n105), .Y(n133) );
  MUX21X1_LVT U229 ( .A1(fifo[12]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        n105), .Y(n132) );
  INVX1_LVT U230 ( .A(i_dig_tx_fifo_mem_b_wptr[1]), .Y(n247) );
  MUX21X1_LVT U231 ( .A1(fifo[34]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(
        n106), .Y(n154) );
  MUX21X1_LVT U232 ( .A1(fifo[33]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(
        n106), .Y(n153) );
  MUX21X1_LVT U233 ( .A1(fifo[31]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(
        n106), .Y(n151) );
  MUX21X1_LVT U234 ( .A1(fifo[30]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(
        n106), .Y(n150) );
  MUX21X1_LVT U235 ( .A1(fifo[29]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(
        n106), .Y(n149) );
  MUX21X1_LVT U236 ( .A1(fifo[28]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(
        n106), .Y(n148) );
  MUX21X1_LVT U237 ( .A1(fifo[27]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        n106), .Y(n147) );
  MUX21X1_LVT U238 ( .A1(fifo[26]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        n106), .Y(n146) );
  MUX21X1_LVT U239 ( .A1(fifo[25]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        n106), .Y(n145) );
  MUX21X1_LVT U240 ( .A1(fifo[24]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        n106), .Y(n144) );
  MUX21X1_LVT U241 ( .A1(fifo[46]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(
        n102), .Y(n166) );
  MUX21X1_LVT U242 ( .A1(fifo[45]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(
        n102), .Y(n165) );
  MUX21X1_LVT U243 ( .A1(fifo[43]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(
        n102), .Y(n163) );
  MUX21X1_LVT U244 ( .A1(fifo[42]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(
        n102), .Y(n162) );
  MUX21X1_LVT U245 ( .A1(fifo[41]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(
        n102), .Y(n161) );
  MUX21X1_LVT U246 ( .A1(fifo[40]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(
        n102), .Y(n160) );
  MUX21X1_LVT U247 ( .A1(fifo[39]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        n102), .Y(n159) );
  MUX21X1_LVT U248 ( .A1(fifo[38]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        n102), .Y(n158) );
  MUX21X1_LVT U249 ( .A1(fifo[37]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        n102), .Y(n157) );
  MUX21X1_LVT U250 ( .A1(fifo[36]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        n102), .Y(n156) );
  INVX1_LVT U251 ( .A(i_dig_tx_fifo_mem_b_wptr[2]), .Y(n245) );
  MUX21X1_LVT U252 ( .A1(fifo[58]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(
        n98), .Y(n178) );
  MUX21X1_LVT U253 ( .A1(fifo[57]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(n98), .Y(n177) );
  MUX21X1_LVT U254 ( .A1(fifo[55]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(n98), .Y(n175) );
  MUX21X1_LVT U255 ( .A1(fifo[54]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(n98), .Y(n174) );
  MUX21X1_LVT U256 ( .A1(fifo[53]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(n98), .Y(n173) );
  MUX21X1_LVT U257 ( .A1(fifo[52]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(n98), .Y(n172) );
  MUX21X1_LVT U258 ( .A1(fifo[51]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(n98), .Y(n171) );
  MUX21X1_LVT U259 ( .A1(fifo[50]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(n98), .Y(n170) );
  MUX21X1_LVT U260 ( .A1(fifo[49]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(n98), .Y(n169) );
  MUX21X1_LVT U261 ( .A1(fifo[48]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(n98), .Y(n168) );
  MUX21X1_LVT U262 ( .A1(fifo[70]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(
        n104), .Y(n190) );
  MUX21X1_LVT U263 ( .A1(fifo[69]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(
        n104), .Y(n189) );
  MUX21X1_LVT U264 ( .A1(fifo[67]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(
        n104), .Y(n187) );
  MUX21X1_LVT U265 ( .A1(fifo[66]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(
        n104), .Y(n186) );
  MUX21X1_LVT U266 ( .A1(fifo[65]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(
        n104), .Y(n185) );
  MUX21X1_LVT U267 ( .A1(fifo[64]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(
        n104), .Y(n184) );
  MUX21X1_LVT U268 ( .A1(fifo[63]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        n104), .Y(n183) );
  MUX21X1_LVT U269 ( .A1(fifo[62]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        n104), .Y(n182) );
  MUX21X1_LVT U270 ( .A1(fifo[61]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        n104), .Y(n181) );
  MUX21X1_LVT U271 ( .A1(fifo[60]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        n104), .Y(n180) );
  MUX21X1_LVT U272 ( .A1(fifo[82]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(
        n101), .Y(n202) );
  MUX21X1_LVT U273 ( .A1(fifo[81]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(
        n101), .Y(n201) );
  MUX21X1_LVT U274 ( .A1(fifo[79]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(
        n101), .Y(n199) );
  MUX21X1_LVT U275 ( .A1(fifo[78]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(
        n101), .Y(n198) );
  MUX21X1_LVT U276 ( .A1(fifo[77]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(
        n101), .Y(n197) );
  MUX21X1_LVT U277 ( .A1(fifo[76]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(
        n101), .Y(n196) );
  MUX21X1_LVT U278 ( .A1(fifo[75]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        n101), .Y(n195) );
  MUX21X1_LVT U279 ( .A1(fifo[74]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        n101), .Y(n194) );
  MUX21X1_LVT U280 ( .A1(fifo[73]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        n101), .Y(n193) );
  MUX21X1_LVT U281 ( .A1(fifo[72]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        n101), .Y(n192) );
  MUX21X1_LVT U282 ( .A1(fifo[94]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(
        n103), .Y(n214) );
  MUX21X1_LVT U283 ( .A1(fifo[93]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(
        n103), .Y(n213) );
  MUX21X1_LVT U284 ( .A1(fifo[91]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(
        n103), .Y(n211) );
  MUX21X1_LVT U285 ( .A1(fifo[90]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(
        n103), .Y(n210) );
  MUX21X1_LVT U286 ( .A1(fifo[89]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(
        n103), .Y(n209) );
  MUX21X1_LVT U287 ( .A1(fifo[88]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(
        n103), .Y(n208) );
  MUX21X1_LVT U288 ( .A1(fifo[87]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        n103), .Y(n207) );
  MUX21X1_LVT U289 ( .A1(fifo[86]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        n103), .Y(n206) );
  MUX21X1_LVT U290 ( .A1(fifo[85]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        n103), .Y(n205) );
  MUX21X1_LVT U291 ( .A1(fifo[84]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        n103), .Y(n204) );
  MUX21X1_LVT U292 ( .A1(fifo[11]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(
        n99), .Y(n131) );
  MUX21X1_LVT U293 ( .A1(fifo[23]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(
        n105), .Y(n143) );
  MUX21X1_LVT U294 ( .A1(fifo[35]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(
        n106), .Y(n155) );
  MUX21X1_LVT U295 ( .A1(fifo[47]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(
        n102), .Y(n167) );
  MUX21X1_LVT U296 ( .A1(fifo[59]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(
        n98), .Y(n179) );
  MUX21X1_LVT U297 ( .A1(fifo[71]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(
        n104), .Y(n191) );
  MUX21X1_LVT U298 ( .A1(fifo[83]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(
        n101), .Y(n203) );
  MUX21X1_LVT U299 ( .A1(fifo[95]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(
        n103), .Y(n215) );
endmodule



    module dig_tx_asyn_fifo_FIFO_DEPTH8_REGISTER_WIDTH8_ADDRESS_WIDTH3_VALID_WIDTH1_test_1 ( 
        i_dig_tx_asyn_fifo_clk26, i_dig_tx_asyn_fifo_clk32, 
        i_dig_tx_asyn_fifo_wr_rst_n, i_dig_tx_asyn_fifo_re_rst_n, 
        i_dig_tx_asyn_fifo_wr_en, i_dig_tx_asyn_fifo_re_en, 
        i_dig_tx_asyn_fifo_data_in, o_dig_tx_asyn_fifo_data_out, 
        o_dig_tx_asyn_fifo_empty, test_si, test_so, test_se );
  input [11:0] i_dig_tx_asyn_fifo_data_in;
  output [11:0] o_dig_tx_asyn_fifo_data_out;
  input i_dig_tx_asyn_fifo_clk26, i_dig_tx_asyn_fifo_clk32,
         i_dig_tx_asyn_fifo_wr_rst_n, i_dig_tx_asyn_fifo_re_rst_n,
         i_dig_tx_asyn_fifo_wr_en, i_dig_tx_asyn_fifo_re_en, test_si, test_se;
  output o_dig_tx_asyn_fifo_empty, test_so;
  wire   asyn_fifo_full, n1, n2, n3, n4, n5, n6;
  wire   [3:0] g_wptr;
  wire   [3:0] g_wptr_sync;
  wire   [3:0] g_rptr;
  wire   [3:0] g_rptr_sync;
  wire   [3:0] b_wptr;
  wire   [3:0] b_rptr;

  INVX4_LVT U1 ( .A(n2), .Y(n1) );
  INVX1_LVT U2 ( .A(i_dig_tx_asyn_fifo_re_rst_n), .Y(n2) );
  INVX4_LVT U3 ( .A(n6), .Y(n5) );
  INVX1_LVT U4 ( .A(i_dig_tx_asyn_fifo_wr_rst_n), .Y(n6) );
  IBUFFX2_HVT U5 ( .A(i_dig_tx_asyn_fifo_wr_en), .Y(n3) );
  INVX1_LVT U6 ( .A(n3), .Y(n4) );
  dig_tx_fifo_synchronizer_PTR_WIDTH3_0 sync_wptr ( 
        .i_dig_tx_fifo_synchronizer_clk(i_dig_tx_asyn_fifo_clk32), 
        .i_dig_tx_fifo_synchronizer_rst_n(n1), 
        .i_dig_tx_fifo_synchronizer_d_in(g_wptr), 
        .o_dig_tx_fifo_synchronizer_d_out(g_wptr_sync) );
  dig_tx_fifo_synchronizer_PTR_WIDTH3_1 sync_rptr ( 
        .i_dig_tx_fifo_synchronizer_clk(i_dig_tx_asyn_fifo_clk26), 
        .i_dig_tx_fifo_synchronizer_rst_n(n5), 
        .i_dig_tx_fifo_synchronizer_d_in(g_rptr), 
        .o_dig_tx_fifo_synchronizer_d_out(g_rptr_sync) );
  dig_tx_fifo_wr_ptr_handler_PTR_WIDTH3 wptr_h ( 
        .i_dig_tx_fifo_wr_ptr_handler_clk26(i_dig_tx_asyn_fifo_clk26), 
        .i_dig_tx_fifo_wr_ptr_handler_wr_rst_n(n5), 
        .i_dig_tx_fifo_wr_ptr_handler_wr_en(i_dig_tx_asyn_fifo_wr_en), 
        .i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync(g_rptr_sync), 
        .o_dig_tx_fifo_wr_ptr_handler_b_wptr(b_wptr), 
        .o_dig_tx_fifo_wr_ptr_handler_g_wptr(g_wptr), 
        .o_dig_tx_fifo_wr_ptr_handler_full(asyn_fifo_full) );
  dig_tx_fifo_re_ptr_handler_PTR_WIDTH3 rptr_h ( 
        .i_dig_tx_fifo_re_ptr_handler_clk32(i_dig_tx_asyn_fifo_clk32), 
        .i_dig_tx_fifo_re_ptr_handler_re_rst_n(n1), 
        .i_dig_tx_fifo_re_ptr_handler_re_en(i_dig_tx_asyn_fifo_re_en), 
        .i_dig_tx_fifo_re_ptr_handler_g_wptr_sync(g_wptr_sync), 
        .o_dig_tx_fifo_re_ptr_handler_b_rptr(b_rptr), 
        .o_dig_tx_fifo_re_ptr_handler_g_rptr(g_rptr), 
        .o_dig_tx_fifo_re_ptr_handler_empty(o_dig_tx_asyn_fifo_empty) );
  dig_tx_fifo_mem_FIFO_DEPTH8_REGISTER_WIDTH12_PTR_WIDTH3_test_1 fifom ( 
        .i_dig_tx_fifo_mem_clk26(i_dig_tx_asyn_fifo_clk26), 
        .i_dig_tx_fifo_mem_wr_en(n4), .i_dig_tx_fifo_mem_b_wptr(b_wptr), 
        .i_dig_tx_fifo_mem_b_rptr(b_rptr), .i_dig_tx_fifo_mem_data_in(
        i_dig_tx_asyn_fifo_data_in), .i_dig_tx_fifo_mem_full(asyn_fifo_full), 
        .o_dig_tx_fifo_mem_data_out(o_dig_tx_asyn_fifo_data_out), .test_si(
        test_si), .test_so(test_so), .test_se(test_se) );
endmodule


module dig_tx_pulse_delayed ( i_dix_pulse_delayed_clk32, 
        i_dix_pulse_delayed_rst_n, i_dix_pulse_delayed_din, o_dix_pulse_d0 );
  input i_dix_pulse_delayed_clk32, i_dix_pulse_delayed_rst_n,
         i_dix_pulse_delayed_din;
  output o_dix_pulse_d0;
  wire   n3;

  SDFFASX1_LVT o_dix_pulse_d0_reg ( .D(n3), .SI(1'b0), .SE(1'b0), .CLK(
        i_dix_pulse_delayed_clk32), .SETB(i_dix_pulse_delayed_rst_n), .QN(
        o_dix_pulse_d0) );
  SDFFARX1_LVT reg_delayed_reg ( .D(i_dix_pulse_delayed_din), .SI(1'b0), .SE(
        1'b0), .CLK(i_dix_pulse_delayed_clk32), .RSTB(
        i_dix_pulse_delayed_rst_n), .QN(n3) );
endmodule


module dig_tx_fifo_synchronizer_PTR_WIDTH2_0 ( i_dig_tx_fifo_synchronizer_clk, 
        i_dig_tx_fifo_synchronizer_rst_n, i_dig_tx_fifo_synchronizer_d_in, 
        o_dig_tx_fifo_synchronizer_d_out );
  input [2:0] i_dig_tx_fifo_synchronizer_d_in;
  output [2:0] o_dig_tx_fifo_synchronizer_d_out;
  input i_dig_tx_fifo_synchronizer_clk, i_dig_tx_fifo_synchronizer_rst_n;
  wire   n3, n6, n9;

  SDFFARX1_LVT metastable_flop_reg_2_ ( .D(i_dig_tx_fifo_synchronizer_d_in[2]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n9) );
  SDFFARX1_LVT metastable_flop_reg_1_ ( .D(i_dig_tx_fifo_synchronizer_d_in[1]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n6) );
  SDFFARX1_LVT metastable_flop_reg_0_ ( .D(i_dig_tx_fifo_synchronizer_d_in[0]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n3) );
  SDFFASX2_HVT o_dig_tx_fifo_synchronizer_d_out_reg_0_ ( .D(n3), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[0]) );
  SDFFASX2_HVT o_dig_tx_fifo_synchronizer_d_out_reg_1_ ( .D(n6), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[1]) );
  SDFFASX2_HVT o_dig_tx_fifo_synchronizer_d_out_reg_2_ ( .D(n9), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[2]) );
endmodule


module dig_tx_fifo_synchronizer_PTR_WIDTH2_1 ( i_dig_tx_fifo_synchronizer_clk, 
        i_dig_tx_fifo_synchronizer_rst_n, i_dig_tx_fifo_synchronizer_d_in, 
        o_dig_tx_fifo_synchronizer_d_out );
  input [2:0] i_dig_tx_fifo_synchronizer_d_in;
  output [2:0] o_dig_tx_fifo_synchronizer_d_out;
  input i_dig_tx_fifo_synchronizer_clk, i_dig_tx_fifo_synchronizer_rst_n;
  wire   n10, n13, n16;

  SDFFARX1_LVT metastable_flop_reg_2_ ( .D(i_dig_tx_fifo_synchronizer_d_in[2]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n10) );
  SDFFASX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_2_ ( .D(n10), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[2]) );
  SDFFARX1_LVT metastable_flop_reg_1_ ( .D(i_dig_tx_fifo_synchronizer_d_in[1]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n13) );
  SDFFASX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_1_ ( .D(n13), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[1]) );
  SDFFARX1_LVT metastable_flop_reg_0_ ( .D(i_dig_tx_fifo_synchronizer_d_in[0]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(n16) );
  SDFFASX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_0_ ( .D(n16), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_synchronizer_clk), .SETB(
        i_dig_tx_fifo_synchronizer_rst_n), .QN(
        o_dig_tx_fifo_synchronizer_d_out[0]) );
endmodule


module dig_tx_fifo_wr_ptr_handler_PTR_WIDTH2 ( 
        i_dig_tx_fifo_wr_ptr_handler_clk26, 
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n, 
        i_dig_tx_fifo_wr_ptr_handler_wr_en, 
        i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync, 
        o_dig_tx_fifo_wr_ptr_handler_b_wptr, 
        o_dig_tx_fifo_wr_ptr_handler_g_wptr, o_dig_tx_fifo_wr_ptr_handler_full
 );
  input [2:0] i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync;
  output [2:0] o_dig_tx_fifo_wr_ptr_handler_b_wptr;
  output [2:0] o_dig_tx_fifo_wr_ptr_handler_g_wptr;
  input i_dig_tx_fifo_wr_ptr_handler_clk26,
         i_dig_tx_fifo_wr_ptr_handler_wr_rst_n,
         i_dig_tx_fifo_wr_ptr_handler_wr_en;
  output o_dig_tx_fifo_wr_ptr_handler_full;
  wire   b_wptr_next_0_, wfull, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24;
  wire   [1:0] g_wptr_next;

  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_0_ ( .D(b_wptr_next_0_), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]) );
  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_full_reg ( .D(wfull), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_full), .QN(n8) );
  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_1_ ( .D(n9), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[1]), .QN(n10) );
  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_2_ ( .D(n11), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[2]), .QN(n12) );
  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_2_ ( .D(n11), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[2]) );
  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_1_ ( .D(g_wptr_next[1]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[1]) );
  SDFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_0_ ( .D(g_wptr_next[0]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(
        i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[0]) );
  XOR2X1_LVT U10 ( .A1(n11), .A2(n9), .Y(g_wptr_next[1]) );
  XOR2X2_LVT U11 ( .A1(n15), .A2(n9), .Y(n21) );
  XOR2X2_LVT U12 ( .A1(n18), .A2(n12), .Y(n11) );
  XOR2X1_LVT U13 ( .A1(n14), .A2(n10), .Y(n9) );
  XNOR2X1_LVT U14 ( .A1(o_dig_tx_fifo_wr_ptr_handler_b_wptr[2]), .A2(
        i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[1]), .Y(n19) );
  XOR2X1_LVT U15 ( .A1(n13), .A2(o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]), .Y(
        n15) );
  XOR2X1_LVT U16 ( .A1(n9), .A2(n20), .Y(n23) );
  XOR2X1_LVT U17 ( .A1(i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[2]), .A2(n11), 
        .Y(n24) );
  XOR2X1_LVT U18 ( .A1(n21), .A2(i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[0]), 
        .Y(n22) );
  NAND3X0_LVT U19 ( .A1(o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]), .A2(n8), .A3(
        i_dig_tx_fifo_wr_ptr_handler_wr_en), .Y(n14) );
  NAND2X0_LVT U20 ( .A1(i_dig_tx_fifo_wr_ptr_handler_wr_en), .A2(n8), .Y(n13)
         );
  INVX1_LVT U21 ( .A(n15), .Y(b_wptr_next_0_) );
  INVX1_LVT U22 ( .A(n14), .Y(n16) );
  NAND2X0_LVT U23 ( .A1(o_dig_tx_fifo_wr_ptr_handler_b_wptr[1]), .A2(n16), .Y(
        n18) );
  INVX1_LVT U24 ( .A(n21), .Y(g_wptr_next[0]) );
  INVX1_LVT U25 ( .A(n19), .Y(n17) );
  OA222X1_LVT U26 ( .A1(n19), .A2(n18), .A3(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[1]), .A4(n17), .A5(n16), .A6(n17), 
        .Y(n20) );
  AND3X1_LVT U27 ( .A1(n24), .A2(n23), .A3(n22), .Y(wfull) );
endmodule


module dig_tx_fifo_re_ptr_handler_PTR_WIDTH2 ( 
        i_dig_tx_fifo_re_ptr_handler_clk32, 
        i_dig_tx_fifo_re_ptr_handler_re_rst_n, 
        i_dig_tx_fifo_re_ptr_handler_re_en, 
        i_dig_tx_fifo_re_ptr_handler_g_wptr_sync, 
        o_dig_tx_fifo_re_ptr_handler_b_rptr, 
        o_dig_tx_fifo_re_ptr_handler_g_rptr, 
        o_dig_tx_fifo_re_ptr_handler_empty );
  input [2:0] i_dig_tx_fifo_re_ptr_handler_g_wptr_sync;
  output [2:0] o_dig_tx_fifo_re_ptr_handler_b_rptr;
  output [2:0] o_dig_tx_fifo_re_ptr_handler_g_rptr;
  input i_dig_tx_fifo_re_ptr_handler_clk32,
         i_dig_tx_fifo_re_ptr_handler_re_rst_n,
         i_dig_tx_fifo_re_ptr_handler_re_en;
  output o_dig_tx_fifo_re_ptr_handler_empty;
  wire   imediate_empty, n8, n9, n10, n11, n13, n14, n15, n16, n17, n18, n19,
         n20, n21;
  wire   [1:0] b_rptr_next;

  SDFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_0_ ( .D(b_rptr_next[0]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_b_rptr[0]) );
  SDFFASX1_LVT o_dig_tx_fifo_re_ptr_handler_empty_reg ( .D(imediate_empty), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .SETB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_empty), .QN(n8) );
  SDFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_2_ ( .D(n21), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_b_rptr[2]) );
  AND3X1_LVT U10 ( .A1(n9), .A2(n10), .A3(n11), .Y(imediate_empty) );
  SDFFARX1_RVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_1_ ( .D(n13), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[1]) );
  SDFFARX1_RVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_0_ ( .D(n14), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[0]) );
  SDFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_1_ ( .D(b_rptr_next[1]), 
        .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_b_rptr[1]) );
  XOR2X1_RVT U11 ( .A1(n16), .A2(o_dig_tx_fifo_re_ptr_handler_b_rptr[1]), .Y(
        n20) );
  INVX0_HVT U12 ( .A(n16), .Y(n17) );
  XNOR2X1_LVT U13 ( .A1(n20), .A2(n21), .Y(n13) );
  XNOR2X1_LVT U14 ( .A1(n19), .A2(b_rptr_next[1]), .Y(n14) );
  XNOR2X1_LVT U15 ( .A1(n18), .A2(o_dig_tx_fifo_re_ptr_handler_b_rptr[2]), .Y(
        n21) );
  XOR2X1_HVT U16 ( .A1(n15), .A2(o_dig_tx_fifo_re_ptr_handler_b_rptr[0]), .Y(
        n19) );
  XNOR2X1_LVT U17 ( .A1(n21), .A2(i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[2]), 
        .Y(n10) );
  XNOR2X1_LVT U18 ( .A1(n14), .A2(i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[0]), 
        .Y(n9) );
  XNOR2X1_LVT U19 ( .A1(n13), .A2(i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[1]), 
        .Y(n11) );
  NAND2X0_LVT U20 ( .A1(i_dig_tx_fifo_re_ptr_handler_re_en), .A2(n8), .Y(n15)
         );
  INVX1_LVT U21 ( .A(n19), .Y(b_rptr_next[0]) );
  NAND3X0_LVT U22 ( .A1(o_dig_tx_fifo_re_ptr_handler_b_rptr[0]), .A2(n8), .A3(
        i_dig_tx_fifo_re_ptr_handler_re_en), .Y(n16) );
  INVX1_LVT U23 ( .A(n20), .Y(b_rptr_next[1]) );
  NAND2X0_LVT U24 ( .A1(o_dig_tx_fifo_re_ptr_handler_b_rptr[1]), .A2(n17), .Y(
        n18) );
  SDFFARX2_HVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_2_ ( .D(n21), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(
        i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[2]) );
endmodule


module dig_tx_fifo_mem_FIFO_DEPTH3_REGISTER_WIDTH8_PTR_WIDTH2_test_1 ( 
        i_dig_tx_fifo_mem_clk26, i_dig_tx_fifo_mem_wr_en, 
        i_dig_tx_fifo_mem_b_wptr, i_dig_tx_fifo_mem_b_rptr, 
        i_dig_tx_fifo_mem_data_in, i_dig_tx_fifo_mem_full, 
        o_dig_tx_fifo_mem_data_out, test_si, test_so, test_se );
  input [2:0] i_dig_tx_fifo_mem_b_wptr;
  input [2:0] i_dig_tx_fifo_mem_b_rptr;
  input [7:0] i_dig_tx_fifo_mem_data_in;
  output [7:0] o_dig_tx_fifo_mem_data_out;
  input i_dig_tx_fifo_mem_clk26, i_dig_tx_fifo_mem_wr_en,
         i_dig_tx_fifo_mem_full, test_si, test_se;
  output test_so;
  wire   n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, net26240, net26241,
         net26242, net26243, net26244, net26245, net26246, net26247, net26258,
         net26261, net26263, net26264, net26265, net26267, net26268, net39182,
         net39162, net39159, net44146, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n60, n61, n62, n63, n64, n65, n66, n67, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n94, n95;
  wire   [23:0] fifo;

  SDFFX1_LVT fifo_reg_0__7_ ( .D(n59), .SI(n86), .SE(n95), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[23]), .QN(n85) );
  SDFFX1_LVT fifo_reg_0__6_ ( .D(n58), .SI(n87), .SE(n95), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[22]), .QN(n86) );
  SDFFX1_LVT fifo_reg_0__5_ ( .D(n57), .SI(n88), .SE(n95), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[21]), .QN(n87) );
  SDFFX1_LVT fifo_reg_0__4_ ( .D(n56), .SI(n89), .SE(n95), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[20]), .QN(n88) );
  SDFFX1_LVT fifo_reg_0__3_ ( .D(n55), .SI(n90), .SE(n95), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[19]), .QN(n89) );
  SDFFX1_LVT fifo_reg_0__2_ ( .D(n54), .SI(n91), .SE(n95), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[18]), .QN(n90) );
  SDFFX1_LVT fifo_reg_0__1_ ( .D(n53), .SI(n92), .SE(n95), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[17]), .QN(n91) );
  SDFFX1_LVT fifo_reg_0__0_ ( .D(n52), .SI(test_si), .SE(n95), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[16]), .QN(n92) );
  SDFFX1_LVT fifo_reg_1__7_ ( .D(n51), .SI(n78), .SE(n95), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[15]), .QN(n77) );
  SDFFX1_LVT fifo_reg_1__6_ ( .D(n50), .SI(n79), .SE(n95), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[14]), .QN(n78) );
  SDFFX1_LVT fifo_reg_1__5_ ( .D(n49), .SI(n80), .SE(n95), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[13]), .QN(n79) );
  SDFFX1_LVT fifo_reg_1__4_ ( .D(n48), .SI(n81), .SE(n95), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[12]), .QN(n80) );
  SDFFX1_LVT fifo_reg_1__3_ ( .D(n47), .SI(n82), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[11]), .QN(n81) );
  SDFFX1_LVT fifo_reg_1__2_ ( .D(n46), .SI(n83), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[10]), .QN(n82) );
  SDFFX1_LVT fifo_reg_1__1_ ( .D(n45), .SI(n84), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[9]), .QN(n83) );
  SDFFX1_LVT fifo_reg_1__0_ ( .D(n44), .SI(n85), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[8]), .QN(n84) );
  SDFFX1_LVT fifo_reg_2__7_ ( .D(n43), .SI(n70), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[7]), .QN(test_so) );
  SDFFX1_LVT fifo_reg_2__6_ ( .D(n42), .SI(n71), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[6]), .QN(n70) );
  SDFFX1_LVT fifo_reg_2__5_ ( .D(n41), .SI(n72), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[5]), .QN(n71) );
  SDFFX1_LVT fifo_reg_2__4_ ( .D(n40), .SI(n73), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[4]), .QN(n72) );
  SDFFX1_LVT fifo_reg_2__3_ ( .D(n39), .SI(n74), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[3]), .QN(n73) );
  SDFFX1_LVT fifo_reg_2__2_ ( .D(n38), .SI(n75), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[2]), .QN(n74) );
  SDFFX1_LVT fifo_reg_2__1_ ( .D(n37), .SI(n76), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[1]), .QN(n75) );
  SDFFX1_LVT fifo_reg_2__0_ ( .D(n36), .SI(n77), .SE(test_se), .CLK(
        i_dig_tx_fifo_mem_clk26), .Q(fifo[0]), .QN(n76) );
  INVX1_LVT U26 ( .A(i_dig_tx_fifo_mem_full), .Y(n26) );
  INVX1_LVT U27 ( .A(i_dig_tx_fifo_mem_b_wptr[1]), .Y(net44146) );
  INVX0_HVT U28 ( .A(i_dig_tx_fifo_mem_b_wptr[0]), .Y(net39182) );
  INVX1_LVT U29 ( .A(net26242), .Y(net26243) );
  INVX1_LVT U30 ( .A(net26244), .Y(net26245) );
  INVX1_LVT U31 ( .A(net26246), .Y(net26247) );
  NAND3X0_LVT U32 ( .A1(net26240), .A2(fifo[20]), .A3(net26241), .Y(n32) );
  NAND3X0_LVT U33 ( .A1(net26240), .A2(fifo[18]), .A3(net26241), .Y(n28) );
  NAND3X0_LVT U34 ( .A1(net26240), .A2(fifo[19]), .A3(net26241), .Y(n30) );
  INVX2_LVT U35 ( .A(i_dig_tx_fifo_mem_b_rptr[1]), .Y(net26241) );
  NAND3X0_LVT U36 ( .A1(net26240), .A2(fifo[21]), .A3(net26241), .Y(n35) );
  NAND3X0_LVT U37 ( .A1(net26240), .A2(fifo[22]), .A3(net26241), .Y(n62) );
  MUX21X2_LVT U38 ( .A1(fifo[3]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        net26243), .Y(n39) );
  NAND2X0_LVT U39 ( .A1(fifo[3]), .A2(i_dig_tx_fifo_mem_b_rptr[1]), .Y(
        net26258) );
  MUX21X2_LVT U40 ( .A1(fifo[19]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        net26247), .Y(n55) );
  MUX21X2_LVT U41 ( .A1(fifo[11]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        net26245), .Y(n47) );
  OR2X1_LVT U42 ( .A1(net44146), .A2(net39159), .Y(net26242) );
  NAND2X0_LVT U43 ( .A1(net44146), .A2(i_dig_tx_fifo_mem_b_wptr[0]), .Y(
        net39162) );
  OR2X1_LVT U44 ( .A1(net39159), .A2(i_dig_tx_fifo_mem_b_wptr[1]), .Y(net26246) );
  MUX21X2_LVT U45 ( .A1(fifo[2]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        net26243), .Y(n38) );
  NAND2X0_LVT U46 ( .A1(fifo[2]), .A2(i_dig_tx_fifo_mem_b_rptr[1]), .Y(
        net26261) );
  MUX21X2_LVT U47 ( .A1(fifo[18]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        net26247), .Y(n54) );
  MUX21X2_LVT U48 ( .A1(fifo[10]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        net26245), .Y(n46) );
  MUX21X2_LVT U49 ( .A1(fifo[1]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        net26243), .Y(n37) );
  NAND2X0_LVT U50 ( .A1(fifo[1]), .A2(i_dig_tx_fifo_mem_b_rptr[1]), .Y(
        net26264) );
  MUX21X2_LVT U51 ( .A1(fifo[17]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        net26247), .Y(n53) );
  MUX21X2_LVT U52 ( .A1(fifo[9]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        net26245), .Y(n45) );
  MUX21X2_LVT U53 ( .A1(fifo[0]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        net26243), .Y(n36) );
  NAND2X0_LVT U54 ( .A1(fifo[0]), .A2(i_dig_tx_fifo_mem_b_rptr[1]), .Y(
        net26267) );
  MUX21X2_LVT U55 ( .A1(fifo[8]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        net26245), .Y(n44) );
  MUX21X2_LVT U56 ( .A1(fifo[16]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        net26247), .Y(n52) );
  NAND3X0_LVT U57 ( .A1(fifo[17]), .A2(net26241), .A3(net26240), .Y(net26265)
         );
  NAND3X0_LVT U58 ( .A1(fifo[16]), .A2(net26241), .A3(net26240), .Y(net26268)
         );
  OR2X1_LVT U59 ( .A1(n25), .A2(net39162), .Y(net26244) );
  NAND3X0_LVT U60 ( .A1(i_dig_tx_fifo_mem_wr_en), .A2(n26), .A3(net39182), .Y(
        net39159) );
  NAND2X0_LVT U61 ( .A1(i_dig_tx_fifo_mem_wr_en), .A2(n26), .Y(n25) );
  NAND2X0_LVT U62 ( .A1(fifo[9]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(
        net26263) );
  INVX4_LVT U63 ( .A(i_dig_tx_fifo_mem_b_rptr[0]), .Y(net26240) );
  NAND3X0_HVT U64 ( .A1(net26240), .A2(fifo[23]), .A3(net26241), .Y(n65) );
  NAND2X0_HVT U65 ( .A1(fifo[7]), .A2(i_dig_tx_fifo_mem_b_rptr[1]), .Y(n66) );
  NAND2X0_LVT U66 ( .A1(fifo[8]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n27) );
  NAND3X0_LVT U67 ( .A1(n27), .A2(net26267), .A3(net26268), .Y(
        o_dig_tx_fifo_mem_data_out[0]) );
  NAND3X0_LVT U68 ( .A1(net26263), .A2(net26264), .A3(net26265), .Y(
        o_dig_tx_fifo_mem_data_out[1]) );
  NAND2X0_LVT U69 ( .A1(fifo[10]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n29)
         );
  NAND3X0_LVT U70 ( .A1(n29), .A2(net26261), .A3(n28), .Y(
        o_dig_tx_fifo_mem_data_out[2]) );
  NAND2X0_LVT U71 ( .A1(fifo[11]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n31)
         );
  NAND3X0_LVT U72 ( .A1(n31), .A2(net26258), .A3(n30), .Y(
        o_dig_tx_fifo_mem_data_out[3]) );
  AO22X1_LVT U73 ( .A1(fifo[20]), .A2(net26246), .A3(
        i_dig_tx_fifo_mem_data_in[4]), .A4(net26247), .Y(n56) );
  AO22X1_LVT U74 ( .A1(fifo[12]), .A2(net26244), .A3(
        i_dig_tx_fifo_mem_data_in[4]), .A4(net26245), .Y(n48) );
  AO22X1_LVT U75 ( .A1(fifo[4]), .A2(net26242), .A3(
        i_dig_tx_fifo_mem_data_in[4]), .A4(net26243), .Y(n40) );
  NAND2X0_LVT U76 ( .A1(fifo[12]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n34)
         );
  NAND2X0_LVT U77 ( .A1(fifo[4]), .A2(i_dig_tx_fifo_mem_b_rptr[1]), .Y(n33) );
  NAND3X0_LVT U78 ( .A1(n34), .A2(n33), .A3(n32), .Y(
        o_dig_tx_fifo_mem_data_out[4]) );
  AO22X1_LVT U79 ( .A1(fifo[21]), .A2(net26246), .A3(
        i_dig_tx_fifo_mem_data_in[5]), .A4(net26247), .Y(n57) );
  AO22X1_LVT U80 ( .A1(fifo[13]), .A2(net26244), .A3(
        i_dig_tx_fifo_mem_data_in[5]), .A4(net26245), .Y(n49) );
  AO22X1_LVT U81 ( .A1(fifo[5]), .A2(net26242), .A3(
        i_dig_tx_fifo_mem_data_in[5]), .A4(net26243), .Y(n41) );
  NAND2X0_LVT U82 ( .A1(fifo[13]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n61)
         );
  NAND2X0_LVT U83 ( .A1(fifo[5]), .A2(i_dig_tx_fifo_mem_b_rptr[1]), .Y(n60) );
  NAND3X0_LVT U84 ( .A1(n61), .A2(n60), .A3(n35), .Y(
        o_dig_tx_fifo_mem_data_out[5]) );
  AO22X1_LVT U85 ( .A1(fifo[22]), .A2(net26246), .A3(
        i_dig_tx_fifo_mem_data_in[6]), .A4(net26247), .Y(n58) );
  AO22X1_LVT U86 ( .A1(fifo[14]), .A2(net26244), .A3(
        i_dig_tx_fifo_mem_data_in[6]), .A4(net26245), .Y(n50) );
  AO22X1_LVT U87 ( .A1(fifo[6]), .A2(net26242), .A3(
        i_dig_tx_fifo_mem_data_in[6]), .A4(net26243), .Y(n42) );
  NAND2X0_LVT U88 ( .A1(fifo[14]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n64)
         );
  NAND2X0_LVT U89 ( .A1(fifo[6]), .A2(i_dig_tx_fifo_mem_b_rptr[1]), .Y(n63) );
  NAND3X0_LVT U90 ( .A1(n64), .A2(n63), .A3(n62), .Y(
        o_dig_tx_fifo_mem_data_out[6]) );
  AO22X1_LVT U91 ( .A1(fifo[23]), .A2(net26246), .A3(net26247), .A4(
        i_dig_tx_fifo_mem_data_in[7]), .Y(n59) );
  AO22X1_LVT U92 ( .A1(fifo[15]), .A2(net26244), .A3(net26245), .A4(
        i_dig_tx_fifo_mem_data_in[7]), .Y(n51) );
  AO22X1_LVT U93 ( .A1(fifo[7]), .A2(net26242), .A3(
        i_dig_tx_fifo_mem_data_in[7]), .A4(net26243), .Y(n43) );
  NAND2X0_LVT U94 ( .A1(fifo[15]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n67)
         );
  NAND3X0_LVT U95 ( .A1(n67), .A2(n66), .A3(n65), .Y(
        o_dig_tx_fifo_mem_data_out[7]) );
  IBUFFX2_HVT U96 ( .A(test_se), .Y(n94) );
  IBUFFX2_HVT U97 ( .A(n94), .Y(n95) );
endmodule


module dig_tx_asyn_fifo_FIFO_DEPTH3_REGISTER_WIDTH8_test_1 ( 
        i_dig_tx_asyn_fifo_clk26, i_dig_tx_asyn_fifo_clk32, 
        i_dig_tx_asyn_fifo_wr_rst_n, i_dig_tx_asyn_fifo_re_rst_n, 
        i_dig_tx_asyn_fifo_wr_en, i_dig_tx_asyn_fifo_re_en, 
        i_dig_tx_asyn_fifo_data_in, o_dig_tx_asyn_fifo_data_out, 
        o_dig_tx_asyn_fifo_empty, test_si, test_so, test_se );
  input [7:0] i_dig_tx_asyn_fifo_data_in;
  output [7:0] o_dig_tx_asyn_fifo_data_out;
  input i_dig_tx_asyn_fifo_clk26, i_dig_tx_asyn_fifo_clk32,
         i_dig_tx_asyn_fifo_wr_rst_n, i_dig_tx_asyn_fifo_re_rst_n,
         i_dig_tx_asyn_fifo_wr_en, i_dig_tx_asyn_fifo_re_en, test_si, test_se;
  output o_dig_tx_asyn_fifo_empty, test_so;
  wire   asyn_fifo_full;
  wire   [2:0] g_wptr;
  wire   [2:0] g_wptr_sync;
  wire   [2:0] g_rptr;
  wire   [2:0] g_rptr_sync;
  wire   [2:0] b_wptr;
  wire   [2:0] b_rptr;

  dig_tx_fifo_synchronizer_PTR_WIDTH2_0 sync_wptr ( 
        .i_dig_tx_fifo_synchronizer_clk(i_dig_tx_asyn_fifo_clk32), 
        .i_dig_tx_fifo_synchronizer_rst_n(i_dig_tx_asyn_fifo_re_rst_n), 
        .i_dig_tx_fifo_synchronizer_d_in(g_wptr), 
        .o_dig_tx_fifo_synchronizer_d_out(g_wptr_sync) );
  dig_tx_fifo_synchronizer_PTR_WIDTH2_1 sync_rptr ( 
        .i_dig_tx_fifo_synchronizer_clk(i_dig_tx_asyn_fifo_clk26), 
        .i_dig_tx_fifo_synchronizer_rst_n(i_dig_tx_asyn_fifo_wr_rst_n), 
        .i_dig_tx_fifo_synchronizer_d_in(g_rptr), 
        .o_dig_tx_fifo_synchronizer_d_out(g_rptr_sync) );
  dig_tx_fifo_wr_ptr_handler_PTR_WIDTH2 wptr_h ( 
        .i_dig_tx_fifo_wr_ptr_handler_clk26(i_dig_tx_asyn_fifo_clk26), 
        .i_dig_tx_fifo_wr_ptr_handler_wr_rst_n(i_dig_tx_asyn_fifo_wr_rst_n), 
        .i_dig_tx_fifo_wr_ptr_handler_wr_en(i_dig_tx_asyn_fifo_wr_en), 
        .i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync(g_rptr_sync), 
        .o_dig_tx_fifo_wr_ptr_handler_b_wptr(b_wptr), 
        .o_dig_tx_fifo_wr_ptr_handler_g_wptr(g_wptr), 
        .o_dig_tx_fifo_wr_ptr_handler_full(asyn_fifo_full) );
  dig_tx_fifo_re_ptr_handler_PTR_WIDTH2 rptr_h ( 
        .i_dig_tx_fifo_re_ptr_handler_clk32(i_dig_tx_asyn_fifo_clk32), 
        .i_dig_tx_fifo_re_ptr_handler_re_rst_n(i_dig_tx_asyn_fifo_re_rst_n), 
        .i_dig_tx_fifo_re_ptr_handler_re_en(i_dig_tx_asyn_fifo_re_en), 
        .i_dig_tx_fifo_re_ptr_handler_g_wptr_sync(g_wptr_sync), 
        .o_dig_tx_fifo_re_ptr_handler_b_rptr(b_rptr), 
        .o_dig_tx_fifo_re_ptr_handler_g_rptr(g_rptr), 
        .o_dig_tx_fifo_re_ptr_handler_empty(o_dig_tx_asyn_fifo_empty) );
  dig_tx_fifo_mem_FIFO_DEPTH3_REGISTER_WIDTH8_PTR_WIDTH2_test_1 fifom ( 
        .i_dig_tx_fifo_mem_clk26(i_dig_tx_asyn_fifo_clk26), 
        .i_dig_tx_fifo_mem_wr_en(i_dig_tx_asyn_fifo_wr_en), 
        .i_dig_tx_fifo_mem_b_wptr(b_wptr), .i_dig_tx_fifo_mem_b_rptr(b_rptr), 
        .i_dig_tx_fifo_mem_data_in(i_dig_tx_asyn_fifo_data_in), 
        .i_dig_tx_fifo_mem_full(asyn_fifo_full), .o_dig_tx_fifo_mem_data_out(
        o_dig_tx_asyn_fifo_data_out), .test_si(test_si), .test_so(test_so), 
        .test_se(test_se) );
endmodule


module dig_tx_reg_file_REGISTER_DEPTH5_REGISTER_WIDTH8_PAYLOAD_WIDTH32 ( 
        i_dig_tx_reg_file_clk, i_dig_tx_reg_file_rst_n, 
        i_dig_tx_reg_file_data_in, i_dig_tx_reg_file_addr_in, 
        i_dig_tx_reg_file_spi_re_en, i_dig_tx_reg_file_data_in_en, 
        i_dig_tx_reg_file_tx_busy, i_dig_tx_reg_file_tx_done, 
        o_dig_tx_reg_file_valid_en, o_dig_tx_reg_file_data_out, 
        o_dig_tx_reg_file_tx_start, o_dig_tx_reg_file_tx_mode, 
        o_dig_tx_reg_file_power_domain, o_dig_tx_reg_file_data_slave_out, 
        o_dig_tx_reg_file_sys_tx_done );
  input [7:0] i_dig_tx_reg_file_data_in;
  input [2:0] i_dig_tx_reg_file_addr_in;
  output [31:0] o_dig_tx_reg_file_data_out;
  output [7:0] o_dig_tx_reg_file_data_slave_out;
  input i_dig_tx_reg_file_clk, i_dig_tx_reg_file_rst_n,
         i_dig_tx_reg_file_spi_re_en, i_dig_tx_reg_file_data_in_en,
         i_dig_tx_reg_file_tx_busy, i_dig_tx_reg_file_tx_done;
  output o_dig_tx_reg_file_valid_en, o_dig_tx_reg_file_tx_start,
         o_dig_tx_reg_file_tx_mode, o_dig_tx_reg_file_power_domain,
         o_dig_tx_reg_file_sys_tx_done;
  wire   reg_file_0__8_, reg_file_1__8_, reg_file_1__7_, reg_file_1__6_,
         reg_file_1__5_, reg_file_1__4_, reg_file_1__3_, reg_file_1__2_,
         reg_file_1__1_, reg_file_1__0_, reg_file_2__8_, reg_file_2__7_,
         reg_file_2__6_, reg_file_2__5_, reg_file_2__4_, reg_file_2__3_,
         reg_file_2__2_, reg_file_2__1_, reg_file_2__0_, reg_file_3__8_,
         reg_file_3__7_, reg_file_3__6_, reg_file_3__5_, reg_file_3__4_,
         reg_file_3__3_, reg_file_3__2_, reg_file_3__1_, reg_file_3__0_,
         reg_file_4__8_, reg_file_4__7_, reg_file_4__6_, reg_file_4__5_,
         reg_file_4__4_, reg_file_4__3_, reg_file_4__2_, reg_file_4__1_,
         reg_file_4__0_, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, net26161,
         net26162, net26163, net26174, net26176, net26177, net26179, net26200,
         net26208, net26219, net26222, net26640, net26634, net26719, net27838,
         net27839, net27864, net28085, net28173, net28174, net28177, net30650,
         net30658, net30657, net30653, net27880, net27867, net26228, net26165,
         net41284, net47425, net47424, net26217, net26216, net26215, net26214,
         net26212, net26211, net26210, net26209, net26204, net26203, net26202,
         net26201, net41279, net26229, net26226, net26196, net26195, net26194,
         net26193, net26192, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114;

  SDFFARX1_LVT reg_file_reg_0__8_ ( .D(n162), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(i_dig_tx_reg_file_rst_n), .Q(
        reg_file_0__8_), .QN(n80) );
  SDFFARX1_LVT reg_file_reg_0__3_ ( .D(n163), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(i_dig_tx_reg_file_rst_n), .Q(net41279)
         );
  SDFFARX1_LVT reg_file_reg_0__2_ ( .D(n164), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n94), .Q(o_dig_tx_reg_file_power_domain)
         );
  SDFFARX1_LVT reg_file_reg_0__1_ ( .D(n165), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n94), .Q(o_dig_tx_reg_file_tx_mode) );
  SDFFARX1_LVT reg_file_reg_0__0_ ( .D(n166), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n94), .Q(o_dig_tx_reg_file_tx_start) );
  SDFFARX1_LVT reg_file_reg_1__8_ ( .D(n167), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n94), .Q(reg_file_1__8_), .QN(n82) );
  SDFFARX1_LVT reg_file_reg_1__7_ ( .D(n168), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n94), .Q(reg_file_1__7_) );
  SDFFARX1_LVT reg_file_reg_1__6_ ( .D(n169), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n94), .Q(reg_file_1__6_) );
  SDFFARX1_LVT reg_file_reg_1__5_ ( .D(n170), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n94), .Q(reg_file_1__5_) );
  SDFFARX1_LVT reg_file_reg_1__4_ ( .D(n171), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n94), .Q(reg_file_1__4_) );
  SDFFARX1_LVT reg_file_reg_1__3_ ( .D(n172), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n94), .Q(reg_file_1__3_) );
  SDFFARX1_LVT reg_file_reg_1__2_ ( .D(n173), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n94), .Q(reg_file_1__2_) );
  SDFFARX1_LVT reg_file_reg_1__1_ ( .D(n174), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n94), .Q(reg_file_1__1_) );
  SDFFARX1_LVT reg_file_reg_1__0_ ( .D(n175), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n94), .Q(reg_file_1__0_) );
  SDFFARX1_LVT reg_file_reg_2__8_ ( .D(n176), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n93), .Q(reg_file_2__8_), .QN(n85) );
  SDFFARX1_LVT reg_file_reg_2__7_ ( .D(n177), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n93), .Q(reg_file_2__7_) );
  SDFFARX1_LVT reg_file_reg_2__6_ ( .D(n178), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n93), .Q(reg_file_2__6_) );
  SDFFARX1_LVT reg_file_reg_2__5_ ( .D(n179), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n93), .Q(reg_file_2__5_) );
  SDFFARX1_LVT reg_file_reg_2__4_ ( .D(n180), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n93), .Q(reg_file_2__4_) );
  SDFFARX1_LVT reg_file_reg_2__3_ ( .D(n181), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n93), .Q(reg_file_2__3_) );
  SDFFARX1_LVT reg_file_reg_2__2_ ( .D(n182), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n93), .Q(reg_file_2__2_) );
  SDFFARX1_LVT reg_file_reg_2__1_ ( .D(n183), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n93), .Q(reg_file_2__1_) );
  SDFFARX1_LVT reg_file_reg_2__0_ ( .D(n184), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n93), .Q(reg_file_2__0_) );
  SDFFARX1_LVT reg_file_reg_3__8_ ( .D(n185), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n93), .Q(reg_file_3__8_), .QN(n87) );
  SDFFARX1_LVT reg_file_reg_3__7_ ( .D(n186), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n93), .Q(reg_file_3__7_) );
  SDFFARX1_LVT reg_file_reg_3__6_ ( .D(n187), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n93), .Q(reg_file_3__6_) );
  SDFFARX1_LVT reg_file_reg_3__5_ ( .D(n188), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n92), .Q(reg_file_3__5_) );
  SDFFARX1_LVT reg_file_reg_3__4_ ( .D(n189), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n92), .Q(reg_file_3__4_) );
  SDFFARX1_LVT reg_file_reg_3__3_ ( .D(n190), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n92), .Q(reg_file_3__3_) );
  SDFFARX1_LVT reg_file_reg_3__2_ ( .D(n191), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n92), .Q(reg_file_3__2_) );
  SDFFARX1_LVT reg_file_reg_3__1_ ( .D(n192), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n92), .Q(reg_file_3__1_) );
  SDFFARX1_LVT reg_file_reg_3__0_ ( .D(n193), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n92), .Q(reg_file_3__0_) );
  SDFFARX1_LVT reg_file_reg_4__8_ ( .D(n195), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n92), .Q(reg_file_4__8_), .QN(n86) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_1_ ( .D(n138), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n92), .Q(
        o_dig_tx_reg_file_data_out[1]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_2_ ( .D(n139), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n92), .Q(
        o_dig_tx_reg_file_data_out[2]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_3_ ( .D(n140), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n92), .Q(
        o_dig_tx_reg_file_data_out[3]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_4_ ( .D(n141), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n92), .Q(
        o_dig_tx_reg_file_data_out[4]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_5_ ( .D(n142), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n92), .Q(
        o_dig_tx_reg_file_data_out[5]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_6_ ( .D(n143), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n91), .Q(
        o_dig_tx_reg_file_data_out[6]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_7_ ( .D(n144), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n91), .Q(
        o_dig_tx_reg_file_data_out[7]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_8_ ( .D(n145), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n91), .Q(
        o_dig_tx_reg_file_data_out[8]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_9_ ( .D(n146), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n91), .Q(
        o_dig_tx_reg_file_data_out[9]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_10_ ( .D(n147), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n91), .Q(
        o_dig_tx_reg_file_data_out[10]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_11_ ( .D(n148), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n91), .Q(
        o_dig_tx_reg_file_data_out[11]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_12_ ( .D(n149), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n91), .Q(
        o_dig_tx_reg_file_data_out[12]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_13_ ( .D(n150), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n91), .Q(
        o_dig_tx_reg_file_data_out[13]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_14_ ( .D(n151), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n91), .Q(
        o_dig_tx_reg_file_data_out[14]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_15_ ( .D(n152), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n91), .Q(
        o_dig_tx_reg_file_data_out[15]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_16_ ( .D(n153), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n91), .Q(
        o_dig_tx_reg_file_data_out[16]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_17_ ( .D(n154), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n91), .Q(
        o_dig_tx_reg_file_data_out[17]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_18_ ( .D(n155), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n90), .Q(
        o_dig_tx_reg_file_data_out[18]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_19_ ( .D(n156), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n90), .Q(
        o_dig_tx_reg_file_data_out[19]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_20_ ( .D(n157), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n90), .Q(
        o_dig_tx_reg_file_data_out[20]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_21_ ( .D(n158), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n90), .Q(
        o_dig_tx_reg_file_data_out[21]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_22_ ( .D(n159), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n90), .Q(
        o_dig_tx_reg_file_data_out[22]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_23_ ( .D(n160), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n90), .Q(
        o_dig_tx_reg_file_data_out[23]) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_0_ ( .D(n161), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n90), .Q(
        o_dig_tx_reg_file_data_out[0]) );
  SDFFARX1_LVT o_dig_tx_reg_file_sys_tx_done_reg ( .D(n194), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n90), .Q(
        o_dig_tx_reg_file_sys_tx_done) );
  SDFFARX1_LVT reg_file_reg_4__7_ ( .D(n137), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n90), .Q(reg_file_4__7_) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_31_ ( .D(n136), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n90), .Q(
        o_dig_tx_reg_file_data_out[31]) );
  SDFFARX1_LVT reg_file_reg_4__6_ ( .D(n135), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n90), .Q(reg_file_4__6_) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_30_ ( .D(n134), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n90), .Q(
        o_dig_tx_reg_file_data_out[30]) );
  SDFFARX1_LVT reg_file_reg_4__5_ ( .D(n133), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n89), .Q(reg_file_4__5_) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_29_ ( .D(n132), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n89), .Q(
        o_dig_tx_reg_file_data_out[29]) );
  SDFFARX1_LVT reg_file_reg_4__4_ ( .D(n131), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n89), .Q(reg_file_4__4_) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_28_ ( .D(n130), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n89), .Q(
        o_dig_tx_reg_file_data_out[28]) );
  SDFFARX1_LVT reg_file_reg_4__3_ ( .D(n129), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n89), .Q(reg_file_4__3_) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_27_ ( .D(n128), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n89), .Q(
        o_dig_tx_reg_file_data_out[27]) );
  SDFFARX1_LVT reg_file_reg_4__2_ ( .D(n127), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n89), .Q(reg_file_4__2_) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_26_ ( .D(n126), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n89), .Q(
        o_dig_tx_reg_file_data_out[26]) );
  SDFFARX1_LVT reg_file_reg_4__1_ ( .D(n125), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n89), .Q(reg_file_4__1_) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_25_ ( .D(n124), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n89), .Q(
        o_dig_tx_reg_file_data_out[25]) );
  SDFFARX1_LVT reg_file_reg_4__0_ ( .D(n123), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n89), .Q(reg_file_4__0_) );
  SDFFARX1_LVT o_dig_tx_reg_file_data_out_reg_24_ ( .D(n122), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_reg_file_clk), .RSTB(n89), .Q(
        o_dig_tx_reg_file_data_out[24]) );
  MUX21X2_LVT U76 ( .A1(o_dig_tx_reg_file_data_out[1]), .A2(reg_file_1__1_), 
        .S0(net26634), .Y(n138) );
  MUX21X2_LVT U77 ( .A1(o_dig_tx_reg_file_data_out[2]), .A2(reg_file_1__2_), 
        .S0(net26634), .Y(n139) );
  MUX21X2_LVT U78 ( .A1(o_dig_tx_reg_file_data_out[3]), .A2(reg_file_1__3_), 
        .S0(net26634), .Y(n140) );
  MUX21X2_LVT U79 ( .A1(o_dig_tx_reg_file_data_out[4]), .A2(reg_file_1__4_), 
        .S0(net26634), .Y(n141) );
  MUX21X2_LVT U81 ( .A1(o_dig_tx_reg_file_data_out[5]), .A2(reg_file_1__5_), 
        .S0(net26634), .Y(n142) );
  MUX21X2_LVT U82 ( .A1(o_dig_tx_reg_file_data_out[6]), .A2(reg_file_1__6_), 
        .S0(net26634), .Y(n143) );
  MUX21X2_LVT U83 ( .A1(o_dig_tx_reg_file_data_out[7]), .A2(reg_file_1__7_), 
        .S0(net26634), .Y(n144) );
  MUX21X2_LVT U84 ( .A1(o_dig_tx_reg_file_data_out[8]), .A2(reg_file_2__0_), 
        .S0(net26634), .Y(n145) );
  MUX21X2_LVT U85 ( .A1(o_dig_tx_reg_file_data_out[9]), .A2(reg_file_2__1_), 
        .S0(net26634), .Y(n146) );
  MUX21X2_LVT U86 ( .A1(o_dig_tx_reg_file_data_out[10]), .A2(reg_file_2__2_), 
        .S0(net26634), .Y(n147) );
  MUX21X2_LVT U87 ( .A1(o_dig_tx_reg_file_data_out[11]), .A2(reg_file_2__3_), 
        .S0(net26634), .Y(n148) );
  MUX21X2_LVT U88 ( .A1(o_dig_tx_reg_file_data_out[12]), .A2(reg_file_2__4_), 
        .S0(net26634), .Y(n149) );
  MUX21X2_LVT U89 ( .A1(o_dig_tx_reg_file_data_out[13]), .A2(reg_file_2__5_), 
        .S0(net26634), .Y(n150) );
  MUX21X2_LVT U90 ( .A1(o_dig_tx_reg_file_data_out[14]), .A2(reg_file_2__6_), 
        .S0(net26634), .Y(n151) );
  MUX21X2_LVT U91 ( .A1(o_dig_tx_reg_file_data_out[15]), .A2(reg_file_2__7_), 
        .S0(net26634), .Y(n152) );
  MUX21X2_LVT U92 ( .A1(o_dig_tx_reg_file_data_out[16]), .A2(reg_file_3__0_), 
        .S0(net26634), .Y(n153) );
  MUX21X2_LVT U93 ( .A1(o_dig_tx_reg_file_data_out[17]), .A2(reg_file_3__1_), 
        .S0(net26634), .Y(n154) );
  MUX21X2_LVT U94 ( .A1(o_dig_tx_reg_file_data_out[18]), .A2(reg_file_3__2_), 
        .S0(net26634), .Y(n155) );
  MUX21X2_LVT U95 ( .A1(o_dig_tx_reg_file_data_out[19]), .A2(reg_file_3__3_), 
        .S0(net26634), .Y(n156) );
  MUX21X2_LVT U96 ( .A1(o_dig_tx_reg_file_data_out[20]), .A2(reg_file_3__4_), 
        .S0(net26634), .Y(n157) );
  MUX21X2_LVT U97 ( .A1(o_dig_tx_reg_file_data_out[21]), .A2(reg_file_3__5_), 
        .S0(net26634), .Y(n158) );
  MUX21X2_LVT U98 ( .A1(o_dig_tx_reg_file_data_out[22]), .A2(reg_file_3__6_), 
        .S0(net26634), .Y(n159) );
  MUX21X2_LVT U99 ( .A1(o_dig_tx_reg_file_data_out[23]), .A2(reg_file_3__7_), 
        .S0(net26634), .Y(n160) );
  MUX21X2_LVT U100 ( .A1(o_dig_tx_reg_file_data_out[0]), .A2(reg_file_1__0_), 
        .S0(net26634), .Y(n161) );
  MUX21X2_LVT U101 ( .A1(o_dig_tx_reg_file_data_out[31]), .A2(reg_file_4__7_), 
        .S0(net26634), .Y(n136) );
  MUX21X2_LVT U102 ( .A1(o_dig_tx_reg_file_data_out[30]), .A2(reg_file_4__6_), 
        .S0(net26634), .Y(n134) );
  MUX21X2_LVT U103 ( .A1(o_dig_tx_reg_file_data_out[29]), .A2(reg_file_4__5_), 
        .S0(net26634), .Y(n132) );
  MUX21X2_LVT U104 ( .A1(o_dig_tx_reg_file_data_out[28]), .A2(reg_file_4__4_), 
        .S0(net26634), .Y(n130) );
  MUX21X2_LVT U105 ( .A1(o_dig_tx_reg_file_data_out[27]), .A2(reg_file_4__3_), 
        .S0(net26634), .Y(n128) );
  MUX21X2_LVT U106 ( .A1(o_dig_tx_reg_file_data_out[26]), .A2(reg_file_4__2_), 
        .S0(net26634), .Y(n126) );
  MUX21X2_LVT U107 ( .A1(o_dig_tx_reg_file_data_out[25]), .A2(reg_file_4__1_), 
        .S0(net26634), .Y(n124) );
  MUX21X2_LVT U108 ( .A1(o_dig_tx_reg_file_data_out[24]), .A2(reg_file_4__0_), 
        .S0(net26634), .Y(n122) );
  AND2X1_LVT U109 ( .A1(net27838), .A2(net27867), .Y(n75) );
  NAND2X0_LVT U110 ( .A1(reg_file_3__4_), .A2(net30650), .Y(n98) );
  NAND2X0_LVT U111 ( .A1(reg_file_3__7_), .A2(net30650), .Y(n110) );
  AO21X1_LVT U113 ( .A1(reg_file_0__8_), .A2(net26162), .A3(net26208), .Y(n162) );
  AND3X1_LVT U114 ( .A1(i_dig_tx_reg_file_data_in_en), .A2(net26162), .A3(
        net26165), .Y(net27880) );
  NAND2X0_HVT U116 ( .A1(reg_file_4__2_), .A2(i_dig_tx_reg_file_addr_in[2]), 
        .Y(net26204) );
  NAND2X0_HVT U117 ( .A1(reg_file_4__3_), .A2(i_dig_tx_reg_file_addr_in[2]), 
        .Y(net26196) );
  INVX2_LVT U118 ( .A(i_dig_tx_reg_file_addr_in[2]), .Y(net47424) );
  INVX4_LVT U119 ( .A(net26177), .Y(net26176) );
  INVX16_LVT U120 ( .A(net26640), .Y(net26634) );
  INVX4_LVT U121 ( .A(net26161), .Y(net26640) );
  AO21X1_LVT U122 ( .A1(reg_file_4__8_), .A2(net26162), .A3(net28173), .Y(n195) );
  AO21X1_LVT U123 ( .A1(reg_file_3__8_), .A2(net26162), .A3(net28085), .Y(n185) );
  NAND2X0_RVT U124 ( .A1(reg_file_4__7_), .A2(net47425), .Y(n111) );
  INVX1_LVT U125 ( .A(i_dig_tx_reg_file_addr_in[0]), .Y(net26226) );
  INVX0_LVT U126 ( .A(i_dig_tx_reg_file_addr_in[1]), .Y(net26229) );
  AO21X1_LVT U127 ( .A1(net41279), .A2(net26192), .A3(net26193), .Y(
        o_dig_tx_reg_file_data_slave_out[3]) );
  NAND4X0_LVT U128 ( .A1(net26194), .A2(net26195), .A3(n76), .A4(net26196), 
        .Y(net26193) );
  NAND2X0_LVT U129 ( .A1(reg_file_3__3_), .A2(net30650), .Y(n76) );
  NAND2X0_LVT U130 ( .A1(reg_file_2__3_), .A2(net27839), .Y(net26195) );
  NAND2X0_LVT U131 ( .A1(reg_file_1__3_), .A2(net27838), .Y(net26194) );
  INVX2_LVT U132 ( .A(net26219), .Y(net26192) );
  AO21X1_LVT U133 ( .A1(o_dig_tx_reg_file_tx_start), .A2(net26192), .A3(
        net26214), .Y(o_dig_tx_reg_file_data_slave_out[0]) );
  AO21X1_LVT U134 ( .A1(o_dig_tx_reg_file_tx_mode), .A2(net26192), .A3(
        net26209), .Y(o_dig_tx_reg_file_data_slave_out[1]) );
  AO21X1_LVT U135 ( .A1(o_dig_tx_reg_file_power_domain), .A2(net26192), .A3(
        net26201), .Y(o_dig_tx_reg_file_data_slave_out[2]) );
  NAND2X0_LVT U136 ( .A1(net26200), .A2(net41279), .Y(net41284) );
  MUX21X1_LVT U137 ( .A1(reg_file_3__3_), .A2(i_dig_tx_reg_file_data_in[3]), 
        .S0(net28085), .Y(n190) );
  AND2X1_LVT U138 ( .A1(i_dig_tx_reg_file_addr_in[0]), .A2(
        i_dig_tx_reg_file_addr_in[1]), .Y(net30650) );
  AO22X1_LVT U139 ( .A1(i_dig_tx_reg_file_data_in[3]), .A2(net28174), .A3(
        reg_file_4__3_), .A4(net26174), .Y(n129) );
  AO22X1_LVT U140 ( .A1(net26176), .A2(i_dig_tx_reg_file_data_in[3]), .A3(
        net26177), .A4(reg_file_2__3_), .Y(n181) );
  AND2X1_LVT U141 ( .A1(net26226), .A2(i_dig_tx_reg_file_addr_in[1]), .Y(
        net27839) );
  AND3X2_LVT U142 ( .A1(net26228), .A2(net26229), .A3(net26226), .Y(net27864)
         );
  AND3X1_LVT U143 ( .A1(net26226), .A2(net47424), .A3(net26229), .Y(net30653)
         );
  NAND3X2_LVT U144 ( .A1(net26226), .A2(net47424), .A3(net26229), .Y(net26219)
         );
  AO22X1_LVT U145 ( .A1(i_dig_tx_reg_file_data_in[3]), .A2(n75), .A3(net26179), 
        .A4(reg_file_1__3_), .Y(n172) );
  AND2X1_LVT U146 ( .A1(net26229), .A2(i_dig_tx_reg_file_addr_in[0]), .Y(
        net27838) );
  AND2X1_LVT U147 ( .A1(net26228), .A2(net47424), .Y(net28177) );
  NAND4X0_LVT U148 ( .A1(net26202), .A2(net26203), .A3(net26204), .A4(n77), 
        .Y(net26201) );
  NAND2X0_LVT U149 ( .A1(reg_file_3__2_), .A2(net30650), .Y(n77) );
  NAND2X0_LVT U150 ( .A1(reg_file_2__2_), .A2(net27839), .Y(net26203) );
  NAND2X0_LVT U151 ( .A1(reg_file_1__2_), .A2(net27838), .Y(net26202) );
  MUX21X1_LVT U152 ( .A1(o_dig_tx_reg_file_power_domain), .A2(
        i_dig_tx_reg_file_data_in[2]), .S0(net26208), .Y(n164) );
  MUX21X1_LVT U153 ( .A1(reg_file_3__2_), .A2(i_dig_tx_reg_file_data_in[2]), 
        .S0(net28085), .Y(n191) );
  MUX21X2_LVT U154 ( .A1(reg_file_4__2_), .A2(i_dig_tx_reg_file_data_in[2]), 
        .S0(net28174), .Y(n127) );
  AO22X1_LVT U155 ( .A1(i_dig_tx_reg_file_data_in[2]), .A2(net26176), .A3(
        net26177), .A4(reg_file_2__2_), .Y(n182) );
  AO22X1_LVT U156 ( .A1(i_dig_tx_reg_file_data_in[2]), .A2(n75), .A3(net26179), 
        .A4(reg_file_1__2_), .Y(n173) );
  AND2X1_LVT U157 ( .A1(net26228), .A2(net47424), .Y(net27867) );
  NAND4X0_LVT U158 ( .A1(net26210), .A2(net26211), .A3(n78), .A4(net26212), 
        .Y(net26209) );
  NAND2X0_LVT U159 ( .A1(reg_file_3__1_), .A2(net30650), .Y(n78) );
  NAND2X0_LVT U160 ( .A1(reg_file_2__1_), .A2(net27839), .Y(net26211) );
  NAND2X0_LVT U161 ( .A1(reg_file_1__1_), .A2(net27838), .Y(net26210) );
  MUX21X1_LVT U162 ( .A1(o_dig_tx_reg_file_tx_mode), .A2(
        i_dig_tx_reg_file_data_in[1]), .S0(net26208), .Y(n165) );
  MUX21X1_LVT U163 ( .A1(reg_file_3__1_), .A2(i_dig_tx_reg_file_data_in[1]), 
        .S0(net28085), .Y(n192) );
  MUX21X2_LVT U164 ( .A1(reg_file_4__1_), .A2(i_dig_tx_reg_file_data_in[1]), 
        .S0(net26719), .Y(n125) );
  AO22X1_LVT U165 ( .A1(i_dig_tx_reg_file_data_in[1]), .A2(net26176), .A3(
        net26177), .A4(reg_file_2__1_), .Y(n183) );
  AO22X1_LVT U166 ( .A1(i_dig_tx_reg_file_data_in[1]), .A2(n75), .A3(net26179), 
        .A4(reg_file_1__1_), .Y(n174) );
  NAND4X0_LVT U167 ( .A1(net26215), .A2(net26216), .A3(net26217), .A4(n79), 
        .Y(net26214) );
  NAND2X0_LVT U168 ( .A1(reg_file_3__0_), .A2(net30650), .Y(n79) );
  NAND2X0_HVT U169 ( .A1(reg_file_4__0_), .A2(i_dig_tx_reg_file_addr_in[2]), 
        .Y(net26217) );
  NAND2X0_LVT U170 ( .A1(reg_file_2__0_), .A2(net27839), .Y(net26216) );
  NAND2X0_LVT U171 ( .A1(reg_file_1__0_), .A2(net27838), .Y(net26215) );
  MUX21X1_LVT U172 ( .A1(o_dig_tx_reg_file_tx_start), .A2(
        i_dig_tx_reg_file_data_in[0]), .S0(net26208), .Y(n166) );
  MUX21X1_LVT U173 ( .A1(reg_file_3__0_), .A2(i_dig_tx_reg_file_data_in[0]), 
        .S0(net28085), .Y(n193) );
  MUX21X2_LVT U174 ( .A1(reg_file_4__0_), .A2(i_dig_tx_reg_file_data_in[0]), 
        .S0(net28173), .Y(n123) );
  MUX21X1_LVT U175 ( .A1(i_dig_tx_reg_file_data_in[0]), .A2(reg_file_2__0_), 
        .S0(net26177), .Y(n184) );
  NAND2X0_HVT U176 ( .A1(reg_file_3__5_), .A2(net30650), .Y(n102) );
  NAND2X0_HVT U177 ( .A1(reg_file_3__6_), .A2(net30650), .Y(n106) );
  INVX1_LVT U178 ( .A(i_dig_tx_reg_file_tx_busy), .Y(net26165) );
  INVX2_LVT U179 ( .A(net47424), .Y(net47425) );
  NAND2X0_LVT U180 ( .A1(net41284), .A2(net26162), .Y(n163) );
  INVX2_LVT U181 ( .A(i_dig_tx_reg_file_tx_done), .Y(net26162) );
  INVX1_LVT U182 ( .A(i_dig_tx_reg_file_data_in_en), .Y(net30657) );
  AND2X4_LVT U183 ( .A1(net28177), .A2(net30650), .Y(net28085) );
  AND2X1_LVT U184 ( .A1(net27880), .A2(i_dig_tx_reg_file_spi_re_en), .Y(
        net26228) );
  NAND2X0_LVT U185 ( .A1(net30653), .A2(net26228), .Y(net26200) );
  NAND4X1_RVT U186 ( .A1(i_dig_tx_reg_file_spi_re_en), .A2(net30658), .A3(
        net26162), .A4(net26165), .Y(net26222) );
  NAND3X0_LVT U187 ( .A1(i_dig_tx_reg_file_spi_re_en), .A2(net30658), .A3(
        net26165), .Y(net26163) );
  INVX1_LVT U188 ( .A(net30657), .Y(net30658) );
  NAND2X0_HVT U189 ( .A1(reg_file_4__6_), .A2(net47425), .Y(n107) );
  NAND2X0_HVT U190 ( .A1(reg_file_4__5_), .A2(net47425), .Y(n103) );
  NAND2X0_HVT U191 ( .A1(reg_file_4__4_), .A2(net47425), .Y(n99) );
  NAND2X0_LVT U192 ( .A1(net27864), .A2(net26219), .Y(net26174) );
  INVX2_LVT U193 ( .A(net26200), .Y(net26208) );
  INVX1_LVT U194 ( .A(n80), .Y(n81) );
  AND2X1_LVT U195 ( .A1(net27864), .A2(net26219), .Y(net28174) );
  AND2X1_LVT U196 ( .A1(net27864), .A2(net26219), .Y(net28173) );
  INVX1_LVT U197 ( .A(n82), .Y(n83) );
  NOR3X0_LVT U198 ( .A1(n85), .A2(n86), .A3(n87), .Y(n84) );
  NAND2X4_LVT U199 ( .A1(net27838), .A2(net27867), .Y(net26179) );
  NAND2X4_LVT U200 ( .A1(net28177), .A2(net27839), .Y(net26177) );
  AO22X1_LVT U201 ( .A1(i_dig_tx_reg_file_data_in[4]), .A2(net26719), .A3(
        reg_file_4__4_), .A4(net26174), .Y(n131) );
  AO22X1_LVT U202 ( .A1(i_dig_tx_reg_file_data_in[5]), .A2(net28173), .A3(
        reg_file_4__5_), .A4(net26174), .Y(n133) );
  AO22X1_LVT U203 ( .A1(i_dig_tx_reg_file_data_in[6]), .A2(net28174), .A3(
        reg_file_4__6_), .A4(net26174), .Y(n135) );
  AO22X1_LVT U204 ( .A1(i_dig_tx_reg_file_data_in[7]), .A2(net26719), .A3(
        reg_file_4__7_), .A4(net26174), .Y(n137) );
  INVX2_LVT U205 ( .A(n95), .Y(n89) );
  INVX2_LVT U206 ( .A(n95), .Y(n90) );
  INVX2_LVT U207 ( .A(n95), .Y(n91) );
  INVX2_LVT U208 ( .A(n95), .Y(n92) );
  INVX2_LVT U209 ( .A(n95), .Y(n93) );
  INVX2_LVT U210 ( .A(n95), .Y(n94) );
  INVX1_LVT U211 ( .A(i_dig_tx_reg_file_rst_n), .Y(n95) );
  AND2X1_LVT U212 ( .A1(n81), .A2(n83), .Y(n88) );
  NAND2X0_HVT U213 ( .A1(n88), .A2(n84), .Y(n96) );
  AND2X1_LVT U214 ( .A1(net27864), .A2(net26219), .Y(net26719) );
  AO21X1_LVT U215 ( .A1(reg_file_2__8_), .A2(net26162), .A3(net26176), .Y(n176) );
  AO21X1_LVT U216 ( .A1(reg_file_1__8_), .A2(net26162), .A3(n75), .Y(n167) );
  INVX1_LVT U217 ( .A(n96), .Y(n114) );
  NAND3X0_LVT U218 ( .A1(o_dig_tx_reg_file_sys_tx_done), .A2(n114), .A3(
        net26222), .Y(n97) );
  NAND2X0_LVT U219 ( .A1(net26162), .A2(n97), .Y(n194) );
  AO22X1_LVT U220 ( .A1(i_dig_tx_reg_file_data_in[4]), .A2(n75), .A3(net26179), 
        .A4(reg_file_1__4_), .Y(n171) );
  AO22X1_LVT U221 ( .A1(net26176), .A2(i_dig_tx_reg_file_data_in[4]), .A3(
        net26177), .A4(reg_file_2__4_), .Y(n180) );
  MUX21X1_LVT U222 ( .A1(reg_file_3__4_), .A2(i_dig_tx_reg_file_data_in[4]), 
        .S0(net28085), .Y(n189) );
  NAND2X0_LVT U223 ( .A1(reg_file_1__4_), .A2(net27838), .Y(n101) );
  NAND2X0_LVT U224 ( .A1(reg_file_2__4_), .A2(net27839), .Y(n100) );
  NAND4X0_LVT U225 ( .A1(n101), .A2(n99), .A3(n100), .A4(n98), .Y(
        o_dig_tx_reg_file_data_slave_out[4]) );
  AO22X1_LVT U226 ( .A1(i_dig_tx_reg_file_data_in[5]), .A2(n75), .A3(net26179), 
        .A4(reg_file_1__5_), .Y(n170) );
  AO22X1_LVT U227 ( .A1(net26176), .A2(i_dig_tx_reg_file_data_in[5]), .A3(
        net26177), .A4(reg_file_2__5_), .Y(n179) );
  MUX21X1_LVT U228 ( .A1(reg_file_3__5_), .A2(i_dig_tx_reg_file_data_in[5]), 
        .S0(net28085), .Y(n188) );
  NAND2X0_LVT U229 ( .A1(reg_file_1__5_), .A2(net27838), .Y(n105) );
  NAND2X0_LVT U230 ( .A1(reg_file_2__5_), .A2(net27839), .Y(n104) );
  NAND4X0_LVT U231 ( .A1(n105), .A2(n103), .A3(n104), .A4(n102), .Y(
        o_dig_tx_reg_file_data_slave_out[5]) );
  AO22X1_LVT U232 ( .A1(i_dig_tx_reg_file_data_in[6]), .A2(n75), .A3(net26179), 
        .A4(reg_file_1__6_), .Y(n169) );
  AO22X1_LVT U233 ( .A1(net26176), .A2(i_dig_tx_reg_file_data_in[6]), .A3(
        net26177), .A4(reg_file_2__6_), .Y(n178) );
  MUX21X1_LVT U234 ( .A1(reg_file_3__6_), .A2(i_dig_tx_reg_file_data_in[6]), 
        .S0(net28085), .Y(n187) );
  NAND2X0_LVT U235 ( .A1(reg_file_1__6_), .A2(net27838), .Y(n109) );
  NAND2X0_LVT U236 ( .A1(reg_file_2__6_), .A2(net27839), .Y(n108) );
  NAND4X0_LVT U237 ( .A1(n109), .A2(n107), .A3(n108), .A4(n106), .Y(
        o_dig_tx_reg_file_data_slave_out[6]) );
  AO22X1_LVT U238 ( .A1(n75), .A2(i_dig_tx_reg_file_data_in[7]), .A3(net26179), 
        .A4(reg_file_1__7_), .Y(n168) );
  AO22X1_LVT U239 ( .A1(net26176), .A2(i_dig_tx_reg_file_data_in[7]), .A3(
        net26177), .A4(reg_file_2__7_), .Y(n177) );
  MUX21X1_LVT U240 ( .A1(reg_file_3__7_), .A2(i_dig_tx_reg_file_data_in[7]), 
        .S0(net28085), .Y(n186) );
  NAND2X0_LVT U241 ( .A1(reg_file_1__7_), .A2(net27838), .Y(n113) );
  NAND2X0_LVT U242 ( .A1(reg_file_2__7_), .A2(net27839), .Y(n112) );
  NAND4X0_LVT U243 ( .A1(n113), .A2(n112), .A3(n111), .A4(n110), .Y(
        o_dig_tx_reg_file_data_slave_out[7]) );
  AND3X1_LVT U244 ( .A1(net26163), .A2(net26162), .A3(n114), .Y(net26161) );
  AND2X1_LVT U245 ( .A1(n84), .A2(n88), .Y(o_dig_tx_reg_file_valid_en) );
  MUX21X2_LVT U112 ( .A1(i_dig_tx_reg_file_data_in[0]), .A2(reg_file_1__0_), 
        .S0(net26179), .Y(n175) );
  NAND2X0_RVT U115 ( .A1(reg_file_4__1_), .A2(i_dig_tx_reg_file_addr_in[2]), 
        .Y(net26212) );
endmodule


module dig_tx_control_unit ( i_dig_tx_control_unit_clk, 
        i_dig_tx_control_unit_rst_n, i_dig_tx_control_unit_csn, 
        i_dig_tx_control_unit_tx_start, i_dig_tx_control_unit_tx_mode, 
        i_dig_tx_control_unit_power_domain, 
        i_dig_tx_control_unit_regfile_valid_en, 
        i_dig_tx_control_unit_shr_crc_done, 
        i_dig_tx_control_unit_data_crc_done, 
        i_dig_tx_control_unit_crc_phy_done, 
        o_dig_tx_control_unit_serializer_shr_en, 
        o_dig_tx_control_unit_serializer_payload_en, 
        o_dig_tx_control_unit_serializer_crc_en, o_dig_tx_control_unit_crc_en, 
        o_dig_tx_control_unit_clock_mode_en, o_dig_tx_control_unit_tx_busy, 
        o_dig_tx_control_unit_output_valid, o_dig_tx_control_unit_tx_done, 
        i_dig_tx_control_unit_data_fifo_empty, 
        o_dig_tx_control_unit_fifo_re_en, o_dig_tx_control_unit_spi_pow_en, 
        o_dig_tx_control_unit_spi_re_en, o_dig_tx_control_unit_spi_clk_en );
  input i_dig_tx_control_unit_clk, i_dig_tx_control_unit_rst_n,
         i_dig_tx_control_unit_csn, i_dig_tx_control_unit_tx_start,
         i_dig_tx_control_unit_tx_mode, i_dig_tx_control_unit_power_domain,
         i_dig_tx_control_unit_regfile_valid_en,
         i_dig_tx_control_unit_shr_crc_done,
         i_dig_tx_control_unit_data_crc_done,
         i_dig_tx_control_unit_crc_phy_done,
         i_dig_tx_control_unit_data_fifo_empty;
  output o_dig_tx_control_unit_serializer_shr_en,
         o_dig_tx_control_unit_serializer_payload_en,
         o_dig_tx_control_unit_serializer_crc_en, o_dig_tx_control_unit_crc_en,
         o_dig_tx_control_unit_clock_mode_en, o_dig_tx_control_unit_tx_busy,
         o_dig_tx_control_unit_output_valid, o_dig_tx_control_unit_tx_done,
         o_dig_tx_control_unit_fifo_re_en, o_dig_tx_control_unit_spi_pow_en,
         o_dig_tx_control_unit_spi_re_en, o_dig_tx_control_unit_spi_clk_en;
  wire   N31, N32, n8, n11, n12, n13, net26112, net26113, net26116, net26118,
         net26130, net26133, net26143, net26145, net26149, net26158, net26742,
         net26746, net26747, net26761, net27832, net27923, net28230, net30625,
         net30664, net30696, net30707, net30713, net30716, net41347, net26117,
         net26110, net26109, n7, n9, n14, n15, n16, n17, n18, n20, n21, n22,
         n23, n24, n25, n27, n28, n29, n30, n310, n320, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43;
  wire   [2:0] current_state;
  wire   [2:0] stall_counter;
  wire   [1:0] next_state;

  SDFFARX1_LVT stall_counter_reg_0_ ( .D(n23), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_control_unit_clk), .RSTB(i_dig_tx_control_unit_rst_n), .Q(
        stall_counter[0]), .QN(n8) );
  SDFFARX1_LVT stall_counter_reg_2_ ( .D(N32), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_control_unit_clk), .RSTB(i_dig_tx_control_unit_rst_n), .Q(
        stall_counter[2]), .QN(net30713) );
  SDFFARX2_LVT current_state_reg_0_ ( .D(next_state[0]), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_control_unit_clk), .RSTB(i_dig_tx_control_unit_rst_n), 
        .Q(current_state[0]), .QN(n13) );
  SDFFARX2_LVT current_state_reg_2_ ( .D(o_dig_tx_control_unit_crc_en), .SI(
        1'b0), .SE(1'b0), .CLK(i_dig_tx_control_unit_clk), .RSTB(
        i_dig_tx_control_unit_rst_n), .Q(current_state[2]), .QN(n11) );
  SDFFARX2_LVT current_state_reg_1_ ( .D(next_state[1]), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_control_unit_clk), .RSTB(i_dig_tx_control_unit_rst_n), 
        .Q(current_state[1]), .QN(n12) );
  SDFFARX1_LVT stall_counter_reg_1_ ( .D(N31), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_control_unit_clk), .RSTB(i_dig_tx_control_unit_rst_n), .Q(
        stall_counter[1]), .QN(net30696) );
  INVX0_LVT U9 ( .A(net30707), .Y(n7) );
  INVX1_LVT U10 ( .A(net28230), .Y(net30707) );
  INVX4_LVT U11 ( .A(n11), .Y(net41347) );
  NAND3X2_LVT U12 ( .A1(n40), .A2(n41), .A3(n42), .Y(
        o_dig_tx_control_unit_fifo_re_en) );
  INVX1_LVT U13 ( .A(i_dig_tx_control_unit_shr_crc_done), .Y(net26110) );
  AOI21X1_RVT U15 ( .A1(n27), .A2(stall_counter[0]), .A3(net26746), .Y(n23) );
  NOR3X0_LVT U16 ( .A1(n8), .A2(net30696), .A3(net30713), .Y(n9) );
  INVX2_LVT U17 ( .A(net41347), .Y(n17) );
  OR3X1_LVT U18 ( .A1(n13), .A2(net28230), .A3(n17), .Y(net26118) );
  NAND3X0_LVT U19 ( .A1(n17), .A2(net28230), .A3(n18), .Y(net26746) );
  IBUFFX2_HVT U20 ( .A(o_dig_tx_control_unit_serializer_crc_en), .Y(n33) );
  NAND3X1_LVT U21 ( .A1(net41347), .A2(n13), .A3(n12), .Y(net26117) );
  NAND3X0_LVT U22 ( .A1(current_state[2]), .A2(current_state[1]), .A3(n15), 
        .Y(n14) );
  NAND3X0_LVT U23 ( .A1(net26116), .A2(net26118), .A3(net26117), .Y(
        o_dig_tx_control_unit_output_valid) );
  INVX1_LVT U24 ( .A(n16), .Y(net26109) );
  NAND3X0_LVT U25 ( .A1(net41347), .A2(n13), .A3(n12), .Y(n16) );
  AND3X1_LVT U26 ( .A1(net28230), .A2(n18), .A3(n11), .Y(net26742) );
  INVX0_LVT U27 ( .A(n18), .Y(n15) );
  NAND3X0_LVT U28 ( .A1(current_state[2]), .A2(n7), .A3(n15), .Y(net26116) );
  AO21X1_LVT U29 ( .A1(net26742), .A2(n9), .A3(
        o_dig_tx_control_unit_output_valid), .Y(net26113) );
  AO22X1_LVT U30 ( .A1(net26742), .A2(n9), .A3(net26109), .A4(net26110), .Y(
        o_dig_tx_control_unit_serializer_shr_en) );
  NAND2X0_RVT U31 ( .A1(n9), .A2(net26742), .Y(net26112) );
  INVX2_LVT U32 ( .A(n13), .Y(n18) );
  AND2X1_LVT U33 ( .A1(net30625), .A2(n18), .Y(net26761) );
  NAND3X2_HVT U34 ( .A1(net28230), .A2(current_state[2]), .A3(current_state[0]), .Y(net26130) );
  NAND3X0_LVT U35 ( .A1(stall_counter[0]), .A2(stall_counter[1]), .A3(
        stall_counter[2]), .Y(net26158) );
  AO22X1_LVT U36 ( .A1(net26109), .A2(i_dig_tx_control_unit_shr_crc_done), 
        .A3(net26143), .A4(net26149), .Y(
        o_dig_tx_control_unit_serializer_payload_en) );
  AND2X1_LVT U37 ( .A1(n16), .A2(net26118), .Y(net27832) );
  AND2X1_LVT U38 ( .A1(n11), .A2(n12), .Y(net30625) );
  INVX2_LVT U39 ( .A(n12), .Y(net28230) );
  AND2X1_LVT U40 ( .A1(net27923), .A2(i_dig_tx_control_unit_crc_phy_done), .Y(
        o_dig_tx_control_unit_tx_done) );
  DELLN2X2_LVT U41 ( .A(net26742), .Y(net26747) );
  NAND3X0_LVT U42 ( .A1(n28), .A2(net26112), .A3(net27832), .Y(
        o_dig_tx_control_unit_crc_en) );
  INVX1_LVT U43 ( .A(net30707), .Y(net30716) );
  NBUFFX2_HVT U44 ( .A(o_dig_tx_control_unit_serializer_payload_en), .Y(
        net30664) );
  AND2X1_LVT U45 ( .A1(current_state[0]), .A2(n39), .Y(n20) );
  AO21X2_HVT U46 ( .A1(i_dig_tx_control_unit_data_fifo_empty), .A2(n38), .A3(
        net26133), .Y(n29) );
  OR3X2_HVT U47 ( .A1(i_dig_tx_control_unit_csn), .A2(
        i_dig_tx_control_unit_data_fifo_empty), .A3(n35), .Y(n310) );
  NAND4X1_HVT U48 ( .A1(net26130), .A2(n43), .A3(n42), .A4(n36), .Y(
        o_dig_tx_control_unit_spi_clk_en) );
  DELLN2X2_HVT U49 ( .A(o_dig_tx_control_unit_tx_busy), .Y(n21) );
  INVX2_LVT U50 ( .A(i_dig_tx_control_unit_data_fifo_empty), .Y(n39) );
  AND2X1_LVT U52 ( .A1(n13), .A2(n11), .Y(n25) );
  AND2X1_RVT U53 ( .A1(n27), .A2(stall_counter[0]), .Y(n22) );
  AND2X1_HVT U54 ( .A1(i_dig_tx_control_unit_tx_start), .A2(
        i_dig_tx_control_unit_regfile_valid_en), .Y(n24) );
  INVX0_HVT U55 ( .A(net26761), .Y(net26133) );
  NBUFFX2_LVT U56 ( .A(o_dig_tx_control_unit_fifo_re_en), .Y(
        o_dig_tx_control_unit_spi_re_en) );
  AND2X1_HVT U57 ( .A1(i_dig_tx_control_unit_power_domain), .A2(n21), .Y(
        o_dig_tx_control_unit_spi_pow_en) );
  NAND3X0_LVT U58 ( .A1(n37), .A2(net30625), .A3(n20), .Y(n41) );
  INVX1_LVT U59 ( .A(i_dig_tx_control_unit_regfile_valid_en), .Y(n37) );
  NAND2X0_HVT U60 ( .A1(n24), .A2(net26761), .Y(n320) );
  INVX1_LVT U61 ( .A(n34), .Y(n27) );
  MUX21X1_LVT U62 ( .A1(n22), .A2(n23), .S0(stall_counter[1]), .Y(N31) );
  AO22X1_LVT U63 ( .A1(n22), .A2(stall_counter[1]), .A3(net26747), .A4(
        stall_counter[2]), .Y(N32) );
  INVX1_LVT U64 ( .A(i_dig_tx_control_unit_crc_phy_done), .Y(n30) );
  NAND2X0_LVT U65 ( .A1(net27923), .A2(n30), .Y(n28) );
  INVX1_LVT U67 ( .A(i_dig_tx_control_unit_data_crc_done), .Y(net26149) );
  NAND2X0_LVT U68 ( .A1(n25), .A2(net30716), .Y(n42) );
  INVX1_LVT U69 ( .A(net30664), .Y(net26145) );
  INVX1_LVT U70 ( .A(i_dig_tx_control_unit_tx_start), .Y(n38) );
  NAND4X0_LVT U71 ( .A1(n42), .A2(net26145), .A3(n29), .A4(n34), .Y(
        next_state[0]) );
  AO22X1_LVT U72 ( .A1(i_dig_tx_control_unit_data_crc_done), .A2(net26143), 
        .A3(net27923), .A4(n30), .Y(o_dig_tx_control_unit_serializer_crc_en)
         );
  NAND2X0_LVT U73 ( .A1(n25), .A2(net30707), .Y(n35) );
  NAND4X0_LVT U74 ( .A1(n34), .A2(n33), .A3(n320), .A4(n310), .Y(next_state[1]) );
  OA21X1_LVT U76 ( .A1(n24), .A2(net26133), .A3(n35), .Y(n36) );
  NAND3X0_LVT U77 ( .A1(n39), .A2(net26761), .A3(n38), .Y(n40) );
  NAND3X0_LVT U78 ( .A1(net27832), .A2(net26746), .A3(n14), .Y(
        o_dig_tx_control_unit_tx_busy) );
  AND2X1_LVT U79 ( .A1(net26113), .A2(i_dig_tx_control_unit_tx_mode), .Y(
        o_dig_tx_control_unit_clock_mode_en) );
  NAND2X0_HVT U51 ( .A1(net27923), .A2(i_dig_tx_control_unit_crc_phy_done), 
        .Y(n43) );
  INVX0_LVT U66 ( .A(net26118), .Y(net26143) );
  NAND2X0_RVT U75 ( .A1(net26158), .A2(net26742), .Y(n34) );
  AND3X2_LVT U14 ( .A1(current_state[2]), .A2(n13), .A3(current_state[1]), .Y(
        net27923) );
endmodule


module dig_tx_serializer_32_16_24_55557a ( i_dig_tx_serializer_clk, 
        i_dig_tx_serializer_rst_n, i_dig_tx_serializer_reg_data_in, 
        i_dig_tx_serializer_crc_out, i_dig_tx_serializer_clock_mode_en, 
        i_dig_tx_serializer_shr_en, i_dig_tx_serializer_payload_en, 
        i_dig_tx_serializer_crc_en, o_dig_tx_serializer_crc_in, 
        o_dig_tx_serializer_phy_out, o_dig_tx_serializer_shr_crc_done, 
        o_dig_tx_serializer_data_crc_done, o_dig_tx_serializer_crc_phy_done, 
        o_dig_tx_serializer_clock_freq_en );
  input [31:0] i_dig_tx_serializer_reg_data_in;
  input [15:0] i_dig_tx_serializer_crc_out;
  input i_dig_tx_serializer_clk, i_dig_tx_serializer_rst_n,
         i_dig_tx_serializer_clock_mode_en, i_dig_tx_serializer_shr_en,
         i_dig_tx_serializer_payload_en, i_dig_tx_serializer_crc_en;
  output o_dig_tx_serializer_crc_in, o_dig_tx_serializer_phy_out,
         o_dig_tx_serializer_shr_crc_done, o_dig_tx_serializer_data_crc_done,
         o_dig_tx_serializer_crc_phy_done, o_dig_tx_serializer_clock_freq_en;
  wire   N160, N163, N164, N165, N166, N167, N168, N245, N285, n34, n75, n77,
         n78, n80, n81, n83, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         net20045, net25975, net25977, net25983, net25987, net25989, net25990,
         net25992, net26028, net26063, net26066, net26067, net26068, net26070,
         net26071, net26072, net26085, net26107, net26108, net26735, net26734,
         net27773, net27781, net27783, net27785, net27841, net28007, net30693,
         net30722, net30735, net30738, net26106, net26086, net30706, net30688,
         net26081, net26080, net26079, net26077, net26076, net26073, net25994,
         net25986, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n76,
         n79, n82, n84, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n1600, n161, n162, n1630, n1640, n1650, n1660, n1670, n1680, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n138, n204;
  wire   [4:0] counter_send_shr_crc;

  SDFFARX1_LVT clock_freq_en_reg ( .D(N285), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n136), .Q(n28), .QN(n41) );
  SDFFARX1_LVT counter_send_shr_crc_reg_0_ ( .D(n93), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n136), .Q(counter_send_shr_crc[0]), .QN(n52) );
  SDFFARX1_LVT o_dig_tx_serializer_shr_crc_done_reg ( .D(n92), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_serializer_clk), .RSTB(n136), .Q(
        o_dig_tx_serializer_shr_crc_done) );
  SDFFARX1_LVT counter_send_shr_crc_reg_1_ ( .D(n91), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n136), .Q(counter_send_shr_crc[1]), .QN(n25) );
  SDFFARX1_LVT counter_send_shr_crc_reg_2_ ( .D(n90), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n136), .Q(counter_send_shr_crc[2]), .QN(n23) );
  SDFFARX1_LVT counter_send_shr_crc_reg_3_ ( .D(n89), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n136), .Q(counter_send_shr_crc[3]), .QN(n1650) );
  SDFFARX1_LVT counter_send_shr_crc_reg_4_ ( .D(n88), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n136), .Q(counter_send_shr_crc[4]), .QN(n22) );
  SDFFARX1_LVT o_dig_tx_serializer_crc_in_reg ( .D(n86), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n136), .Q(
        o_dig_tx_serializer_crc_in), .QN(n27) );
  SDFFARX1_LVT o_dig_tx_serializer_phy_out_reg ( .D(n87), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n135), .Q(
        o_dig_tx_serializer_phy_out) );
  SDFFARX1_LVT counter_send_data_crc_reg_0_ ( .D(n85), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n135), .Q(N160), .QN(n50) );
  SDFFARX1_LVT o_dig_tx_serializer_data_crc_done_reg ( .D(n80), .SI(1'b0), 
        .SE(1'b0), .CLK(i_dig_tx_serializer_clk), .RSTB(n135), .Q(
        o_dig_tx_serializer_data_crc_done) );
  SDFFARX1_LVT counter_send_data_crc_reg_3_ ( .D(n203), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n135), .Q(N163), .QN(n65) );
  SDFFARX1_LVT counter_send_data_crc_reg_4_ ( .D(n81), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n135), .Q(N164), .QN(n72) );
  SDFFARX1_LVT counter_send_crc_phy_reg_2_ ( .D(n77), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n135), .Q(N167), .QN(net30738) );
  SDFFARX1_LVT o_dig_tx_serializer_crc_phy_done_reg ( .D(n75), .SI(1'b0), .SE(
        1'b0), .CLK(i_dig_tx_serializer_clk), .RSTB(n135), .Q(
        o_dig_tx_serializer_crc_phy_done), .QN(n24) );
  SDFFARX1_LVT counter_send_crc_phy_reg_3_ ( .D(n201), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n135), .Q(N168), .QN(n26) );
  SDFFARX1_LVT counter_send_crc_phy_reg_1_ ( .D(n78), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n135), .Q(N166), .QN(n31) );
  SDFFARX2_LVT counter_send_data_crc_reg_2_ ( .D(n83), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n135), .QN(n45) );
  SDFFARX2_LVT counter_send_data_crc_reg_1_ ( .D(n202), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_serializer_clk), .RSTB(n135), .QN(n134) );
  SDFFARX1_LVT counter_send_crc_phy_reg_0_ ( .D(net20045), .SI(1'b0), .SE(1'b0), .CLK(i_dig_tx_serializer_clk), .RSTB(n135), .Q(N165), .QN(n34) );
  INVX2_LVT U23 ( .A(net26073), .Y(net26076) );
  NAND2X0_HVT U24 ( .A1(n149), .A2(n65), .Y(n145) );
  MUX21X1_HVT U25 ( .A1(n23), .A2(n154), .S0(counter_send_shr_crc[1]), .Y(n155) );
  NAND2X0_LVT U26 ( .A1(net25989), .A2(n48), .Y(n197) );
  NAND2X0_HVT U28 ( .A1(N160), .A2(n142), .Y(n141) );
  NAND2X0_HVT U30 ( .A1(N160), .A2(n139), .Y(n140) );
  NOR2X2_LVT U31 ( .A1(n50), .A2(n134), .Y(n62) );
  NAND2X0_HVT U32 ( .A1(net26107), .A2(net26085), .Y(n21) );
  INVX1_LVT U34 ( .A(n45), .Y(n36) );
  INVX1_LVT U35 ( .A(n45), .Y(n37) );
  INVX1_LVT U36 ( .A(net26070), .Y(net26068) );
  NAND2X0_LVT U37 ( .A1(n51), .A2(N245), .Y(n194) );
  INVX2_LVT U38 ( .A(net25990), .Y(net26107) );
  AND3X1_LVT U39 ( .A1(N164), .A2(N163), .A3(n149), .Y(n29) );
  AO22X1_RVT U42 ( .A1(n1630), .A2(net26028), .A3(
        o_dig_tx_serializer_shr_crc_done), .A4(net25989), .Y(n92) );
  AND2X1_RVT U43 ( .A1(n58), .A2(n52), .Y(n30) );
  NAND2X0_LVT U45 ( .A1(net26107), .A2(n32), .Y(n33) );
  NAND2X0_LVT U46 ( .A1(o_dig_tx_serializer_data_crc_done), .A2(n151), .Y(n35)
         );
  NAND2X0_LVT U47 ( .A1(n33), .A2(n35), .Y(n80) );
  INVX0_LVT U48 ( .A(n151), .Y(n32) );
  NAND2X0_RVT U49 ( .A1(n29), .A2(net26085), .Y(n150) );
  NAND4X0_LVT U50 ( .A1(net25983), .A2(n194), .A3(n195), .A4(n196), .Y(n87) );
  OAI22X1_LVT U51 ( .A1(net26077), .A2(net26080), .A3(n31), .A4(net26081), .Y(
        n78) );
  NAND3X0_LVT U52 ( .A1(N165), .A2(n31), .A3(net26076), .Y(net26080) );
  AND2X1_LVT U53 ( .A1(n31), .A2(net30738), .Y(net27841) );
  AND2X1_LVT U54 ( .A1(N167), .A2(n31), .Y(net27783) );
  OA21X1_LVT U55 ( .A1(net26073), .A2(N165), .A3(net30688), .Y(net26081) );
  NAND4X0_LVT U56 ( .A1(net27781), .A2(N167), .A3(net26076), .A4(n204), .Y(
        net26071) );
  NAND2X0_LVT U57 ( .A1(n34), .A2(net26076), .Y(n39) );
  NAND3X0_LVT U58 ( .A1(net27781), .A2(net30738), .A3(net26076), .Y(n38) );
  OAI22X1_LVT U59 ( .A1(net26077), .A2(n39), .A3(n34), .A4(n204), .Y(net20045)
         );
  OAI22X1_LVT U60 ( .A1(net26077), .A2(n38), .A3(net26079), .A4(net30738), .Y(
        n77) );
  AO21X1_LVT U61 ( .A1(net26073), .A2(n204), .A3(n26), .Y(net26072) );
  NAND2X0_LVT U63 ( .A1(net25994), .A2(net26085), .Y(net25986) );
  INVX1_LVT U64 ( .A(net26086), .Y(net25994) );
  NBUFFX2_LVT U65 ( .A(net25994), .Y(net30735) );
  NAND2X0_LVT U66 ( .A1(o_dig_tx_serializer_clock_freq_en), .A2(net25994), .Y(
        net30706) );
  NAND2X0_LVT U67 ( .A1(net25994), .A2(net26070), .Y(net26073) );
  AND2X1_LVT U68 ( .A1(N165), .A2(N166), .Y(net27781) );
  AND2X1_LVT U69 ( .A1(N166), .A2(net30738), .Y(net27785) );
  AND2X1_LVT U70 ( .A1(N166), .A2(N167), .Y(net27773) );
  OA21X1_LVT U71 ( .A1(net27781), .A2(net26073), .A3(net30688), .Y(net26079)
         );
  NAND2X0_LVT U72 ( .A1(net30706), .A2(net25989), .Y(net30688) );
  AND2X1_LVT U73 ( .A1(net28007), .A2(net30688), .Y(net26066) );
  NAND3X2_LVT U74 ( .A1(net26106), .A2(n40), .A3(net26734), .Y(net25989) );
  NAND3X2_RVT U76 ( .A1(net26063), .A2(net30693), .A3(net26086), .Y(net26108)
         );
  NAND3X0_LVT U77 ( .A1(net25987), .A2(o_dig_tx_serializer_phy_out), .A3(
        net30706), .Y(net25983) );
  INVX2_LVT U78 ( .A(i_dig_tx_serializer_shr_en), .Y(net26734) );
  NAND2X0_RVT U79 ( .A1(net26734), .A2(i_dig_tx_serializer_payload_en), .Y(
        net26063) );
  NAND2X0_LVT U80 ( .A1(net26734), .A2(i_dig_tx_serializer_payload_en), .Y(
        net25990) );
  OR2X2_LVT U81 ( .A1(i_dig_tx_serializer_clock_mode_en), .A2(n28), .Y(
        net26085) );
  OR2X2_LVT U82 ( .A1(n28), .A2(i_dig_tx_serializer_clock_mode_en), .Y(
        o_dig_tx_serializer_clock_freq_en) );
  AO21X1_LVT U83 ( .A1(n42), .A2(n41), .A3(net30693), .Y(net30722) );
  AO21X1_LVT U84 ( .A1(n42), .A2(n41), .A3(net30693), .Y(net25977) );
  INVX0_LVT U85 ( .A(i_dig_tx_serializer_clock_mode_en), .Y(n42) );
  AND2X1_LVT U86 ( .A1(net25989), .A2(net25977), .Y(n43) );
  AND2X1_LVT U87 ( .A1(n147), .A2(net25989), .Y(n44) );
  INVX1_LVT U88 ( .A(net26735), .Y(net30693) );
  INVX1_LVT U89 ( .A(net26734), .Y(net26735) );
  AND2X1_LVT U90 ( .A1(net26735), .A2(n162), .Y(n46) );
  INVX2_LVT U91 ( .A(n134), .Y(n47) );
  NAND2X0_LVT U92 ( .A1(net26107), .A2(net26085), .Y(n48) );
  AND2X1_LVT U93 ( .A1(net25977), .A2(net25989), .Y(n49) );
  NAND3X2_LVT U94 ( .A1(n192), .A2(net26085), .A3(net30735), .Y(n195) );
  INVX0_LVT U95 ( .A(net25989), .Y(net26067) );
  INVX0_LVT U96 ( .A(net26085), .Y(net25992) );
  AND2X1_LVT U97 ( .A1(net26107), .A2(net26085), .Y(n51) );
  AO21X1_LVT U98 ( .A1(net25990), .A2(net30693), .A3(net25992), .Y(n193) );
  NAND2X0_LVT U99 ( .A1(net26066), .A2(net30735), .Y(n56) );
  OR2X1_LVT U100 ( .A1(net26068), .A2(net26067), .Y(net28007) );
  NAND2X0_LVT U101 ( .A1(n30), .A2(n152), .Y(n53) );
  NAND2X0_LVT U102 ( .A1(n43), .A2(counter_send_shr_crc[0]), .Y(n54) );
  NAND2X0_LVT U103 ( .A1(n53), .A2(n54), .Y(n93) );
  NAND2X0_LVT U104 ( .A1(n55), .A2(n56), .Y(n75) );
  INVX2_LVT U105 ( .A(n137), .Y(n135) );
  INVX1_LVT U106 ( .A(n137), .Y(n136) );
  AND2X1_LVT U107 ( .A1(n134), .A2(n50), .Y(n57) );
  AND2X1_LVT U108 ( .A1(net26735), .A2(n162), .Y(n58) );
  AOI21X1_LVT U110 ( .A1(n46), .A2(n156), .A3(n49), .Y(n60) );
  INVX1_LVT U111 ( .A(i_dig_tx_serializer_rst_n), .Y(n137) );
  AND2X1_LVT U112 ( .A1(N160), .A2(n134), .Y(n61) );
  OR2X1_LVT U113 ( .A1(n52), .A2(n1640), .Y(n156) );
  AND2X1_LVT U114 ( .A1(n47), .A2(n50), .Y(n63) );
  NAND3X0_LVT U115 ( .A1(n64), .A2(n65), .A3(n66), .Y(n115) );
  AND4X1_LVT U116 ( .A1(n120), .A2(n121), .A3(n122), .A4(n123), .Y(n64) );
  AND4X1_LVT U117 ( .A1(n116), .A2(n117), .A3(n118), .A4(n119), .Y(n66) );
  AOI21X1_LVT U119 ( .A1(n58), .A2(n52), .A3(n49), .Y(n68) );
  NAND3X0_LVT U120 ( .A1(n69), .A2(n70), .A3(n71), .Y(N245) );
  NAND3X0_LVT U121 ( .A1(n72), .A2(n73), .A3(N163), .Y(n71) );
  NAND4X0_LVT U122 ( .A1(n74), .A2(n76), .A3(n79), .A4(n82), .Y(n73) );
  AND2X1_LVT U123 ( .A1(n84), .A2(n94), .Y(n82) );
  NAND3X0_LVT U124 ( .A1(n61), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[9]), .Y(n94) );
  NAND3X0_LVT U125 ( .A1(n62), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[11]), .Y(n84) );
  AND2X1_LVT U126 ( .A1(n95), .A2(n96), .Y(n79) );
  NAND3X0_LVT U127 ( .A1(n63), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[10]), .Y(n96) );
  NAND3X0_LVT U128 ( .A1(n57), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[8]), .Y(n95) );
  AND2X1_LVT U129 ( .A1(n97), .A2(n98), .Y(n76) );
  NAND3X0_LVT U130 ( .A1(n37), .A2(n61), .A3(
        i_dig_tx_serializer_reg_data_in[13]), .Y(n98) );
  NAND3X0_LVT U131 ( .A1(n37), .A2(n62), .A3(
        i_dig_tx_serializer_reg_data_in[15]), .Y(n97) );
  AND2X1_LVT U132 ( .A1(n99), .A2(n100), .Y(n74) );
  NAND3X0_LVT U133 ( .A1(n37), .A2(n63), .A3(
        i_dig_tx_serializer_reg_data_in[14]), .Y(n100) );
  NAND3X0_LVT U134 ( .A1(n37), .A2(n57), .A3(
        i_dig_tx_serializer_reg_data_in[12]), .Y(n99) );
  NAND3X0_LVT U135 ( .A1(n72), .A2(n101), .A3(n65), .Y(n70) );
  NAND4X0_LVT U136 ( .A1(n102), .A2(n103), .A3(n104), .A4(n105), .Y(n101) );
  AND2X1_LVT U137 ( .A1(n106), .A2(n107), .Y(n105) );
  NAND3X0_LVT U138 ( .A1(n61), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[1]), .Y(n107) );
  NAND3X0_LVT U139 ( .A1(n62), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[3]), .Y(n106) );
  AND2X1_LVT U140 ( .A1(n108), .A2(n109), .Y(n104) );
  NAND3X0_LVT U141 ( .A1(n63), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[2]), .Y(n109) );
  NAND3X0_LVT U142 ( .A1(n57), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[0]), .Y(n108) );
  AND2X1_LVT U143 ( .A1(n110), .A2(n111), .Y(n103) );
  NAND3X0_LVT U144 ( .A1(n37), .A2(n61), .A3(
        i_dig_tx_serializer_reg_data_in[5]), .Y(n111) );
  NAND3X0_LVT U145 ( .A1(n37), .A2(n62), .A3(
        i_dig_tx_serializer_reg_data_in[7]), .Y(n110) );
  AND2X1_LVT U146 ( .A1(n112), .A2(n113), .Y(n102) );
  NAND3X0_LVT U147 ( .A1(n37), .A2(n63), .A3(
        i_dig_tx_serializer_reg_data_in[6]), .Y(n113) );
  NAND3X0_LVT U148 ( .A1(n37), .A2(n57), .A3(
        i_dig_tx_serializer_reg_data_in[4]), .Y(n112) );
  NAND3X0_LVT U149 ( .A1(N164), .A2(n114), .A3(n115), .Y(n69) );
  NAND3X0_LVT U150 ( .A1(n36), .A2(n61), .A3(
        i_dig_tx_serializer_reg_data_in[21]), .Y(n119) );
  NAND3X0_LVT U151 ( .A1(n36), .A2(n62), .A3(
        i_dig_tx_serializer_reg_data_in[23]), .Y(n118) );
  NAND3X0_LVT U152 ( .A1(n36), .A2(n63), .A3(
        i_dig_tx_serializer_reg_data_in[22]), .Y(n117) );
  NAND3X0_LVT U153 ( .A1(n36), .A2(n57), .A3(
        i_dig_tx_serializer_reg_data_in[20]), .Y(n116) );
  NAND3X0_LVT U154 ( .A1(n61), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[17]), .Y(n123) );
  NAND3X0_LVT U155 ( .A1(n62), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[19]), .Y(n122) );
  NAND3X0_LVT U156 ( .A1(n63), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[18]), .Y(n121) );
  NAND3X0_LVT U157 ( .A1(n57), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[16]), .Y(n120) );
  OR3X1_LVT U158 ( .A1(n65), .A2(n124), .A3(n125), .Y(n114) );
  NAND4X0_LVT U159 ( .A1(n126), .A2(n127), .A3(n128), .A4(n129), .Y(n125) );
  NAND3X0_LVT U160 ( .A1(n36), .A2(n61), .A3(
        i_dig_tx_serializer_reg_data_in[29]), .Y(n129) );
  NAND3X0_LVT U161 ( .A1(n36), .A2(n62), .A3(
        i_dig_tx_serializer_reg_data_in[31]), .Y(n128) );
  NAND3X0_LVT U162 ( .A1(n36), .A2(n63), .A3(
        i_dig_tx_serializer_reg_data_in[30]), .Y(n127) );
  NAND3X0_LVT U163 ( .A1(n37), .A2(n57), .A3(
        i_dig_tx_serializer_reg_data_in[28]), .Y(n126) );
  NAND4X0_LVT U164 ( .A1(n133), .A2(n130), .A3(n132), .A4(n131), .Y(n124) );
  NAND3X0_LVT U165 ( .A1(n61), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[25]), .Y(n133) );
  NAND3X0_LVT U166 ( .A1(n62), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[27]), .Y(n132) );
  NAND3X0_LVT U167 ( .A1(n63), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[26]), .Y(n131) );
  NAND3X0_LVT U168 ( .A1(n57), .A2(n45), .A3(
        i_dig_tx_serializer_reg_data_in[24]), .Y(n130) );
  AND2X1_LVT U169 ( .A1(n41), .A2(net26108), .Y(N285) );
  NAND2X0_LVT U170 ( .A1(net26107), .A2(o_dig_tx_serializer_clock_freq_en), 
        .Y(n147) );
  MUX21X1_LVT U171 ( .A1(n51), .A2(n44), .S0(N160), .Y(n85) );
  INVX1_LVT U172 ( .A(n47), .Y(n139) );
  OAI22X1_LVT U173 ( .A1(n21), .A2(n140), .A3(n139), .A4(n67), .Y(n202) );
  INVX1_LVT U174 ( .A(n37), .Y(n142) );
  MUX21X1_LVT U175 ( .A1(n142), .A2(n141), .S0(n47), .Y(n143) );
  OAI22X1_LVT U176 ( .A1(n143), .A2(n48), .A3(n142), .A4(n67), .Y(n83) );
  NAND3X0_LVT U177 ( .A1(n47), .A2(N160), .A3(n37), .Y(n144) );
  INVX1_LVT U178 ( .A(n144), .Y(n149) );
  OAI22X1_LVT U179 ( .A1(n48), .A2(n145), .A3(n65), .A4(n59), .Y(n203) );
  NAND2X0_LVT U180 ( .A1(n149), .A2(n72), .Y(n146) );
  MUX21X1_LVT U181 ( .A1(n72), .A2(n146), .S0(N163), .Y(n148) );
  OAI22X1_LVT U182 ( .A1(n148), .A2(n48), .A3(n72), .A4(n59), .Y(n81) );
  NAND3X0_LVT U183 ( .A1(N168), .A2(N167), .A3(net27781), .Y(net26070) );
  NAND2X0_LVT U184 ( .A1(net26071), .A2(net26072), .Y(n201) );
  OA21X1_LVT U185 ( .A1(net26063), .A2(n150), .A3(net25989), .Y(n151) );
  NAND2X0_LVT U186 ( .A1(counter_send_shr_crc[2]), .A2(counter_send_shr_crc[1]), .Y(n1640) );
  INVX1_LVT U187 ( .A(n156), .Y(n158) );
  NAND3X0_LVT U188 ( .A1(n1650), .A2(counter_send_shr_crc[4]), .A3(n158), .Y(
        n162) );
  NAND2X0_LVT U189 ( .A1(net30722), .A2(net25989), .Y(n152) );
  NAND2X0_LVT U190 ( .A1(n46), .A2(n152), .Y(n1600) );
  NAND3X0_LVT U191 ( .A1(counter_send_shr_crc[0]), .A2(n25), .A3(n46), .Y(n153) );
  OAI22X1_LVT U192 ( .A1(n43), .A2(n153), .A3(n25), .A4(n68), .Y(n91) );
  NAND2X0_LVT U193 ( .A1(counter_send_shr_crc[0]), .A2(n23), .Y(n154) );
  OAI22X1_LVT U194 ( .A1(n155), .A2(n1600), .A3(n23), .A4(n68), .Y(n90) );
  NAND3X0_LVT U195 ( .A1(n158), .A2(n1650), .A3(n58), .Y(n157) );
  OAI22X1_LVT U196 ( .A1(n43), .A2(n157), .A3(n1650), .A4(n60), .Y(n89) );
  NAND2X0_LVT U197 ( .A1(n158), .A2(n22), .Y(n159) );
  MUX21X1_LVT U198 ( .A1(n22), .A2(n159), .S0(counter_send_shr_crc[3]), .Y(
        n161) );
  OAI22X1_LVT U199 ( .A1(n161), .A2(n1600), .A3(n22), .A4(n60), .Y(n88) );
  INVX1_LVT U200 ( .A(n162), .Y(n1630) );
  INVX1_LVT U201 ( .A(net30722), .Y(net26028) );
  AND3X1_LVT U202 ( .A1(n1640), .A2(n22), .A3(n1650), .Y(n1670) );
  NAND3X0_LVT U203 ( .A1(n23), .A2(n22), .A3(n1650), .Y(n1660) );
  MUX21X1_LVT U204 ( .A1(n1670), .A2(n1660), .S0(n52), .Y(n1680) );
  NAND2X0_LVT U205 ( .A1(net26735), .A2(n1680), .Y(n198) );
  INVX1_LVT U206 ( .A(n198), .Y(n169) );
  NAND2X0_LVT U207 ( .A1(net26028), .A2(n169), .Y(n196) );
  NAND3X0_LVT U208 ( .A1(i_dig_tx_serializer_crc_out[5]), .A2(N165), .A3(
        net27783), .Y(n173) );
  NAND3X0_LVT U209 ( .A1(i_dig_tx_serializer_crc_out[1]), .A2(N165), .A3(
        net27841), .Y(n172) );
  NAND3X0_LVT U210 ( .A1(i_dig_tx_serializer_crc_out[3]), .A2(N165), .A3(
        net27785), .Y(n171) );
  NAND3X0_LVT U211 ( .A1(i_dig_tx_serializer_crc_out[7]), .A2(N165), .A3(
        net27773), .Y(n170) );
  NAND4X0_LVT U212 ( .A1(n173), .A2(n172), .A3(n171), .A4(n170), .Y(n179) );
  NAND3X0_LVT U213 ( .A1(i_dig_tx_serializer_crc_out[4]), .A2(n34), .A3(
        net27783), .Y(n177) );
  NAND3X0_LVT U214 ( .A1(i_dig_tx_serializer_crc_out[0]), .A2(n34), .A3(
        net27841), .Y(n176) );
  NAND3X0_LVT U215 ( .A1(i_dig_tx_serializer_crc_out[2]), .A2(n34), .A3(
        net27785), .Y(n175) );
  NAND3X0_LVT U216 ( .A1(i_dig_tx_serializer_crc_out[6]), .A2(n34), .A3(
        net27773), .Y(n174) );
  NAND4X0_LVT U217 ( .A1(n177), .A2(n176), .A3(n175), .A4(n174), .Y(n178) );
  OR2X1_LVT U218 ( .A1(n179), .A2(n178), .Y(n191) );
  NAND3X0_LVT U219 ( .A1(i_dig_tx_serializer_crc_out[13]), .A2(N165), .A3(
        net27783), .Y(n183) );
  NAND3X0_LVT U220 ( .A1(i_dig_tx_serializer_crc_out[9]), .A2(N165), .A3(
        net27841), .Y(n182) );
  NAND3X0_LVT U221 ( .A1(i_dig_tx_serializer_crc_out[11]), .A2(N165), .A3(
        net27785), .Y(n181) );
  NAND3X0_LVT U222 ( .A1(i_dig_tx_serializer_crc_out[15]), .A2(N165), .A3(
        net27773), .Y(n180) );
  NAND4X0_LVT U223 ( .A1(n183), .A2(n182), .A3(n181), .A4(n180), .Y(n189) );
  NAND3X0_LVT U224 ( .A1(i_dig_tx_serializer_crc_out[12]), .A2(n34), .A3(
        net27783), .Y(n187) );
  NAND3X0_LVT U225 ( .A1(i_dig_tx_serializer_crc_out[8]), .A2(n34), .A3(
        net27841), .Y(n186) );
  NAND3X0_LVT U226 ( .A1(i_dig_tx_serializer_crc_out[10]), .A2(n34), .A3(
        net27785), .Y(n185) );
  NAND3X0_LVT U227 ( .A1(i_dig_tx_serializer_crc_out[14]), .A2(n34), .A3(
        net27773), .Y(n184) );
  NAND4X0_LVT U228 ( .A1(n187), .A2(n186), .A3(n185), .A4(n184), .Y(n188) );
  OR2X1_LVT U229 ( .A1(n189), .A2(n188), .Y(n190) );
  MUX21X1_LVT U230 ( .A1(n191), .A2(n190), .S0(N168), .Y(n192) );
  NAND2X0_LVT U231 ( .A1(n193), .A2(net25989), .Y(net25975) );
  NAND3X0_LVT U233 ( .A1(net26107), .A2(N245), .A3(n197), .Y(n200) );
  AO22X1_LVT U234 ( .A1(net25975), .A2(n198), .A3(net30722), .A4(n27), .Y(n199) );
  NAND2X0_LVT U235 ( .A1(n199), .A2(n200), .Y(n86) );
  INVX0_LVT U29 ( .A(net25975), .Y(net25987) );
  INVX0_LVT U44 ( .A(i_dig_tx_serializer_crc_en), .Y(net26106) );
  AOI22X1_LVT U118 ( .A1(n147), .A2(net25989), .A3(net26107), .A4(n50), .Y(n67) );
  INVX1_LVT U27 ( .A(n138), .Y(net26077) );
  NAND2X0_LVT U33 ( .A1(net25986), .A2(net25989), .Y(n138) );
  NAND2X0_LVT U40 ( .A1(net25986), .A2(net25989), .Y(n204) );
  OR2X1_LVT U41 ( .A1(n24), .A2(net26066), .Y(n55) );
  NAND3X0_LVT U62 ( .A1(n40), .A2(net26734), .A3(i_dig_tx_serializer_crc_en), 
        .Y(net26086) );
  INVX1_LVT U75 ( .A(i_dig_tx_serializer_payload_en), .Y(n40) );
  AOI22X1_LVT U109 ( .A1(n147), .A2(net25989), .A3(net26107), .A4(n144), .Y(
        n59) );
endmodule


module dig_tx_crc_REGISTER_WIDTH16_INPUT_LENGTH56 ( i_dig_tx_crc_clk, 
        i_dig_tx_crc_rst_n, i_dig_tx_crc_data_in, i_dig_tx_crc_en, 
        i_dig_tx_crc_clock_freq_en, o_dig_tx_crc_data_out, o_dig_tx_crc_valid
 );
  output [15:0] o_dig_tx_crc_data_out;
  input i_dig_tx_crc_clk, i_dig_tx_crc_rst_n, i_dig_tx_crc_data_in,
         i_dig_tx_crc_en, i_dig_tx_crc_clock_freq_en;
  output o_dig_tx_crc_valid;
  wire   N14, N15, N16, N17, N18, N19, N20, n42, n43, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n41, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, add_57_n6, add_57_n5, add_57_n4, add_57_n3, add_57_n2,
         add_57_n1;
  wire   [15:0] remainder_d;
  wire   [6:0] counter;

  SDFFARX1_LVT counter_reg_0_ ( .D(n93), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n53), .Q(counter[0]) );
  SDFFARX1_LVT o_dig_tx_crc_valid_reg ( .D(n92), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n53), .Q(o_dig_tx_crc_valid) );
  SDFFARX1_LVT counter_reg_1_ ( .D(n75), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n53), .Q(counter[1]) );
  SDFFARX1_LVT counter_reg_2_ ( .D(n74), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n53), .Q(counter[2]) );
  SDFFARX1_LVT counter_reg_3_ ( .D(n73), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n52), .Q(counter[3]), .QN(n43) );
  SDFFARX1_LVT counter_reg_4_ ( .D(n72), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n52), .Q(counter[4]) );
  SDFFARX1_LVT counter_reg_5_ ( .D(n71), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n52), .Q(counter[5]) );
  SDFFARX1_LVT counter_reg_6_ ( .D(n70), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n52), .Q(counter[6]), .QN(n42) );
  SDFFARX1_LVT remainder_d_reg_0_ ( .D(n91), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n52), .Q(remainder_d[0]) );
  SDFFARX1_LVT remainder_d_reg_15_ ( .D(n76), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n52), .Q(remainder_d[15]) );
  SDFFARX1_LVT remainder_d_reg_14_ ( .D(n77), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n52), .Q(remainder_d[14]) );
  SDFFARX1_LVT remainder_d_reg_13_ ( .D(n78), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n52), .Q(remainder_d[13]) );
  SDFFARX1_LVT remainder_d_reg_12_ ( .D(n79), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n52), .Q(remainder_d[12]) );
  SDFFARX1_LVT remainder_d_reg_11_ ( .D(n80), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n52), .Q(remainder_d[11]), .QN(n49) );
  SDFFARX1_LVT remainder_d_reg_10_ ( .D(n81), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n52), .Q(remainder_d[10]) );
  SDFFARX1_LVT remainder_d_reg_9_ ( .D(n82), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n52), .Q(remainder_d[9]) );
  SDFFARX1_LVT remainder_d_reg_8_ ( .D(n83), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n51), .Q(remainder_d[8]) );
  SDFFARX1_LVT remainder_d_reg_7_ ( .D(n84), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n51), .Q(remainder_d[7]) );
  SDFFARX1_LVT remainder_d_reg_6_ ( .D(n85), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n51), .Q(remainder_d[6]) );
  SDFFARX1_LVT remainder_d_reg_5_ ( .D(n86), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n51), .Q(remainder_d[5]) );
  SDFFARX1_LVT remainder_d_reg_4_ ( .D(n87), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n51), .Q(remainder_d[4]), .QN(n47) );
  SDFFARX1_LVT remainder_d_reg_3_ ( .D(n88), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n51), .Q(remainder_d[3]) );
  SDFFARX1_LVT remainder_d_reg_2_ ( .D(n89), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n51), .Q(remainder_d[2]) );
  SDFFARX1_LVT remainder_d_reg_1_ ( .D(n90), .SI(1'b0), .SE(1'b0), .CLK(
        i_dig_tx_crc_clk), .RSTB(n51), .Q(remainder_d[1]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_15_ ( .D(n69), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n51), .Q(o_dig_tx_crc_data_out[15]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_14_ ( .D(n68), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n51), .Q(o_dig_tx_crc_data_out[14]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_13_ ( .D(n67), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n51), .Q(o_dig_tx_crc_data_out[13]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_12_ ( .D(n66), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n51), .Q(o_dig_tx_crc_data_out[12]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_11_ ( .D(n65), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n50), .Q(o_dig_tx_crc_data_out[11]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_10_ ( .D(n64), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n50), .Q(o_dig_tx_crc_data_out[10]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_9_ ( .D(n63), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n50), .Q(o_dig_tx_crc_data_out[9]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_8_ ( .D(n62), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n50), .Q(o_dig_tx_crc_data_out[8]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_7_ ( .D(n61), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n50), .Q(o_dig_tx_crc_data_out[7]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_6_ ( .D(n60), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n50), .Q(o_dig_tx_crc_data_out[6]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_5_ ( .D(n59), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n50), .Q(o_dig_tx_crc_data_out[5]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_4_ ( .D(n58), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n50), .Q(o_dig_tx_crc_data_out[4]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_3_ ( .D(n57), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n50), .Q(o_dig_tx_crc_data_out[3]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_2_ ( .D(n56), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n50), .Q(o_dig_tx_crc_data_out[2]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_1_ ( .D(n55), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n50), .Q(o_dig_tx_crc_data_out[1]) );
  SDFFARX1_LVT o_dig_tx_crc_data_out_reg_0_ ( .D(n54), .SI(1'b0), .SE(1'b0), 
        .CLK(i_dig_tx_crc_clk), .RSTB(n50), .Q(o_dig_tx_crc_data_out[0]) );
  AO21X2_LVT U43 ( .A1(o_dig_tx_crc_valid), .A2(i_dig_tx_crc_en), .A3(n45), 
        .Y(n92) );
  MUX21X2_LVT U44 ( .A1(o_dig_tx_crc_data_out[7]), .A2(remainder_d[8]), .S0(
        n45), .Y(n61) );
  MUX21X2_LVT U45 ( .A1(o_dig_tx_crc_data_out[6]), .A2(remainder_d[7]), .S0(
        n45), .Y(n60) );
  AND2X4_LVT U46 ( .A1(i_dig_tx_crc_en), .A2(n98), .Y(n41) );
  MUX21X2_LVT U47 ( .A1(o_dig_tx_crc_data_out[15]), .A2(n103), .S0(n45), .Y(
        n69) );
  MUX21X2_LVT U48 ( .A1(o_dig_tx_crc_data_out[14]), .A2(remainder_d[15]), .S0(
        n45), .Y(n68) );
  MUX21X2_LVT U49 ( .A1(o_dig_tx_crc_data_out[13]), .A2(remainder_d[14]), .S0(
        n45), .Y(n67) );
  MUX21X2_LVT U50 ( .A1(o_dig_tx_crc_data_out[12]), .A2(remainder_d[13]), .S0(
        n45), .Y(n66) );
  MUX21X2_LVT U51 ( .A1(o_dig_tx_crc_data_out[11]), .A2(remainder_d[12]), .S0(
        n45), .Y(n65) );
  MUX21X2_LVT U52 ( .A1(o_dig_tx_crc_data_out[0]), .A2(remainder_d[1]), .S0(
        n45), .Y(n54) );
  INVX8_LVT U53 ( .A(n44), .Y(n45) );
  INVX4_LVT U54 ( .A(n95), .Y(n44) );
  AND3X1_LVT U55 ( .A1(i_dig_tx_crc_clock_freq_en), .A2(i_dig_tx_crc_en), .A3(
        n100), .Y(n95) );
  INVX2_LVT U56 ( .A(n94), .Y(n50) );
  INVX2_LVT U57 ( .A(n94), .Y(n51) );
  INVX2_LVT U58 ( .A(n94), .Y(n52) );
  INVX1_LVT U59 ( .A(n94), .Y(n53) );
  INVX1_LVT U60 ( .A(i_dig_tx_crc_rst_n), .Y(n94) );
  XNOR2X1_LVT U61 ( .A1(remainder_d[0]), .A2(i_dig_tx_crc_data_in), .Y(n101)
         );
  XOR2X1_LVT U62 ( .A1(n101), .A2(n47), .Y(n46) );
  XOR2X1_LVT U63 ( .A1(n101), .A2(n49), .Y(n48) );
  INVX0_LVT U64 ( .A(i_dig_tx_crc_clock_freq_en), .Y(n98) );
  INVX2_LVT U65 ( .A(n97), .Y(n102) );
  AND4X1_LVT U66 ( .A1(counter[0]), .A2(counter[1]), .A3(n43), .A4(counter[2]), 
        .Y(n96) );
  NAND4X0_LVT U67 ( .A1(counter[4]), .A2(counter[5]), .A3(n42), .A4(n96), .Y(
        n99) );
  NAND3X0_LVT U68 ( .A1(i_dig_tx_crc_clock_freq_en), .A2(i_dig_tx_crc_en), 
        .A3(n99), .Y(n97) );
  AO22X1_LVT U69 ( .A1(N20), .A2(n102), .A3(counter[6]), .A4(n41), .Y(n70) );
  AO22X1_LVT U70 ( .A1(N19), .A2(n102), .A3(n41), .A4(counter[5]), .Y(n71) );
  AO22X1_LVT U71 ( .A1(N18), .A2(n102), .A3(n41), .A4(counter[4]), .Y(n72) );
  AO22X1_LVT U72 ( .A1(N17), .A2(n102), .A3(counter[3]), .A4(n41), .Y(n73) );
  AO22X1_LVT U73 ( .A1(N16), .A2(n102), .A3(n41), .A4(counter[2]), .Y(n74) );
  AO22X1_LVT U74 ( .A1(N15), .A2(n102), .A3(n41), .A4(counter[1]), .Y(n75) );
  AO22X1_LVT U75 ( .A1(N14), .A2(n102), .A3(n41), .A4(counter[0]), .Y(n93) );
  INVX1_LVT U76 ( .A(n99), .Y(n100) );
  AO22X1_LVT U77 ( .A1(remainder_d[1]), .A2(n102), .A3(remainder_d[0]), .A4(
        n41), .Y(n91) );
  INVX1_LVT U78 ( .A(n101), .Y(n103) );
  AO22X1_LVT U79 ( .A1(n102), .A2(n103), .A3(remainder_d[15]), .A4(n41), .Y(
        n76) );
  AO22X1_LVT U80 ( .A1(remainder_d[15]), .A2(n102), .A3(remainder_d[14]), .A4(
        n41), .Y(n77) );
  AO22X1_LVT U81 ( .A1(remainder_d[14]), .A2(n102), .A3(remainder_d[13]), .A4(
        n41), .Y(n78) );
  AO22X1_LVT U82 ( .A1(remainder_d[13]), .A2(n102), .A3(remainder_d[12]), .A4(
        n41), .Y(n79) );
  AO22X1_LVT U83 ( .A1(remainder_d[12]), .A2(n102), .A3(remainder_d[11]), .A4(
        n41), .Y(n80) );
  AO22X1_LVT U84 ( .A1(n102), .A2(n48), .A3(remainder_d[10]), .A4(n41), .Y(n81) );
  AO22X1_LVT U85 ( .A1(remainder_d[10]), .A2(n102), .A3(remainder_d[9]), .A4(
        n41), .Y(n82) );
  AO22X1_LVT U86 ( .A1(remainder_d[9]), .A2(n102), .A3(remainder_d[8]), .A4(
        n41), .Y(n83) );
  AO22X1_LVT U87 ( .A1(remainder_d[8]), .A2(n102), .A3(remainder_d[7]), .A4(
        n41), .Y(n84) );
  AO22X1_LVT U88 ( .A1(remainder_d[7]), .A2(n102), .A3(remainder_d[6]), .A4(
        n41), .Y(n85) );
  AO22X1_LVT U89 ( .A1(remainder_d[6]), .A2(n102), .A3(remainder_d[5]), .A4(
        n41), .Y(n86) );
  AO22X1_LVT U90 ( .A1(remainder_d[5]), .A2(n102), .A3(remainder_d[4]), .A4(
        n41), .Y(n87) );
  AO22X1_LVT U91 ( .A1(n102), .A2(n46), .A3(remainder_d[3]), .A4(n41), .Y(n88)
         );
  AO22X1_LVT U92 ( .A1(remainder_d[3]), .A2(n102), .A3(n41), .A4(
        remainder_d[2]), .Y(n89) );
  AO22X1_LVT U93 ( .A1(remainder_d[2]), .A2(n102), .A3(remainder_d[1]), .A4(
        n41), .Y(n90) );
  NAND3X0_LVT add_57_U14 ( .A1(counter[2]), .A2(counter[3]), .A3(add_57_n2), 
        .Y(add_57_n5) );
  INVX1_LVT add_57_U13 ( .A(add_57_n5), .Y(add_57_n4) );
  NAND2X0_LVT add_57_U12 ( .A1(counter[5]), .A2(add_57_n1), .Y(add_57_n3) );
  INVX0_HVT add_57_U11 ( .A(counter[0]), .Y(N14) );
  XOR2X1_RVT add_57_U10 ( .A1(counter[2]), .A2(add_57_n2), .Y(N16) );
  XNOR2X1_RVT add_57_U9 ( .A1(add_57_n5), .A2(counter[4]), .Y(N18) );
  XOR2X1_LVT add_57_U8 ( .A1(counter[5]), .A2(add_57_n1), .Y(N19) );
  XNOR2X1_LVT add_57_U7 ( .A1(add_57_n6), .A2(counter[3]), .Y(N17) );
  AND2X1_LVT add_57_U6 ( .A1(counter[1]), .A2(counter[0]), .Y(add_57_n2) );
  AND2X1_LVT add_57_U5 ( .A1(counter[4]), .A2(add_57_n4), .Y(add_57_n1) );
  NAND2X0_HVT add_57_U4 ( .A1(counter[2]), .A2(add_57_n2), .Y(add_57_n6) );
  XNOR2X2_LVT add_57_U3 ( .A1(add_57_n3), .A2(counter[6]), .Y(N20) );
  XOR2X1_RVT add_57_U2 ( .A1(counter[1]), .A2(counter[0]), .Y(N15) );
  MUX21X2_LVT U94 ( .A1(o_dig_tx_crc_data_out[8]), .A2(remainder_d[9]), .S0(
        n45), .Y(n62) );
  MUX21X2_LVT U95 ( .A1(o_dig_tx_crc_data_out[3]), .A2(n46), .S0(n45), .Y(n57)
         );
  MUX21X2_LVT U96 ( .A1(o_dig_tx_crc_data_out[1]), .A2(remainder_d[2]), .S0(
        n45), .Y(n55) );
  MUX21X2_LVT U97 ( .A1(o_dig_tx_crc_data_out[10]), .A2(n48), .S0(n45), .Y(n64) );
  MUX21X2_LVT U98 ( .A1(o_dig_tx_crc_data_out[9]), .A2(remainder_d[10]), .S0(
        n45), .Y(n63) );
  MUX21X2_LVT U99 ( .A1(o_dig_tx_crc_data_out[2]), .A2(remainder_d[3]), .S0(
        n45), .Y(n56) );
  MUX21X2_LVT U100 ( .A1(o_dig_tx_crc_data_out[4]), .A2(remainder_d[5]), .S0(
        n45), .Y(n58) );
  MUX21X2_LVT U101 ( .A1(o_dig_tx_crc_data_out[5]), .A2(remainder_d[6]), .S0(
        n45), .Y(n59) );
endmodule


module dig_tx_pow_man_unit ( i_dig_tx_pow_man_unit_spi_pow_en, 
        o_dig_tx_pow_man_unit_spi_sleep_en );
  input i_dig_tx_pow_man_unit_spi_pow_en;
  output o_dig_tx_pow_man_unit_spi_sleep_en;


  NBUFFX2_LVT U1 ( .A(i_dig_tx_pow_man_unit_spi_pow_en), .Y(
        o_dig_tx_pow_man_unit_spi_sleep_en) );
endmodule


module dig_tx_system ( scan_clk, scan_rst, test_mode, SI, SE, SO, 
        i_dig_tx_system_clk32, i_dig_tx_system_clk26, i_dig_tx_system_rst_n, 
        i_dig_tx_system_data_in, i_dig_tx_system_csn, o_dig_tx_system_data_out, 
        o_dig_tx_system_crc_valid, o_dig_tx_system_regfile_valid, 
        o_dig_tx_system_output_valid, o_dig_tx_system_data_slave_out, 
        o_dig_tx_system_done, o_dig_tx_system_miso_ena, o_dig_tx_system_miso
 );
  output [7:0] o_dig_tx_system_data_slave_out;
  input scan_clk, scan_rst, test_mode, SI, SE, i_dig_tx_system_clk32,
         i_dig_tx_system_clk26, i_dig_tx_system_rst_n, i_dig_tx_system_data_in,
         i_dig_tx_system_csn;
  output SO, o_dig_tx_system_data_out, o_dig_tx_system_crc_valid,
         o_dig_tx_system_regfile_valid, o_dig_tx_system_output_valid,
         o_dig_tx_system_done, o_dig_tx_system_miso_ena, o_dig_tx_system_miso;
  wire   i_dig_tx_system_scan_clk32, i_dig_tx_system_scan_clk26,
         i_dig_tx_system_scan_rst_n, n_0_net_, system_gated_clock,
         reg_file_tx_start, n_1_net_, spi_gated_clock, control_unit_spi_clk_en,
         spi_rst_sync, sys_rst_sync, slave_wr_re_en, fifo_wr_enable, n_6_net_,
         fifo_re_en, fifo_empty, fifo_wr_delayed_en, spi_re_en, reg_file_busy,
         reg_file_tx_done, reg_file_tx_mode, reg_file_power_domain,
         control_unit_shr_crc_done, control_unit_data_crc_done,
         control_unit_crc_phy_done, control_unit_serializer_shr_en,
         control_unit_serializer_payload_en, control_unit_serializer_crc_en,
         control_unit_crc_en, control_unit_clock_freq_en, spi_pow_en,
         serializer_data_to_crc, clock_freq_en, n1, n2, n3, n6, n7, n8, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6;
  wire   [7:0] dig_tx_spi_slave_data_out;
  wire   [2:0] slave_addr_out;
  wire   [2:0] fifo_addr_out;
  wire   [7:0] fifo_data_out;
  wire   [7:0] reg_file_spi_out;
  wire   [31:0] reg_file_data_out;
  wire   [15:0] crc_data_out;

  OR2X1_LVT U4 ( .A1(control_unit_spi_clk_en), .A2(test_mode), .Y(n_1_net_) );
  OR2X1_LVT U5 ( .A1(reg_file_tx_start), .A2(test_mode), .Y(n_0_net_) );
  DELLN2X2_HVT U6 ( .A(fifo_wr_enable), .Y(n1) );
  OR2X2_LVT U7 ( .A1(slave_wr_re_en), .A2(fifo_wr_enable), .Y(n_6_net_) );
  INVX4_LVT U8 ( .A(n3), .Y(n2) );
  INVX1_LVT U9 ( .A(sys_rst_sync), .Y(n3) );
  NBUFFX32_LVT U10 ( .A(SE), .Y(n10) );
  DELLN3X2_HVT U11 ( .A(n13), .Y(n11) );
  IBUFFX2_HVT U12 ( .A(n15), .Y(n12) );
  IBUFFX2_HVT U13 ( .A(n12), .Y(n13) );
  IBUFFX2_HVT U14 ( .A(n18), .Y(n14) );
  IBUFFX2_HVT U15 ( .A(n14), .Y(n15) );
  IBUFFX2_HVT U16 ( .A(n14), .Y(n16) );
  DELLN3X2_HVT U17 ( .A(n10), .Y(n17) );
  DELLN3X2_HVT U18 ( .A(n17), .Y(n18) );
  mux2X1_0 U0_mux2X1 ( .IN_0(i_dig_tx_system_clk32), .IN_1(scan_clk), .SEL(
        test_mode), .OUT(i_dig_tx_system_scan_clk32) );
  mux2X1_2 U1_mux2X1 ( .IN_0(i_dig_tx_system_clk26), .IN_1(scan_clk), .SEL(
        test_mode), .OUT(i_dig_tx_system_scan_clk26) );
  mux2X1_1 U4_mux2X1 ( .IN_0(i_dig_tx_system_rst_n), .IN_1(scan_rst), .SEL(
        test_mode), .OUT(i_dig_tx_system_scan_rst_n) );
  dig_tx_clock_gating_0 u_dig_tx_sys_clock_gating ( 
        .i_dig_tx_clock_gating_clk(i_dig_tx_system_scan_clk32), 
        .i_dig_tx_clock_gating_enable(n_0_net_), 
        .o_dig_tx_clock_gating_gated_clock(system_gated_clock) );
  dig_tx_clock_gating_1 u_dig_tx_spi_clock_gating ( 
        .i_dig_tx_clock_gating_clk(i_dig_tx_system_scan_clk26), 
        .i_dig_tx_clock_gating_enable(n_1_net_), 
        .o_dig_tx_clock_gating_gated_clock(spi_gated_clock) );
  dig_tx_rst_sync_test_0 u_dig_tx_rst_sync_spi ( .i_dig_tx_rst_sync_clk(
        spi_gated_clock), .i_dig_tx_rst_sync_rst_n(i_dig_tx_system_scan_rst_n), 
        .o_dig_tx_rst_sync_rst_n(spi_rst_sync), .test_si(n7), .test_so(n6), 
        .test_se(SE) );
  dig_tx_rst_sync_test_1 u_dig_tx_rst_sync_sys ( .i_dig_tx_rst_sync_clk(
        i_dig_tx_system_scan_clk32), .i_dig_tx_rst_sync_rst_n(
        i_dig_tx_system_scan_rst_n), .o_dig_tx_rst_sync_rst_n(sys_rst_sync), 
        .test_si(n6), .test_so(SO), .test_se(n16) );
  spi_slave u_spi_slave ( .i_scan_mode(1'b0), .i_ioring_rst_n(1'b0), .o_dout(
        dig_tx_spi_slave_data_out), .i_status({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .i_sck(spi_gated_clock), .i_sck_neg(spi_gated_clock), .i_csn(
        i_dig_tx_system_csn), .i_mosi(i_dig_tx_system_data_in), .o_miso_ena(
        o_dig_tx_system_miso_ena), .o_miso(o_dig_tx_system_miso), .o_rf_addr({
        SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, 
        SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, slave_addr_out}), 
        .i_rf_din(o_dig_tx_system_data_slave_out), .o_rf_wre(slave_wr_re_en), 
        .fifo_wr_enable(fifo_wr_enable) );
  dig_tx_asyn_fifo_FIFO_DEPTH8_REGISTER_WIDTH8_ADDRESS_WIDTH3_VALID_WIDTH1_test_1 u_dig_tx_asyn_fifo_read ( 
        .i_dig_tx_asyn_fifo_clk26(spi_gated_clock), .i_dig_tx_asyn_fifo_clk32(
        i_dig_tx_system_scan_clk32), .i_dig_tx_asyn_fifo_wr_rst_n(spi_rst_sync), .i_dig_tx_asyn_fifo_re_rst_n(n2), .i_dig_tx_asyn_fifo_wr_en(n_6_net_), 
        .i_dig_tx_asyn_fifo_re_en(fifo_re_en), .i_dig_tx_asyn_fifo_data_in({
        1'b0, slave_addr_out, dig_tx_spi_slave_data_out}), 
        .o_dig_tx_asyn_fifo_data_out({SYNOPSYS_UNCONNECTED_6, fifo_addr_out, 
        fifo_data_out}), .o_dig_tx_asyn_fifo_empty(fifo_empty), .test_si(SI), 
        .test_so(n8), .test_se(n10) );
  dig_tx_pulse_delayed u_dig_tx_pulse_delayed ( .i_dix_pulse_delayed_clk32(
        i_dig_tx_system_scan_clk32), .i_dix_pulse_delayed_rst_n(n2), 
        .i_dix_pulse_delayed_din(n1), .o_dix_pulse_d0(fifo_wr_delayed_en) );
  dig_tx_asyn_fifo_FIFO_DEPTH3_REGISTER_WIDTH8_test_1 u_dig_tx_asyn_fifo_write ( 
        .i_dig_tx_asyn_fifo_clk26(i_dig_tx_system_scan_clk32), 
        .i_dig_tx_asyn_fifo_clk32(spi_gated_clock), 
        .i_dig_tx_asyn_fifo_wr_rst_n(n2), .i_dig_tx_asyn_fifo_re_rst_n(
        spi_rst_sync), .i_dig_tx_asyn_fifo_wr_en(fifo_wr_delayed_en), 
        .i_dig_tx_asyn_fifo_re_en(1'b1), .i_dig_tx_asyn_fifo_data_in(
        reg_file_spi_out), .o_dig_tx_asyn_fifo_data_out(
        o_dig_tx_system_data_slave_out), .test_si(n8), .test_so(n7), .test_se(
        n11) );
  dig_tx_reg_file_REGISTER_DEPTH5_REGISTER_WIDTH8_PAYLOAD_WIDTH32 u_dig_tx_reg_file ( 
        .i_dig_tx_reg_file_clk(i_dig_tx_system_scan_clk32), 
        .i_dig_tx_reg_file_rst_n(n2), .i_dig_tx_reg_file_data_in(fifo_data_out), .i_dig_tx_reg_file_addr_in(fifo_addr_out), .i_dig_tx_reg_file_spi_re_en(
        spi_re_en), .i_dig_tx_reg_file_data_in_en(fifo_re_en), 
        .i_dig_tx_reg_file_tx_busy(reg_file_busy), .i_dig_tx_reg_file_tx_done(
        reg_file_tx_done), .o_dig_tx_reg_file_valid_en(
        o_dig_tx_system_regfile_valid), .o_dig_tx_reg_file_data_out(
        reg_file_data_out), .o_dig_tx_reg_file_tx_start(reg_file_tx_start), 
        .o_dig_tx_reg_file_tx_mode(reg_file_tx_mode), 
        .o_dig_tx_reg_file_power_domain(reg_file_power_domain), 
        .o_dig_tx_reg_file_data_slave_out(reg_file_spi_out), 
        .o_dig_tx_reg_file_sys_tx_done(o_dig_tx_system_done) );
  dig_tx_control_unit u_dig_tx_control_unit ( .i_dig_tx_control_unit_clk(
        i_dig_tx_system_scan_clk32), .i_dig_tx_control_unit_rst_n(n2), 
        .i_dig_tx_control_unit_csn(i_dig_tx_system_csn), 
        .i_dig_tx_control_unit_tx_start(reg_file_tx_start), 
        .i_dig_tx_control_unit_tx_mode(reg_file_tx_mode), 
        .i_dig_tx_control_unit_power_domain(reg_file_power_domain), 
        .i_dig_tx_control_unit_regfile_valid_en(o_dig_tx_system_regfile_valid), 
        .i_dig_tx_control_unit_shr_crc_done(control_unit_shr_crc_done), 
        .i_dig_tx_control_unit_data_crc_done(control_unit_data_crc_done), 
        .i_dig_tx_control_unit_crc_phy_done(control_unit_crc_phy_done), 
        .o_dig_tx_control_unit_serializer_shr_en(
        control_unit_serializer_shr_en), 
        .o_dig_tx_control_unit_serializer_payload_en(
        control_unit_serializer_payload_en), 
        .o_dig_tx_control_unit_serializer_crc_en(
        control_unit_serializer_crc_en), .o_dig_tx_control_unit_crc_en(
        control_unit_crc_en), .o_dig_tx_control_unit_clock_mode_en(
        control_unit_clock_freq_en), .o_dig_tx_control_unit_tx_busy(
        reg_file_busy), .o_dig_tx_control_unit_output_valid(
        o_dig_tx_system_output_valid), .o_dig_tx_control_unit_tx_done(
        reg_file_tx_done), .i_dig_tx_control_unit_data_fifo_empty(fifo_empty), 
        .o_dig_tx_control_unit_fifo_re_en(fifo_re_en), 
        .o_dig_tx_control_unit_spi_pow_en(spi_pow_en), 
        .o_dig_tx_control_unit_spi_re_en(spi_re_en), 
        .o_dig_tx_control_unit_spi_clk_en(control_unit_spi_clk_en) );
  dig_tx_serializer_32_16_24_55557a u_dig_tx_serializer ( 
        .i_dig_tx_serializer_clk(system_gated_clock), 
        .i_dig_tx_serializer_rst_n(n2), .i_dig_tx_serializer_reg_data_in(
        reg_file_data_out), .i_dig_tx_serializer_crc_out(crc_data_out), 
        .i_dig_tx_serializer_clock_mode_en(control_unit_clock_freq_en), 
        .i_dig_tx_serializer_shr_en(control_unit_serializer_shr_en), 
        .i_dig_tx_serializer_payload_en(control_unit_serializer_payload_en), 
        .i_dig_tx_serializer_crc_en(control_unit_serializer_crc_en), 
        .o_dig_tx_serializer_crc_in(serializer_data_to_crc), 
        .o_dig_tx_serializer_phy_out(o_dig_tx_system_data_out), 
        .o_dig_tx_serializer_shr_crc_done(control_unit_shr_crc_done), 
        .o_dig_tx_serializer_data_crc_done(control_unit_data_crc_done), 
        .o_dig_tx_serializer_crc_phy_done(control_unit_crc_phy_done), 
        .o_dig_tx_serializer_clock_freq_en(clock_freq_en) );
  dig_tx_crc_REGISTER_WIDTH16_INPUT_LENGTH56 u_dig_tx_crc ( .i_dig_tx_crc_clk(
        system_gated_clock), .i_dig_tx_crc_rst_n(n2), .i_dig_tx_crc_data_in(
        serializer_data_to_crc), .i_dig_tx_crc_en(control_unit_crc_en), 
        .i_dig_tx_crc_clock_freq_en(clock_freq_en), .o_dig_tx_crc_data_out(
        crc_data_out), .o_dig_tx_crc_valid(o_dig_tx_system_crc_valid) );
  dig_tx_pow_man_unit u_dig_tx_pow_man_unit ( 
        .i_dig_tx_pow_man_unit_spi_pow_en(spi_pow_en) );
endmodule

