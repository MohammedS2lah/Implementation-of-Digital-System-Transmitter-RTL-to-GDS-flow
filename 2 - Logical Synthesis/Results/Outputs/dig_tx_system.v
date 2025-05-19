/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Wed May 14 22:02:00 2025
/////////////////////////////////////////////////////////////


module dig_tx_clock_gating_0 ( i_dig_tx_clock_gating_clk, 
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


module dig_tx_rst_sync_0 ( i_dig_tx_rst_sync_clk, i_dig_tx_rst_sync_rst_n, 
        o_dig_tx_rst_sync_rst_n );
  input i_dig_tx_rst_sync_clk, i_dig_tx_rst_sync_rst_n;
  output o_dig_tx_rst_sync_rst_n;
  wire   sync_flops_0_;

  DFFARX1_LVT sync_flops_reg_0_ ( .D(1'b1), .CLK(i_dig_tx_rst_sync_clk), 
        .RSTB(i_dig_tx_rst_sync_rst_n), .Q(sync_flops_0_) );
  DFFARX1_HVT sync_flops_reg_1_ ( .D(sync_flops_0_), .CLK(
        i_dig_tx_rst_sync_clk), .RSTB(i_dig_tx_rst_sync_rst_n), .Q(
        o_dig_tx_rst_sync_rst_n) );
endmodule


module dig_tx_rst_sync_1 ( i_dig_tx_rst_sync_clk, i_dig_tx_rst_sync_rst_n, 
        o_dig_tx_rst_sync_rst_n );
  input i_dig_tx_rst_sync_clk, i_dig_tx_rst_sync_rst_n;
  output o_dig_tx_rst_sync_rst_n;
  wire   sync_flops_0_;

  DFFARX1_LVT sync_flops_reg_0_ ( .D(1'b1), .CLK(i_dig_tx_rst_sync_clk), 
        .RSTB(i_dig_tx_rst_sync_rst_n), .Q(sync_flops_0_) );
  DFFARX1_LVT sync_flops_reg_1_ ( .D(sync_flops_0_), .CLK(
        i_dig_tx_rst_sync_clk), .RSTB(i_dig_tx_rst_sync_rst_n), .Q(
        o_dig_tx_rst_sync_rst_n) );
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
  wire   N40, csn_scn, csn_d, csn_d_scn, miso_rde_strt_nxt, N137, N138, N139,
         N154, N155, N162, N163, N164, N165, N166, N167, N168, N169, N198,
         N199, N200, N201, N202, N203, N204, N205, N206, N207, N208, N239,
         N240, N241, N242, N243, N244, N245, N246, N284, N285, N286, N291,
         N292, N293, n65, n66, n67, n75, n76, n77, n79, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, net15748, net15749,
         net15752, net15756, net15758, net15771, net15781, net15945, net17531,
         net17536, net18016, net22448, net15753, net15742, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n400, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n62, n63,
         n64, n68, n69, n70, n71, n72, n73, n74, n78, n80, n129, n130, n131,
         n132, n133, n134, n135, n136, n1370, n1380, n1390, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n1540, n1550, n156, n157, n158, n159, n160, n161, n1620, n1630, n1640,
         n1650, n1660, n1670, n1680, n1690, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183;
  wire   [2:0] state_tx;
  wire   [15:1] status_reg;
  wire   [2:0] state_reg;
  wire   [7:0] rf_add_reg;

  DFFASX1_LVT csn_d_reg ( .D(1'b0), .CLK(i_sck), .SETB(n182), .Q(csn_d) );
  DFFARX1_LVT state_reg_reg_2_ ( .D(n29), .CLK(i_sck), .RSTB(n182), .Q(
        state_reg[2]), .QN(n17) );
  DFFNARX1_LVT state_tx_reg_2_ ( .D(N293), .CLK(i_sck_neg), .RSTB(n141), .Q(
        state_tx[2]), .QN(net15945) );
  DFFARX1_LVT state_reg_reg_1_ ( .D(n30), .CLK(i_sck), .RSTB(n182), .Q(
        state_reg[1]), .QN(n1370) );
  DFFARX1_LVT state_reg_reg_0_ ( .D(N291), .CLK(i_sck), .RSTB(n182), .Q(
        state_reg[0]), .QN(n15) );
  DFFNARX1_LVT miso_reg_reg_7_ ( .D(n104), .CLK(i_sck_neg), .RSTB(n141), .Q(
        net22448), .QN(n3) );
  DFFARX1_LVT rf_add_reg_reg_0_ ( .D(n95), .CLK(i_sck), .RSTB(n1390), .Q(
        rf_add_reg[0]) );
  DFFARX1_LVT rf_add_reg_reg_1_ ( .D(n94), .CLK(i_sck), .RSTB(n1390), .Q(
        rf_add_reg[1]) );
  DFFARX1_LVT rf_add_reg_reg_2_ ( .D(n93), .CLK(i_sck), .RSTB(n140), .Q(
        rf_add_reg[2]) );
  DFFARX1_LVT rf_add_reg_reg_3_ ( .D(n92), .CLK(i_sck), .RSTB(n182), .Q(
        rf_add_reg[3]) );
  DFFARX1_LVT rf_add_reg_reg_4_ ( .D(n91), .CLK(i_sck), .RSTB(n1390), .Q(
        rf_add_reg[4]) );
  DFFARX1_LVT rf_add_reg_reg_5_ ( .D(n90), .CLK(i_sck), .RSTB(n1390), .Q(
        rf_add_reg[5]) );
  DFFARX1_LVT rf_add_reg_reg_6_ ( .D(n89), .CLK(i_sck), .RSTB(n1390), .Q(
        rf_add_reg[6]) );
  DFFARX1_LVT rf_add_reg_reg_7_ ( .D(n88), .CLK(i_sck), .RSTB(n1390), .Q(
        rf_add_reg[7]) );
  OR2X1_LVT U3 ( .A1(i_scan_mode), .A2(i_csn), .Y(o_miso_ena) );
  DFFARX1_LVT mosi_reg_reg_6_ ( .D(n97), .CLK(i_sck), .RSTB(n182), .Q(n179), 
        .QN(n77) );
  DFFNARX1_RVT status_reg_reg_1_ ( .D(n128), .CLK(i_sck_neg), .RSTB(n140), .Q(
        status_reg[1]) );
  DFFNARX1_RVT status_reg_reg_2_ ( .D(n127), .CLK(i_sck_neg), .RSTB(n140), .Q(
        status_reg[2]) );
  DFFNARX1_RVT status_reg_reg_3_ ( .D(n126), .CLK(i_sck_neg), .RSTB(n140), .Q(
        status_reg[3]) );
  DFFNARX1_RVT status_reg_reg_4_ ( .D(n125), .CLK(i_sck_neg), .RSTB(n140), .Q(
        status_reg[4]) );
  DFFNARX1_RVT status_reg_reg_5_ ( .D(n124), .CLK(i_sck_neg), .RSTB(n140), .Q(
        status_reg[5]) );
  DFFNARX1_RVT status_reg_reg_6_ ( .D(n123), .CLK(i_sck_neg), .RSTB(n1390), 
        .Q(status_reg[6]) );
  DFFNARX1_RVT status_reg_reg_7_ ( .D(n122), .CLK(i_sck_neg), .RSTB(n140), .Q(
        status_reg[7]) );
  DFFNARX1_RVT status_reg_reg_8_ ( .D(n121), .CLK(i_sck_neg), .RSTB(n1390), 
        .Q(status_reg[8]) );
  DFFNARX1_RVT status_reg_reg_9_ ( .D(n120), .CLK(i_sck_neg), .RSTB(n1390), 
        .Q(status_reg[9]) );
  DFFNARX1_RVT status_reg_reg_10_ ( .D(n119), .CLK(i_sck_neg), .RSTB(n1390), 
        .Q(status_reg[10]) );
  DFFNARX1_RVT status_reg_reg_11_ ( .D(n118), .CLK(i_sck_neg), .RSTB(n140), 
        .Q(status_reg[11]) );
  DFFNARX1_RVT status_reg_reg_12_ ( .D(n117), .CLK(i_sck_neg), .RSTB(n1390), 
        .Q(status_reg[12]) );
  DFFNARX1_RVT status_reg_reg_13_ ( .D(n116), .CLK(i_sck_neg), .RSTB(n1390), 
        .Q(status_reg[13]) );
  DFFNARX1_RVT status_reg_reg_14_ ( .D(n115), .CLK(i_sck_neg), .RSTB(n140), 
        .Q(status_reg[14]) );
  DFFARX2_LVT bit_cnt_reg_reg_1_ ( .D(n112), .CLK(i_sck), .RSTB(n183), .Q(n7), 
        .QN(n66) );
  DFFNARX1_LVT miso_reg_reg_6_ ( .D(n105), .CLK(i_sck_neg), .RSTB(n141), .Q(
        n23) );
  DFFNARX1_LVT miso_reg_reg_2_ ( .D(n109), .CLK(i_sck_neg), .RSTB(n141), .Q(
        n25) );
  DFFNARX1_LVT miso_reg_reg_5_ ( .D(n106), .CLK(i_sck_neg), .RSTB(n141), .Q(
        n16) );
  DFFNARX1_LVT miso_reg_reg_4_ ( .D(n107), .CLK(i_sck_neg), .RSTB(n141), .Q(
        n22) );
  DFFNARX1_LVT miso_reg_reg_3_ ( .D(n108), .CLK(i_sck_neg), .RSTB(n141), .Q(
        n24) );
  DFFNARX2_LVT miso_rde_strt_reg ( .D(miso_rde_strt_nxt), .CLK(i_sck_neg), 
        .RSTB(n140), .Q(n1), .QN(n81) );
  DFFNARX1_LVT miso_reg_reg_1_ ( .D(n110), .CLK(i_sck_neg), .RSTB(n141), .Q(
        n21) );
  DFFARX1_LVT mosi_reg_reg_0_ ( .D(n103), .CLK(i_sck), .RSTB(n1390), .Q(n175), 
        .QN(n87) );
  DFFARX1_LVT mosi_reg_reg_2_ ( .D(n101), .CLK(i_sck), .RSTB(n140), .Q(n177), 
        .QN(n85) );
  DFFARX1_LVT mosi_reg_reg_1_ ( .D(n102), .CLK(i_sck), .RSTB(n1390), .Q(n176), 
        .QN(n86) );
  DFFNARX1_LVT flag_reg_reg ( .D(n79), .CLK(i_sck_neg), .RSTB(n140), .Q(
        net15749), .QN(n82) );
  DFFNARX1_LVT state_tx_reg_1_ ( .D(N292), .CLK(i_sck_neg), .RSTB(n140), .Q(
        state_tx[1]), .QN(net15752) );
  DFFNARX1_LVT status_reg_reg_15_ ( .D(n114), .CLK(i_sck_neg), .RSTB(n140), 
        .Q(status_reg[15]) );
  DFFNARX1_LVT state_tx_reg_0_ ( .D(N291), .CLK(i_sck_neg), .RSTB(n140), .Q(
        state_tx[0]), .QN(net15748) );
  DFFARX1_LVT mosi_reg_reg_3_ ( .D(n100), .CLK(i_sck), .RSTB(n182), .Q(n20), 
        .QN(n84) );
  DFFARX1_LVT bit_cnt_reg_reg_0_ ( .D(n113), .CLK(i_sck), .RSTB(n183), .Q(n48), 
        .QN(n65) );
  DFFARX1_LVT bit_cnt_reg_reg_2_ ( .D(n111), .CLK(i_sck), .RSTB(n183), .Q(n49), 
        .QN(n67) );
  DFFARX1_LVT mosi_reg_reg_4_ ( .D(n99), .CLK(i_sck), .RSTB(n1390), .QN(n75)
         );
  DFFARX1_LVT mosi_reg_reg_5_ ( .D(n98), .CLK(i_sck), .RSTB(n140), .Q(n180), 
        .QN(n76) );
  DFFARX1_LVT mosi_reg_reg_7_ ( .D(n96), .CLK(i_sck), .RSTB(n182), .Q(n178), 
        .QN(n83) );
  INVX1_LVT U4 ( .A(n1), .Y(n2) );
  INVX1_LVT U5 ( .A(n3), .Y(n4) );
  NAND2X0_HVT U6 ( .A1(n69), .A2(n59), .Y(n5) );
  INVX1_LVT U7 ( .A(n178), .Y(n6) );
  INVX1_LVT U8 ( .A(n7), .Y(n8) );
  AND3X2_RVT U9 ( .A1(state_reg[0]), .A2(n1630), .A3(n17), .Y(n62) );
  INVX0_LVT U10 ( .A(n1380), .Y(n1630) );
  NAND2X0_HVT U11 ( .A1(n146), .A2(n156), .Y(n147) );
  INVX2_LVT U12 ( .A(n83), .Y(n47) );
  AND2X4_LVT U13 ( .A1(n6), .A2(n176), .Y(n68) );
  AND3X2_LVT U14 ( .A1(n29), .A2(n1660), .A3(N291), .Y(fifo_wr_enable) );
  NAND3X2_HVT U15 ( .A1(n156), .A2(n49), .A3(n48), .Y(n1690) );
  INVX2_LVT U16 ( .A(n66), .Y(n156) );
  INVX1_LVT U17 ( .A(n81), .Y(net15756) );
  NAND3X0_LVT U18 ( .A1(net15771), .A2(net15752), .A3(n172), .Y(n174) );
  INVX1_LVT U19 ( .A(n67), .Y(n1550) );
  INVX1_LVT U20 ( .A(n65), .Y(n153) );
  NAND3X0_LVT U21 ( .A1(n156), .A2(n1550), .A3(n153), .Y(n1380) );
  INVX1_LVT U22 ( .A(n75), .Y(n181) );
  OR2X1_LVT U23 ( .A1(n148), .A2(n1690), .Y(n28) );
  NAND2X0_LVT U24 ( .A1(n174), .A2(n23), .Y(n38) );
  NAND2X0_LVT U25 ( .A1(n60), .A2(n16), .Y(n37) );
  AO22X1_LVT U26 ( .A1(status_reg[15]), .A2(net15945), .A3(state_tx[2]), .A4(
        n10), .Y(n9) );
  AO22X1_LVT U27 ( .A1(i_rf_din[7]), .A2(net15756), .A3(n81), .A4(n4), .Y(n10)
         );
  NAND2X0_LVT U28 ( .A1(n9), .A2(net15753), .Y(net15742) );
  NAND4X0_LVT U29 ( .A1(net15742), .A2(n11), .A3(n12), .A4(n13), .Y(o_miso) );
  INVX1_LVT U30 ( .A(net15758), .Y(net15753) );
  NAND2X0_LVT U31 ( .A1(state_tx[0]), .A2(net15752), .Y(net15758) );
  NAND3X0_LVT U32 ( .A1(net17536), .A2(n14), .A3(status_reg[15]), .Y(n11) );
  AOI21X1_LVT U33 ( .A1(state_tx[1]), .A2(net18016), .A3(state_tx[0]), .Y(
        net17536) );
  NAND2X0_LVT U34 ( .A1(net15945), .A2(net15752), .Y(n14) );
  NAND4X0_LVT U35 ( .A1(net15945), .A2(net15748), .A3(status_reg[15]), .A4(
        net15749), .Y(n12) );
  NAND2X0_LVT U36 ( .A1(i_status[15]), .A2(net17531), .Y(n13) );
  AND3X1_LVT U37 ( .A1(n82), .A2(net15781), .A3(net15748), .Y(net17531) );
  NOR2X1_LVT U38 ( .A1(n148), .A2(n1690), .Y(n18) );
  AND2X1_LVT U39 ( .A1(n130), .A2(n129), .Y(n19) );
  XOR2X1_LVT U40 ( .A1(n147), .A2(n50), .Y(n111) );
  AND3X1_LVT U41 ( .A1(n179), .A2(n178), .A3(n43), .Y(n26) );
  INVX1_LVT U42 ( .A(n1690), .Y(n149) );
  NAND2X0_HVT U43 ( .A1(net15945), .A2(net15752), .Y(net15771) );
  NAND2X0_HVT U44 ( .A1(state_reg[2]), .A2(n1370), .Y(n70) );
  NAND3X0_LVT U45 ( .A1(n19), .A2(n80), .A3(n78), .Y(n30) );
  NAND2X0_LVT U46 ( .A1(n69), .A2(n59), .Y(n27) );
  MUX21X1_HVT U47 ( .A1(rf_add_reg[6]), .A2(n179), .S0(n51), .Y(N204) );
  MUX21X1_HVT U48 ( .A1(n180), .A2(n179), .S0(n143), .Y(n97) );
  NAND4X0_LVT U49 ( .A1(n132), .A2(n133), .A3(n134), .A4(n135), .Y(n29) );
  AO222X1_RVT U50 ( .A1(N165), .A2(n58), .A3(n53), .A4(n20), .A5(rf_add_reg[3]), .A6(n28), .Y(n92) );
  AO222X1_RVT U51 ( .A1(N166), .A2(n58), .A3(n53), .A4(n181), .A5(
        rf_add_reg[4]), .A6(n28), .Y(n91) );
  AO222X1_RVT U52 ( .A1(N168), .A2(n58), .A3(n53), .A4(n179), .A5(
        rf_add_reg[6]), .A6(n28), .Y(n89) );
  AO222X1_RVT U53 ( .A1(N162), .A2(n58), .A3(n53), .A4(n175), .A5(
        rf_add_reg[0]), .A6(n28), .Y(n95) );
  AO222X1_RVT U54 ( .A1(N163), .A2(n58), .A3(n53), .A4(n176), .A5(
        rf_add_reg[1]), .A6(n28), .Y(n94) );
  AO222X1_RVT U55 ( .A1(N164), .A2(n58), .A3(n53), .A4(n177), .A5(
        rf_add_reg[2]), .A6(n28), .Y(n93) );
  AO222X1_RVT U56 ( .A1(N169), .A2(n58), .A3(n53), .A4(n47), .A5(rf_add_reg[7]), .A6(n28), .Y(n88) );
  INVX0_LVT U57 ( .A(net15945), .Y(net18016) );
  NAND2X0_LVT U58 ( .A1(n60), .A2(n23), .Y(n31) );
  NAND2X0_RVT U59 ( .A1(n174), .A2(net22448), .Y(n32) );
  NAND2X0_LVT U60 ( .A1(i_rf_din[6]), .A2(n52), .Y(n33) );
  NAND3X0_LVT U61 ( .A1(n33), .A2(n32), .A3(n31), .Y(n104) );
  INVX0_LVT U62 ( .A(n30), .Y(n1660) );
  AND3X1_LVT U63 ( .A1(n76), .A2(n75), .A3(n47), .Y(n1620) );
  NAND2X0_LVT U64 ( .A1(n60), .A2(n24), .Y(n34) );
  NAND2X0_LVT U65 ( .A1(n174), .A2(n22), .Y(n35) );
  NAND2X0_LVT U66 ( .A1(i_rf_din[3]), .A2(n52), .Y(n36) );
  NAND3X0_LVT U67 ( .A1(n36), .A2(n35), .A3(n34), .Y(n107) );
  AND2X1_LVT U68 ( .A1(n173), .A2(net15756), .Y(n52) );
  NAND2X0_LVT U69 ( .A1(i_rf_din[5]), .A2(n52), .Y(n39) );
  NAND3X0_LVT U70 ( .A1(n37), .A2(n38), .A3(n39), .Y(n105) );
  NAND2X0_LVT U71 ( .A1(n60), .A2(n25), .Y(n400) );
  NAND2X0_LVT U72 ( .A1(n174), .A2(n24), .Y(n41) );
  NAND2X0_LVT U73 ( .A1(i_rf_din[2]), .A2(n52), .Y(n42) );
  NAND3X0_LVT U74 ( .A1(n42), .A2(n41), .A3(n400), .Y(n108) );
  AND2X1_LVT U75 ( .A1(n76), .A2(n84), .Y(n43) );
  AND3X1_LVT U76 ( .A1(n179), .A2(n178), .A3(n43), .Y(n59) );
  NAND2X0_LVT U77 ( .A1(n60), .A2(n21), .Y(n44) );
  NAND2X0_LVT U78 ( .A1(n174), .A2(n25), .Y(n45) );
  NAND2X0_LVT U79 ( .A1(i_rf_din[1]), .A2(n52), .Y(n46) );
  NAND3X0_LVT U80 ( .A1(n46), .A2(n45), .A3(n44), .Y(n109) );
  AND2X1_LVT U81 ( .A1(n18), .A2(n15), .Y(n53) );
  NBUFFX2_HVT U82 ( .A(n149), .Y(n51) );
  AND2X1_HVT U83 ( .A1(n63), .A2(n71), .Y(n54) );
  AND2X1_HVT U84 ( .A1(state_reg[0]), .A2(n63), .Y(n57) );
  AND2X1_HVT U85 ( .A1(n173), .A2(n2), .Y(n60) );
  AO222X1_RVT U86 ( .A1(N167), .A2(n58), .A3(n53), .A4(n180), .A5(
        rf_add_reg[5]), .A6(n28), .Y(n90) );
  AND2X1_RVT U87 ( .A1(state_reg[2]), .A2(n1370), .Y(n63) );
  AND3X1_RVT U88 ( .A1(n75), .A2(n84), .A3(n76), .Y(n64) );
  XNOR2X1_RVT U89 ( .A1(n48), .A2(n143), .Y(n113) );
  INVX1_LVT U90 ( .A(n49), .Y(n50) );
  INVX2_LVT U91 ( .A(csn_scn), .Y(n1390) );
  INVX2_LVT U92 ( .A(csn_scn), .Y(n140) );
  INVX1_LVT U93 ( .A(csn_scn), .Y(n141) );
  AO21X1_HVT U94 ( .A1(n172), .A2(net15758), .A3(n1380), .Y(n170) );
  INVX2_LVT U95 ( .A(n144), .Y(n143) );
  AND3X1_LVT U96 ( .A1(n71), .A2(n1370), .A3(n17), .Y(n55) );
  NOR2X0_LVT U97 ( .A1(n1680), .A2(n56), .Y(n1670) );
  AND3X1_RVT U98 ( .A1(n171), .A2(n172), .A3(n82), .Y(n56) );
  AND2X1_LVT U99 ( .A1(state_reg[0]), .A2(n18), .Y(n58) );
  XOR2X1_HVT U100 ( .A1(n145), .A2(n8), .Y(n112) );
  AND2X1_LVT U101 ( .A1(state_reg[1]), .A2(n62), .Y(o_rf_wre) );
  XNOR2X1_HVT U102 ( .A1(state_reg[1]), .A2(state_reg[2]), .Y(n148) );
  AOI21X1_LVT U103 ( .A1(n85), .A2(n86), .A3(n181), .Y(n69) );
  MUX21X1_LVT U104 ( .A1(i_csn), .A2(N40), .S0(i_scan_mode), .Y(csn_scn) );
  MUX21X1_LVT U105 ( .A1(csn_d), .A2(N40), .S0(i_scan_mode), .Y(csn_d_scn) );
  INVX1_LVT U106 ( .A(i_ioring_rst_n), .Y(N40) );
  MUX21X1_HVT U107 ( .A1(n179), .A2(n47), .S0(n143), .Y(n96) );
  MUX21X1_HVT U108 ( .A1(rf_add_reg[7]), .A2(n47), .S0(n51), .Y(N205) );
  AND2X1_HVT U109 ( .A1(o_rf_wre), .A2(n47), .Y(o_dout[7]) );
  AO222X1_LVT U110 ( .A1(N239), .A2(n57), .A3(N198), .A4(n54), .A5(
        rf_add_reg[0]), .A6(n70), .Y(o_rf_addr[0]) );
  AO222X1_LVT U111 ( .A1(N240), .A2(n57), .A3(N199), .A4(n54), .A5(
        rf_add_reg[1]), .A6(n70), .Y(o_rf_addr[1]) );
  AO222X1_LVT U112 ( .A1(N241), .A2(n57), .A3(N200), .A4(n54), .A5(
        rf_add_reg[2]), .A6(n70), .Y(o_rf_addr[2]) );
  AO222X1_LVT U113 ( .A1(N242), .A2(n57), .A3(N201), .A4(n54), .A5(
        rf_add_reg[3]), .A6(n70), .Y(o_rf_addr[3]) );
  AO222X1_LVT U114 ( .A1(N243), .A2(n57), .A3(N202), .A4(n54), .A5(
        rf_add_reg[4]), .A6(n70), .Y(o_rf_addr[4]) );
  AO222X1_LVT U115 ( .A1(N244), .A2(n57), .A3(N203), .A4(n54), .A5(
        rf_add_reg[5]), .A6(n70), .Y(o_rf_addr[5]) );
  AO222X1_LVT U116 ( .A1(N245), .A2(n57), .A3(N204), .A4(n54), .A5(
        rf_add_reg[6]), .A6(n70), .Y(o_rf_addr[6]) );
  AO222X1_LVT U117 ( .A1(N246), .A2(n57), .A3(N205), .A4(n54), .A5(
        rf_add_reg[7]), .A6(n70), .Y(o_rf_addr[7]) );
  AO221X1_LVT U118 ( .A1(N137), .A2(n55), .A3(N284), .A4(state_reg[0]), .A5(
        n72), .Y(N291) );
  AO222X1_LVT U119 ( .A1(state_reg[0]), .A2(n73), .A3(N206), .A4(n74), .A5(
        N206), .A6(n63), .Y(n72) );
  AND2X1_LVT U120 ( .A1(state_reg[1]), .A2(n17), .Y(n74) );
  NAND2X0_LVT U121 ( .A1(n1370), .A2(n17), .Y(n73) );
  NAND4X0_LVT U122 ( .A1(n78), .A2(n80), .A3(n129), .A4(n130), .Y(N292) );
  NAND3X0_LVT U123 ( .A1(state_reg[2]), .A2(n71), .A3(N207), .Y(n130) );
  NAND2X0_LVT U124 ( .A1(state_reg[1]), .A2(n131), .Y(n129) );
  OR3X1_LVT U125 ( .A1(state_reg[2]), .A2(state_reg[0]), .A3(N154), .Y(n131)
         );
  NAND3X0_LVT U126 ( .A1(N285), .A2(n17), .A3(state_reg[0]), .Y(n80) );
  NAND2X0_LVT U127 ( .A1(N138), .A2(n55), .Y(n78) );
  NAND4X0_LVT U128 ( .A1(n132), .A2(n133), .A3(n134), .A4(n135), .Y(N293) );
  NAND3X0_LVT U129 ( .A1(N155), .A2(n71), .A3(state_reg[1]), .Y(n135) );
  NAND2X0_LVT U130 ( .A1(state_reg[2]), .A2(n136), .Y(n134) );
  OR3X1_LVT U131 ( .A1(state_reg[1]), .A2(state_reg[0]), .A3(N208), .Y(n136)
         );
  NAND3X0_LVT U132 ( .A1(N286), .A2(n1370), .A3(state_reg[0]), .Y(n133) );
  NAND2X0_LVT U133 ( .A1(N139), .A2(n55), .Y(n132) );
  INVX1_LVT U134 ( .A(state_reg[0]), .Y(n71) );
  AO22X1_HVT U135 ( .A1(state_tx[1]), .A2(state_tx[2]), .A3(state_tx[0]), .A4(
        net15771), .Y(n1680) );
  NAND2X0_HVT U136 ( .A1(n144), .A2(n48), .Y(n145) );
  NAND2X0_LVT U137 ( .A1(n69), .A2(n26), .Y(n150) );
  NAND2X0_LVT U138 ( .A1(n62), .A2(n5), .Y(n142) );
  MUX21X1_LVT U139 ( .A1(n142), .A2(n17), .S0(state_reg[1]), .Y(n144) );
  MUX21X1_LVT U140 ( .A1(i_mosi), .A2(n175), .S0(n143), .Y(n103) );
  INVX1_LVT U141 ( .A(csn_scn), .Y(n182) );
  MUX21X1_LVT U142 ( .A1(n175), .A2(n176), .S0(n143), .Y(n102) );
  MUX21X1_LVT U143 ( .A1(n176), .A2(n177), .S0(n143), .Y(n101) );
  MUX21X1_LVT U144 ( .A1(n177), .A2(n20), .S0(n143), .Y(n100) );
  MUX21X1_LVT U145 ( .A1(n20), .A2(n181), .S0(n143), .Y(n99) );
  MUX21X1_LVT U146 ( .A1(n181), .A2(n180), .S0(n143), .Y(n98) );
  INVX1_LVT U147 ( .A(csn_d_scn), .Y(n183) );
  INVX1_LVT U148 ( .A(n145), .Y(n146) );
  NAND2X0_LVT U149 ( .A1(state_reg[2]), .A2(n151), .Y(n158) );
  INVX1_LVT U150 ( .A(n158), .Y(N155) );
  NAND3X0_LVT U151 ( .A1(n156), .A2(n1550), .A3(n153), .Y(n151) );
  NAND2X0_LVT U152 ( .A1(n1370), .A2(n151), .Y(N154) );
  NAND2X0_LVT U153 ( .A1(n15), .A2(n1380), .Y(N206) );
  MUX21X1_LVT U154 ( .A1(rf_add_reg[7]), .A2(N169), .S0(n51), .Y(N246) );
  MUX21X1_LVT U155 ( .A1(rf_add_reg[6]), .A2(N168), .S0(n51), .Y(N245) );
  MUX21X1_LVT U156 ( .A1(rf_add_reg[5]), .A2(N167), .S0(n51), .Y(N244) );
  MUX21X1_LVT U157 ( .A1(rf_add_reg[4]), .A2(N166), .S0(n51), .Y(N243) );
  MUX21X1_LVT U158 ( .A1(rf_add_reg[3]), .A2(N165), .S0(n51), .Y(N242) );
  MUX21X1_LVT U159 ( .A1(rf_add_reg[2]), .A2(N164), .S0(n149), .Y(N241) );
  MUX21X1_LVT U160 ( .A1(rf_add_reg[1]), .A2(N163), .S0(n149), .Y(N240) );
  MUX21X1_LVT U161 ( .A1(rf_add_reg[0]), .A2(N162), .S0(n149), .Y(N239) );
  NAND2X0_LVT U162 ( .A1(n17), .A2(n151), .Y(N208) );
  NAND2X0_LVT U163 ( .A1(n1380), .A2(state_reg[1]), .Y(n161) );
  INVX1_LVT U164 ( .A(n161), .Y(N207) );
  MUX21X1_LVT U165 ( .A1(rf_add_reg[5]), .A2(n180), .S0(n51), .Y(N203) );
  MUX21X1_LVT U166 ( .A1(rf_add_reg[4]), .A2(n181), .S0(n51), .Y(N202) );
  MUX21X1_LVT U167 ( .A1(rf_add_reg[3]), .A2(n20), .S0(n51), .Y(N201) );
  MUX21X1_LVT U168 ( .A1(rf_add_reg[2]), .A2(n177), .S0(n149), .Y(N200) );
  MUX21X1_LVT U169 ( .A1(rf_add_reg[1]), .A2(n176), .S0(n149), .Y(N199) );
  MUX21X1_LVT U170 ( .A1(rf_add_reg[0]), .A2(n175), .S0(n149), .Y(N198) );
  AO21X1_LVT U171 ( .A1(n27), .A2(state_reg[2]), .A3(N155), .Y(N286) );
  AO21X1_LVT U172 ( .A1(state_reg[1]), .A2(n150), .A3(N207), .Y(N285) );
  NAND3X0_LVT U173 ( .A1(n1630), .A2(n26), .A3(n69), .Y(n152) );
  AND2X1_LVT U174 ( .A1(state_reg[0]), .A2(n152), .Y(N284) );
  AND3X1_LVT U175 ( .A1(n153), .A2(n85), .A3(n77), .Y(n1540) );
  NAND3X0_LVT U176 ( .A1(n1540), .A2(n156), .A3(n1550), .Y(n1650) );
  INVX1_LVT U177 ( .A(n1650), .Y(n159) );
  NAND4X0_LVT U178 ( .A1(n159), .A2(n175), .A3(n64), .A4(n68), .Y(n157) );
  NAND2X0_LVT U179 ( .A1(n157), .A2(n158), .Y(N139) );
  NAND4X0_LVT U180 ( .A1(n159), .A2(n87), .A3(n64), .A4(n68), .Y(n160) );
  NAND2X0_LVT U181 ( .A1(n160), .A2(n161), .Y(N138) );
  NAND4X0_LVT U182 ( .A1(n86), .A2(n87), .A3(n84), .A4(n1620), .Y(n1640) );
  OAI22X1_LVT U183 ( .A1(n1650), .A2(n1640), .A3(n1630), .A4(n15), .Y(N137) );
  INVX1_LVT U184 ( .A(net15771), .Y(net15781) );
  AO21X1_LVT U185 ( .A1(net15781), .A2(net15748), .A3(net15749), .Y(n79) );
  AO22X1_LVT U186 ( .A1(status_reg[1]), .A2(n1680), .A3(i_status[0]), .A4(
        net17531), .Y(n128) );
  NAND2X0_LVT U187 ( .A1(state_tx[0]), .A2(net15781), .Y(n171) );
  NAND2X0_LVT U188 ( .A1(net17536), .A2(net15771), .Y(n172) );
  AO222X1_LVT U189 ( .A1(status_reg[2]), .A2(n1680), .A3(status_reg[1]), .A4(
        n1670), .A5(i_status[1]), .A6(net17531), .Y(n127) );
  AO222X1_LVT U190 ( .A1(status_reg[3]), .A2(n1680), .A3(status_reg[2]), .A4(
        n1670), .A5(i_status[2]), .A6(net17531), .Y(n126) );
  AO222X1_LVT U191 ( .A1(status_reg[4]), .A2(n1680), .A3(status_reg[3]), .A4(
        n1670), .A5(i_status[3]), .A6(net17531), .Y(n125) );
  AO222X1_LVT U192 ( .A1(status_reg[5]), .A2(n1680), .A3(status_reg[4]), .A4(
        n1670), .A5(i_status[4]), .A6(net17531), .Y(n124) );
  AO222X1_LVT U193 ( .A1(status_reg[6]), .A2(n1680), .A3(status_reg[5]), .A4(
        n1670), .A5(i_status[5]), .A6(net17531), .Y(n123) );
  AO222X1_LVT U194 ( .A1(status_reg[7]), .A2(n1680), .A3(status_reg[6]), .A4(
        n1670), .A5(i_status[6]), .A6(net17531), .Y(n122) );
  AO222X1_LVT U195 ( .A1(status_reg[8]), .A2(n1680), .A3(status_reg[7]), .A4(
        n1670), .A5(i_status[7]), .A6(net17531), .Y(n121) );
  AO222X1_LVT U196 ( .A1(status_reg[9]), .A2(n1680), .A3(status_reg[8]), .A4(
        n1670), .A5(i_status[8]), .A6(net17531), .Y(n120) );
  AO222X1_LVT U197 ( .A1(status_reg[10]), .A2(n1680), .A3(status_reg[9]), .A4(
        n1670), .A5(i_status[9]), .A6(net17531), .Y(n119) );
  AO222X1_LVT U198 ( .A1(status_reg[11]), .A2(n1680), .A3(status_reg[10]), 
        .A4(n1670), .A5(i_status[10]), .A6(net17531), .Y(n118) );
  AO222X1_LVT U199 ( .A1(status_reg[12]), .A2(n1680), .A3(status_reg[11]), 
        .A4(n1670), .A5(i_status[11]), .A6(net17531), .Y(n117) );
  AO222X1_LVT U200 ( .A1(status_reg[13]), .A2(n1680), .A3(status_reg[12]), 
        .A4(n1670), .A5(i_status[12]), .A6(net17531), .Y(n116) );
  AO222X1_LVT U201 ( .A1(status_reg[14]), .A2(n1680), .A3(status_reg[13]), 
        .A4(n1670), .A5(i_status[13]), .A6(net17531), .Y(n115) );
  AO222X1_LVT U202 ( .A1(status_reg[15]), .A2(n1680), .A3(status_reg[14]), 
        .A4(n1670), .A5(i_status[14]), .A6(net17531), .Y(n114) );
  NAND2X0_LVT U203 ( .A1(n171), .A2(n170), .Y(miso_rde_strt_nxt) );
  INVX1_LVT U204 ( .A(n174), .Y(n173) );
  AO22X1_LVT U205 ( .A1(i_rf_din[0]), .A2(n52), .A3(n174), .A4(n21), .Y(n110)
         );
  AO222X1_LVT U206 ( .A1(n60), .A2(n22), .A3(n174), .A4(n16), .A5(i_rf_din[4]), 
        .A6(n52), .Y(n106) );
  AND2X1_LVT U207 ( .A1(o_rf_wre), .A2(n175), .Y(o_dout[0]) );
  AND2X1_LVT U208 ( .A1(o_rf_wre), .A2(n176), .Y(o_dout[1]) );
  AND2X1_LVT U209 ( .A1(o_rf_wre), .A2(n177), .Y(o_dout[2]) );
  AND2X1_LVT U210 ( .A1(o_rf_wre), .A2(n20), .Y(o_dout[3]) );
  AND2X1_LVT U211 ( .A1(o_rf_wre), .A2(n181), .Y(o_dout[4]) );
  AND2X1_LVT U212 ( .A1(o_rf_wre), .A2(n180), .Y(o_dout[5]) );
  AND2X1_LVT U213 ( .A1(o_rf_wre), .A2(n179), .Y(o_dout[6]) );
  spi_slave_DW01_inc_0 r102 ( .A(rf_add_reg), .SUM({N169, N168, N167, N166, 
        N165, N164, N163, N162}) );
endmodule


module dig_tx_fifo_synchronizer_PTR_WIDTH3_0 ( i_dig_tx_fifo_synchronizer_clk, 
        i_dig_tx_fifo_synchronizer_rst_n, i_dig_tx_fifo_synchronizer_d_in, 
        o_dig_tx_fifo_synchronizer_d_out );
  input [3:0] i_dig_tx_fifo_synchronizer_d_in;
  output [3:0] o_dig_tx_fifo_synchronizer_d_out;
  input i_dig_tx_fifo_synchronizer_clk, i_dig_tx_fifo_synchronizer_rst_n;
  wire   n1, n2;
  wire   [3:0] metastable_flop;

  DFFARX1_LVT metastable_flop_reg_3_ ( .D(i_dig_tx_fifo_synchronizer_d_in[3]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(metastable_flop[3]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_3_ ( .D(metastable_flop[3]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(
        o_dig_tx_fifo_synchronizer_d_out[3]) );
  DFFARX1_LVT metastable_flop_reg_2_ ( .D(i_dig_tx_fifo_synchronizer_d_in[2]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(metastable_flop[2]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_2_ ( .D(metastable_flop[2]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(
        o_dig_tx_fifo_synchronizer_d_out[2]) );
  DFFARX1_LVT metastable_flop_reg_1_ ( .D(i_dig_tx_fifo_synchronizer_d_in[1]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(metastable_flop[1]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_1_ ( .D(metastable_flop[1]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(
        o_dig_tx_fifo_synchronizer_d_out[1]) );
  DFFARX1_LVT metastable_flop_reg_0_ ( .D(i_dig_tx_fifo_synchronizer_d_in[0]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(metastable_flop[0]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_0_ ( .D(metastable_flop[0]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(
        o_dig_tx_fifo_synchronizer_d_out[0]) );
  INVX2_LVT U3 ( .A(n2), .Y(n1) );
  INVX1_LVT U4 ( .A(i_dig_tx_fifo_synchronizer_rst_n), .Y(n2) );
endmodule


module dig_tx_fifo_synchronizer_PTR_WIDTH3_1 ( i_dig_tx_fifo_synchronizer_clk, 
        i_dig_tx_fifo_synchronizer_rst_n, i_dig_tx_fifo_synchronizer_d_in, 
        o_dig_tx_fifo_synchronizer_d_out );
  input [3:0] i_dig_tx_fifo_synchronizer_d_in;
  output [3:0] o_dig_tx_fifo_synchronizer_d_out;
  input i_dig_tx_fifo_synchronizer_clk, i_dig_tx_fifo_synchronizer_rst_n;
  wire   n1, n2;
  wire   [3:0] metastable_flop;

  DFFARX1_LVT metastable_flop_reg_3_ ( .D(i_dig_tx_fifo_synchronizer_d_in[3]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(metastable_flop[3]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_3_ ( .D(metastable_flop[3]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(
        o_dig_tx_fifo_synchronizer_d_out[3]) );
  DFFARX1_LVT metastable_flop_reg_2_ ( .D(i_dig_tx_fifo_synchronizer_d_in[2]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(metastable_flop[2]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_2_ ( .D(metastable_flop[2]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(
        o_dig_tx_fifo_synchronizer_d_out[2]) );
  DFFARX1_LVT metastable_flop_reg_1_ ( .D(i_dig_tx_fifo_synchronizer_d_in[1]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(metastable_flop[1]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_1_ ( .D(metastable_flop[1]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(
        o_dig_tx_fifo_synchronizer_d_out[1]) );
  DFFARX1_LVT metastable_flop_reg_0_ ( .D(i_dig_tx_fifo_synchronizer_d_in[0]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(metastable_flop[0]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_0_ ( .D(metastable_flop[0]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(n1), .Q(
        o_dig_tx_fifo_synchronizer_d_out[0]) );
  INVX2_LVT U3 ( .A(n2), .Y(n1) );
  INVX1_LVT U4 ( .A(i_dig_tx_fifo_synchronizer_rst_n), .Y(n2) );
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
  wire   wfull, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26;
  wire   [2:0] b_wptr_next;
  wire   [2:0] g_wptr_next;

  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_0_ ( .D(b_wptr_next[0]), 
        .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n10), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]), .QN(n2) );
  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_full_reg ( .D(wfull), .CLK(
        i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n10), .Q(
        o_dig_tx_fifo_wr_ptr_handler_full), .QN(n1) );
  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_3_ ( .D(n7), .CLK(
        i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n10), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[3]) );
  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_2_ ( .D(g_wptr_next[2]), 
        .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n10), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[2]) );
  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_1_ ( .D(g_wptr_next[1]), 
        .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n10), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[1]) );
  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_0_ ( .D(g_wptr_next[0]), 
        .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n10), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[0]) );
  DFFARX1_HVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_3_ ( .D(n7), .CLK(
        i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n10), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[3]) );
  DFFARX1_HVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_2_ ( .D(b_wptr_next[2]), 
        .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n10), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[2]), .QN(n6) );
  DFFARX1_HVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_1_ ( .D(b_wptr_next[1]), 
        .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n10), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[1]), .QN(n8) );
  OR2X1_LVT U3 ( .A1(n13), .A2(n2), .Y(n5) );
  OR2X2_LVT U4 ( .A1(n8), .A2(n14), .Y(n15) );
  NAND3X0_LVT U5 ( .A1(o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]), .A2(n1), .A3(
        i_dig_tx_fifo_wr_ptr_handler_wr_en), .Y(n3) );
  NAND2X0_LVT U6 ( .A1(n13), .A2(n2), .Y(n4) );
  NAND2X0_LVT U7 ( .A1(n4), .A2(n5), .Y(n19) );
  NAND2X0_RVT U8 ( .A1(n1), .A2(i_dig_tx_fifo_wr_ptr_handler_wr_en), .Y(n13)
         );
  INVX1_LVT U9 ( .A(n19), .Y(b_wptr_next[0]) );
  XNOR2X2_LVT U10 ( .A1(n15), .A2(n6), .Y(n16) );
  OR2X1_LVT U11 ( .A1(n6), .A2(n15), .Y(n12) );
  NBUFFX2_LVT U12 ( .A(n26), .Y(n7) );
  INVX0_HVT U13 ( .A(n17), .Y(g_wptr_next[2]) );
  INVX2_LVT U14 ( .A(n11), .Y(n10) );
  INVX1_LVT U15 ( .A(i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Y(n11) );
  XOR2X1_LVT U16 ( .A1(n3), .A2(o_dig_tx_fifo_wr_ptr_handler_b_wptr[1]), .Y(
        n18) );
  INVX1_LVT U17 ( .A(i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[2]), .Y(n9) );
  XOR2X2_LVT U18 ( .A1(n17), .A2(n9), .Y(n24) );
  XOR2X1_LVT U19 ( .A1(i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[3]), .A2(n7), 
        .Y(n25) );
  NAND3X0_LVT U20 ( .A1(o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]), .A2(n1), .A3(
        i_dig_tx_fifo_wr_ptr_handler_wr_en), .Y(n14) );
  XNOR2X2_LVT U21 ( .A1(n12), .A2(o_dig_tx_fifo_wr_ptr_handler_b_wptr[3]), .Y(
        n26) );
  INVX1_LVT U22 ( .A(n18), .Y(b_wptr_next[1]) );
  INVX1_LVT U23 ( .A(n16), .Y(b_wptr_next[2]) );
  XOR2X2_LVT U24 ( .A1(n26), .A2(n16), .Y(n17) );
  XOR2X2_LVT U25 ( .A1(n18), .A2(b_wptr_next[2]), .Y(n20) );
  INVX1_LVT U26 ( .A(n20), .Y(g_wptr_next[1]) );
  XOR2X2_LVT U27 ( .A1(n19), .A2(b_wptr_next[1]), .Y(n21) );
  INVX1_LVT U28 ( .A(n21), .Y(g_wptr_next[0]) );
  XOR2X2_LVT U29 ( .A1(n20), .A2(i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[1]), 
        .Y(n23) );
  XOR2X2_LVT U30 ( .A1(n21), .A2(i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[0]), 
        .Y(n22) );
  AND4X1_LVT U31 ( .A1(n24), .A2(n25), .A3(n23), .A4(n22), .Y(wfull) );
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
  wire   n11, n12, n13, b_rptr_next_1_, imediate_empty, n2, net6191, net8179,
         net15683, net15684, net17564, net17563, net17567, net17687, net17709,
         net17785, net17562, net15669, net15665, net22453, net18002, net15681,
         net15680, net15679, net15678, net15676, net15675, net15673, net15672,
         net15664, net15663, net15662, net18004, net15677, net22531, net15687,
         n1, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [2:1] g_rptr_next;

  DFFASX1_LVT o_dig_tx_fifo_re_ptr_handler_empty_reg ( .D(imediate_empty), 
        .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .SETB(n9), .Q(
        o_dig_tx_fifo_re_ptr_handler_empty), .QN(n2) );
  DFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_3_ ( .D(n8), .CLK(
        i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(
        o_dig_tx_fifo_re_ptr_handler_b_rptr[3]), .QN(net17567) );
  DFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_3_ ( .D(n8), .CLK(
        i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[3]) );
  DFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_2_ ( .D(g_rptr_next[2]), 
        .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[2]) );
  DFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_1_ ( .D(g_rptr_next[1]), 
        .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[1]) );
  DFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_0_ ( .D(net8179), .CLK(
        i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[0]) );
  DFFARX2_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_2_ ( .D(net6191), .CLK(
        i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(n11), .QN(net17687)
         );
  DFFARX2_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_1_ ( .D(b_rptr_next_1_), 
        .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(n12), .QN(
        net17709) );
  DFFARX2_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_0_ ( .D(net17563), .CLK(
        i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(n13), .QN(net17564)
         );
  INVX4_LVT U3 ( .A(net17564), .Y(o_dig_tx_fifo_re_ptr_handler_b_rptr[0]) );
  XOR3X2_LVT U4 ( .A1(i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[0]), .A2(n13), 
        .A3(net15683), .Y(net15678) );
  NAND2X4_LVT U5 ( .A1(net22531), .A2(n2), .Y(net15683) );
  INVX1_LVT U6 ( .A(n12), .Y(net18004) );
  INVX1_LVT U7 ( .A(net15679), .Y(net15680) );
  NAND2X0_LVT U8 ( .A1(net22531), .A2(net17562), .Y(net15687) );
  NBUFFX2_LVT U9 ( .A(i_dig_tx_fifo_re_ptr_handler_re_en), .Y(net22531) );
  AND2X1_LVT U10 ( .A1(n13), .A2(n2), .Y(net17562) );
  XNOR2X2_LVT U11 ( .A1(net15687), .A2(net18004), .Y(net15677) );
  NAND3X0_LVT U12 ( .A1(n12), .A2(net22531), .A3(net17562), .Y(net18002) );
  NAND3X0_LVT U13 ( .A1(n12), .A2(net22531), .A3(net17562), .Y(net15669) );
  INVX4_LVT U14 ( .A(net15677), .Y(b_rptr_next_1_) );
  XOR2X1_LVT U15 ( .A1(b_rptr_next_1_), .A2(net17563), .Y(net8179) );
  XOR2X1_LVT U16 ( .A1(net6191), .A2(b_rptr_next_1_), .Y(g_rptr_next[1]) );
  NAND3X0_LVT U17 ( .A1(b_rptr_next_1_), .A2(net15680), .A3(net15681), .Y(
        net15675) );
  NAND3X0_LVT U18 ( .A1(net15677), .A2(net15678), .A3(net15679), .Y(net15676)
         );
  AND3X1_LVT U19 ( .A1(net15662), .A2(net15663), .A3(n1), .Y(imediate_empty)
         );
  NAND2X0_LVT U20 ( .A1(net15675), .A2(net15676), .Y(net15662) );
  XNOR3X1_LVT U21 ( .A1(i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[1]), .A2(n11), 
        .A3(net15672), .Y(net15679) );
  INVX2_LVT U22 ( .A(net15678), .Y(net15681) );
  XNOR2X2_LVT U23 ( .A1(net15664), .A2(net15665), .Y(net15663) );
  NAND3X0_LVT U24 ( .A1(n3), .A2(n4), .A3(n5), .Y(net15664) );
  NAND2X0_LVT U25 ( .A1(net15673), .A2(n6), .Y(n3) );
  INVX0_HVT U26 ( .A(n11), .Y(net15673) );
  XNOR2X1_LVT U27 ( .A1(o_dig_tx_fifo_re_ptr_handler_b_rptr[3]), .A2(
        i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[2]), .Y(n6) );
  NAND3X0_RVT U28 ( .A1(n7), .A2(net15672), .A3(n11), .Y(n4) );
  INVX1_LVT U29 ( .A(n6), .Y(n7) );
  AND2X1_LVT U30 ( .A1(net22453), .A2(i_dig_tx_fifo_re_ptr_handler_re_en), .Y(
        net15672) );
  NAND2X0_LVT U31 ( .A1(net18002), .A2(n6), .Y(n5) );
  XOR2X2_LVT U32 ( .A1(net15669), .A2(n11), .Y(net15665) );
  XOR3X2_LVT U33 ( .A1(o_dig_tx_fifo_re_ptr_handler_b_rptr[3]), .A2(
        i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[3]), .A3(net15684), .Y(n1) );
  NAND2X0_LVT U34 ( .A1(n11), .A2(net15672), .Y(net15684) );
  AND2X1_LVT U35 ( .A1(n12), .A2(net17562), .Y(net22453) );
  INVX1_LVT U36 ( .A(net15665), .Y(net6191) );
  INVX1_LVT U37 ( .A(n13), .Y(net17785) );
  INVX4_LVT U38 ( .A(net17687), .Y(o_dig_tx_fifo_re_ptr_handler_b_rptr[2]) );
  INVX4_LVT U39 ( .A(net17709), .Y(o_dig_tx_fifo_re_ptr_handler_b_rptr[1]) );
  INVX2_LVT U40 ( .A(n10), .Y(n9) );
  INVX1_LVT U41 ( .A(i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Y(n10) );
  XOR2X1_LVT U42 ( .A1(net15684), .A2(net17567), .Y(n8) );
  XOR2X1_LVT U43 ( .A1(net15683), .A2(net17785), .Y(net17563) );
  XOR2X2_LVT U44 ( .A1(n8), .A2(net6191), .Y(g_rptr_next[2]) );
endmodule


module dig_tx_fifo_mem_FIFO_DEPTH8_REGISTER_WIDTH12_PTR_WIDTH3 ( 
        i_dig_tx_fifo_mem_clk26, i_dig_tx_fifo_mem_wr_en, 
        i_dig_tx_fifo_mem_b_wptr, i_dig_tx_fifo_mem_b_rptr, 
        i_dig_tx_fifo_mem_data_in, i_dig_tx_fifo_mem_full, 
        o_dig_tx_fifo_mem_data_out );
  input [3:0] i_dig_tx_fifo_mem_b_wptr;
  input [3:0] i_dig_tx_fifo_mem_b_rptr;
  input [11:0] i_dig_tx_fifo_mem_data_in;
  output [11:0] o_dig_tx_fifo_mem_data_out;
  input i_dig_tx_fifo_mem_clk26, i_dig_tx_fifo_mem_wr_en,
         i_dig_tx_fifo_mem_full;
  wire   n211, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n1, n2, n3, n4, n5, n6, n7, n8, n910, n1010, n1110,
         n12, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210;
  wire   [95:0] fifo;

  DFFX1_LVT fifo_reg_0__11_ ( .D(n119), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[95]) );
  DFFX1_LVT fifo_reg_0__10_ ( .D(n118), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[94]) );
  DFFX1_LVT fifo_reg_0__9_ ( .D(n117), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[93]) );
  DFFX1_LVT fifo_reg_0__8_ ( .D(n116), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[92]) );
  DFFX1_LVT fifo_reg_0__7_ ( .D(n115), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[91]) );
  DFFX1_LVT fifo_reg_0__6_ ( .D(n114), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[90]) );
  DFFX1_LVT fifo_reg_0__5_ ( .D(n113), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[89]) );
  DFFX1_LVT fifo_reg_0__4_ ( .D(n112), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[88]) );
  DFFX1_LVT fifo_reg_0__3_ ( .D(n111), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[87]) );
  DFFX1_LVT fifo_reg_0__2_ ( .D(n110), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[86]) );
  DFFX1_LVT fifo_reg_0__1_ ( .D(n109), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[85]) );
  DFFX1_LVT fifo_reg_0__0_ ( .D(n108), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[84]) );
  DFFX1_LVT fifo_reg_1__11_ ( .D(n107), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[83]) );
  DFFX1_LVT fifo_reg_1__10_ ( .D(n106), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[82]) );
  DFFX1_LVT fifo_reg_1__9_ ( .D(n105), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[81]) );
  DFFX1_LVT fifo_reg_1__8_ ( .D(n104), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[80]) );
  DFFX1_LVT fifo_reg_1__7_ ( .D(n103), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[79]) );
  DFFX1_LVT fifo_reg_1__6_ ( .D(n102), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[78]) );
  DFFX1_LVT fifo_reg_1__5_ ( .D(n101), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[77]) );
  DFFX1_LVT fifo_reg_1__4_ ( .D(n100), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[76]) );
  DFFX1_LVT fifo_reg_1__3_ ( .D(n99), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[75]) );
  DFFX1_LVT fifo_reg_1__2_ ( .D(n98), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[74]) );
  DFFX1_LVT fifo_reg_1__1_ ( .D(n97), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[73]) );
  DFFX1_LVT fifo_reg_1__0_ ( .D(n96), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[72]) );
  DFFX1_LVT fifo_reg_2__11_ ( .D(n95), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[71]) );
  DFFX1_LVT fifo_reg_2__10_ ( .D(n94), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[70]) );
  DFFX1_LVT fifo_reg_2__9_ ( .D(n93), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[69]) );
  DFFX1_LVT fifo_reg_2__8_ ( .D(n92), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[68]) );
  DFFX1_LVT fifo_reg_2__7_ ( .D(n91), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[67]) );
  DFFX1_LVT fifo_reg_2__6_ ( .D(n90), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[66]) );
  DFFX1_LVT fifo_reg_2__5_ ( .D(n89), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[65]) );
  DFFX1_LVT fifo_reg_2__4_ ( .D(n88), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[64]) );
  DFFX1_LVT fifo_reg_2__3_ ( .D(n87), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[63]) );
  DFFX1_LVT fifo_reg_2__2_ ( .D(n86), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[62]) );
  DFFX1_LVT fifo_reg_2__1_ ( .D(n85), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[61]) );
  DFFX1_LVT fifo_reg_2__0_ ( .D(n84), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[60]) );
  DFFX1_LVT fifo_reg_3__11_ ( .D(n83), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[59]) );
  DFFX1_LVT fifo_reg_3__10_ ( .D(n82), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[58]), .QN(n5) );
  DFFX1_LVT fifo_reg_3__9_ ( .D(n81), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[57]), .QN(n1110) );
  DFFX1_LVT fifo_reg_3__8_ ( .D(n80), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[56]), .QN(n1010) );
  DFFX1_LVT fifo_reg_3__7_ ( .D(n79), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[55]) );
  DFFX1_LVT fifo_reg_3__6_ ( .D(n78), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[54]) );
  DFFX1_LVT fifo_reg_3__5_ ( .D(n77), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[53]) );
  DFFX1_LVT fifo_reg_3__4_ ( .D(n76), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[52]) );
  DFFX1_LVT fifo_reg_3__3_ ( .D(n75), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[51]) );
  DFFX1_LVT fifo_reg_3__2_ ( .D(n74), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[50]) );
  DFFX1_LVT fifo_reg_3__1_ ( .D(n73), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[49]) );
  DFFX1_LVT fifo_reg_3__0_ ( .D(n72), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[48]) );
  DFFX1_LVT fifo_reg_4__11_ ( .D(n71), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[47]) );
  DFFX1_LVT fifo_reg_4__10_ ( .D(n70), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[46]), .QN(n15) );
  DFFX1_LVT fifo_reg_4__9_ ( .D(n69), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[45]) );
  DFFX1_LVT fifo_reg_4__8_ ( .D(n68), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[44]) );
  DFFX1_LVT fifo_reg_4__7_ ( .D(n67), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[43]) );
  DFFX1_LVT fifo_reg_4__6_ ( .D(n66), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[42]) );
  DFFX1_LVT fifo_reg_4__5_ ( .D(n65), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[41]) );
  DFFX1_LVT fifo_reg_4__4_ ( .D(n64), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[40]) );
  DFFX1_LVT fifo_reg_4__3_ ( .D(n63), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[39]) );
  DFFX1_LVT fifo_reg_4__2_ ( .D(n62), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[38]) );
  DFFX1_LVT fifo_reg_4__1_ ( .D(n61), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[37]) );
  DFFX1_LVT fifo_reg_4__0_ ( .D(n60), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[36]) );
  DFFX1_LVT fifo_reg_5__11_ ( .D(n59), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[35]) );
  DFFX1_LVT fifo_reg_5__10_ ( .D(n58), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[34]) );
  DFFX1_LVT fifo_reg_5__9_ ( .D(n57), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[33]) );
  DFFX1_LVT fifo_reg_5__8_ ( .D(n56), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[32]) );
  DFFX1_LVT fifo_reg_5__7_ ( .D(n55), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[31]) );
  DFFX1_LVT fifo_reg_5__6_ ( .D(n54), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[30]) );
  DFFX1_LVT fifo_reg_5__5_ ( .D(n53), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[29]) );
  DFFX1_LVT fifo_reg_5__4_ ( .D(n52), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[28]) );
  DFFX1_LVT fifo_reg_5__3_ ( .D(n51), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[27]) );
  DFFX1_LVT fifo_reg_5__2_ ( .D(n50), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[26]) );
  DFFX1_LVT fifo_reg_5__1_ ( .D(n49), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[25]) );
  DFFX1_LVT fifo_reg_5__0_ ( .D(n48), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[24]) );
  DFFX1_LVT fifo_reg_6__11_ ( .D(n47), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[23]) );
  DFFX1_LVT fifo_reg_6__10_ ( .D(n46), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[22]) );
  DFFX1_LVT fifo_reg_6__9_ ( .D(n45), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[21]) );
  DFFX1_LVT fifo_reg_6__8_ ( .D(n44), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[20]) );
  DFFX1_LVT fifo_reg_6__7_ ( .D(n43), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[19]) );
  DFFX1_LVT fifo_reg_6__6_ ( .D(n42), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[18]) );
  DFFX1_LVT fifo_reg_6__5_ ( .D(n41), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[17]) );
  DFFX1_LVT fifo_reg_6__4_ ( .D(n40), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[16]) );
  DFFX1_LVT fifo_reg_6__3_ ( .D(n39), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[15]) );
  DFFX1_LVT fifo_reg_6__2_ ( .D(n38), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[14]) );
  DFFX1_LVT fifo_reg_6__1_ ( .D(n37), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[13]) );
  DFFX1_LVT fifo_reg_6__0_ ( .D(n36), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[12]) );
  DFFX1_LVT fifo_reg_7__11_ ( .D(n35), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[11]) );
  DFFX1_LVT fifo_reg_7__10_ ( .D(n34), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[10]), .QN(n12) );
  DFFX1_LVT fifo_reg_7__9_ ( .D(n33), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[9]), .QN(n4) );
  DFFX1_LVT fifo_reg_7__8_ ( .D(n32), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[8]), .QN(n3) );
  DFFX1_LVT fifo_reg_7__7_ ( .D(n31), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[7]) );
  DFFX1_LVT fifo_reg_7__6_ ( .D(n30), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[6]) );
  DFFX1_LVT fifo_reg_7__5_ ( .D(n29), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[5]) );
  DFFX1_LVT fifo_reg_7__4_ ( .D(n28), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[4]) );
  DFFX1_LVT fifo_reg_7__3_ ( .D(n27), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[3]) );
  DFFX1_LVT fifo_reg_7__2_ ( .D(n26), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[2]) );
  DFFX1_LVT fifo_reg_7__1_ ( .D(n25), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[1]) );
  DFFX1_LVT fifo_reg_7__0_ ( .D(n24), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[0]) );
  AND3X2_LVT U2 ( .A1(i_dig_tx_fifo_mem_b_rptr[2]), .A2(n172), .A3(
        i_dig_tx_fifo_mem_b_rptr[1]), .Y(n21) );
  AND3X2_LVT U3 ( .A1(n181), .A2(n172), .A3(i_dig_tx_fifo_mem_b_rptr[1]), .Y(
        n23) );
  INVX0_LVT U4 ( .A(n165), .Y(n1) );
  INVX1_LVT U5 ( .A(n197), .Y(n130) );
  AND2X2_LVT U6 ( .A1(n121), .A2(n910), .Y(n2) );
  AND3X2_LVT U7 ( .A1(n121), .A2(i_dig_tx_fifo_mem_b_wptr[1]), .A3(n208), .Y(
        n6) );
  AND3X2_LVT U8 ( .A1(n121), .A2(i_dig_tx_fifo_mem_b_wptr[0]), .A3(n207), .Y(
        n7) );
  AND3X2_LVT U9 ( .A1(n121), .A2(n208), .A3(n207), .Y(n8) );
  AND2X1_LVT U10 ( .A1(i_dig_tx_fifo_mem_b_wptr[1]), .A2(
        i_dig_tx_fifo_mem_b_wptr[0]), .Y(n910) );
  NAND3X0_LVT U11 ( .A1(i_dig_tx_fifo_mem_b_wptr[1]), .A2(n120), .A3(n208), 
        .Y(n205) );
  NOR2X4_LVT U12 ( .A1(n1), .A2(n15), .Y(n14) );
  AO22X1_HVT U13 ( .A1(fifo[12]), .A2(n21), .A3(fifo[60]), .A4(n23), .Y(n125)
         );
  INVX8_LVT U14 ( .A(i_dig_tx_fifo_mem_b_rptr[1]), .Y(n165) );
  AND2X1_LVT U15 ( .A1(i_dig_tx_fifo_mem_b_rptr[2]), .A2(n172), .Y(n16) );
  INVX4_LVT U16 ( .A(i_dig_tx_fifo_mem_b_rptr[2]), .Y(n181) );
  AND3X1_RVT U17 ( .A1(i_dig_tx_fifo_mem_b_wptr[2]), .A2(
        i_dig_tx_fifo_mem_wr_en), .A3(n203), .Y(n121) );
  NBUFFX2_LVT U18 ( .A(n211), .Y(o_dig_tx_fifo_mem_data_out[10]) );
  INVX4_LVT U19 ( .A(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n172) );
  NAND2X0_LVT U20 ( .A1(n16), .A2(n14), .Y(n190) );
  AND2X1_LVT U21 ( .A1(i_dig_tx_fifo_mem_b_rptr[2]), .A2(
        i_dig_tx_fifo_mem_b_rptr[1]), .Y(n123) );
  INVX2_LVT U22 ( .A(n204), .Y(n198) );
  AO22X1_HVT U23 ( .A1(fifo[36]), .A2(n22), .A3(fifo[84]), .A4(n18), .Y(n126)
         );
  AO22X1_HVT U24 ( .A1(fifo[37]), .A2(n22), .A3(fifo[85]), .A4(n18), .Y(n132)
         );
  AO22X1_HVT U25 ( .A1(fifo[38]), .A2(n22), .A3(fifo[86]), .A4(n18), .Y(n136)
         );
  AO22X1_HVT U26 ( .A1(fifo[39]), .A2(n22), .A3(fifo[87]), .A4(n18), .Y(n140)
         );
  AO22X1_HVT U27 ( .A1(fifo[40]), .A2(n22), .A3(fifo[88]), .A4(n18), .Y(n144)
         );
  AO22X1_HVT U28 ( .A1(fifo[41]), .A2(n22), .A3(fifo[89]), .A4(n18), .Y(n148)
         );
  AO22X1_HVT U29 ( .A1(fifo[42]), .A2(n22), .A3(fifo[90]), .A4(n18), .Y(n152)
         );
  AO22X1_HVT U30 ( .A1(fifo[43]), .A2(n22), .A3(fifo[91]), .A4(n18), .Y(n156)
         );
  AND2X1_LVT U31 ( .A1(n16), .A2(n165), .Y(n22) );
  AO22X1_HVT U32 ( .A1(fifo[47]), .A2(n22), .A3(fifo[95]), .A4(n18), .Y(n192)
         );
  INVX0_HVT U33 ( .A(i_dig_tx_fifo_mem_b_wptr[1]), .Y(n207) );
  AND2X1_LVT U34 ( .A1(i_dig_tx_fifo_mem_b_rptr[2]), .A2(n165), .Y(n124) );
  AND2X1_HVT U35 ( .A1(n167), .A2(n165), .Y(n19) );
  AND2X1_HVT U36 ( .A1(n166), .A2(n165), .Y(n20) );
  NAND3X0_RVT U37 ( .A1(i_dig_tx_fifo_mem_b_wptr[0]), .A2(n120), .A3(n207), 
        .Y(n206) );
  AND3X2_LVT U38 ( .A1(n120), .A2(n208), .A3(n207), .Y(n199) );
  INVX0_HVT U39 ( .A(n164), .Y(n129) );
  AND2X1_LVT U40 ( .A1(n181), .A2(n165), .Y(n17) );
  AND3X1_LVT U41 ( .A1(n172), .A2(n165), .A3(n181), .Y(n18) );
  INVX1_LVT U42 ( .A(n206), .Y(n210) );
  INVX1_LVT U43 ( .A(n206), .Y(n201) );
  INVX1_LVT U44 ( .A(n205), .Y(n209) );
  INVX1_LVT U45 ( .A(n205), .Y(n200) );
  AND3X1_LVT U46 ( .A1(i_dig_tx_fifo_mem_wr_en), .A2(n203), .A3(n202), .Y(n120) );
  AND2X1_LVT U47 ( .A1(n181), .A2(i_dig_tx_fifo_mem_b_rptr[1]), .Y(n122) );
  OR3X1_LVT U48 ( .A1(n125), .A2(n126), .A3(n127), .Y(
        o_dig_tx_fifo_mem_data_out[0]) );
  AO221X1_LVT U49 ( .A1(fifo[72]), .A2(n20), .A3(fifo[24]), .A4(n19), .A5(n128), .Y(n127) );
  AO22X1_LVT U50 ( .A1(fifo[0]), .A2(n129), .A3(fifo[48]), .A4(n130), .Y(n128)
         );
  OR3X1_LVT U51 ( .A1(n131), .A2(n132), .A3(n133), .Y(
        o_dig_tx_fifo_mem_data_out[1]) );
  AO221X1_LVT U52 ( .A1(fifo[73]), .A2(n20), .A3(fifo[25]), .A4(n19), .A5(n134), .Y(n133) );
  AO22X1_LVT U53 ( .A1(fifo[1]), .A2(n129), .A3(fifo[49]), .A4(n130), .Y(n134)
         );
  AO22X1_LVT U54 ( .A1(fifo[13]), .A2(n21), .A3(fifo[61]), .A4(n23), .Y(n131)
         );
  OR3X1_LVT U55 ( .A1(n135), .A2(n136), .A3(n137), .Y(
        o_dig_tx_fifo_mem_data_out[2]) );
  AO221X1_LVT U56 ( .A1(fifo[74]), .A2(n20), .A3(fifo[26]), .A4(n19), .A5(n138), .Y(n137) );
  AO22X1_LVT U57 ( .A1(fifo[2]), .A2(n129), .A3(fifo[50]), .A4(n130), .Y(n138)
         );
  AO22X1_LVT U58 ( .A1(fifo[14]), .A2(n21), .A3(fifo[62]), .A4(n23), .Y(n135)
         );
  OR3X1_LVT U59 ( .A1(n139), .A2(n140), .A3(n141), .Y(
        o_dig_tx_fifo_mem_data_out[3]) );
  AO221X1_LVT U60 ( .A1(fifo[75]), .A2(n20), .A3(fifo[27]), .A4(n19), .A5(n142), .Y(n141) );
  AO22X1_LVT U61 ( .A1(fifo[3]), .A2(n129), .A3(fifo[51]), .A4(n130), .Y(n142)
         );
  AO22X1_LVT U62 ( .A1(fifo[15]), .A2(n21), .A3(fifo[63]), .A4(n23), .Y(n139)
         );
  OR3X1_LVT U63 ( .A1(n143), .A2(n144), .A3(n145), .Y(
        o_dig_tx_fifo_mem_data_out[4]) );
  AO221X1_LVT U64 ( .A1(fifo[76]), .A2(n20), .A3(fifo[28]), .A4(n19), .A5(n146), .Y(n145) );
  AO22X1_LVT U65 ( .A1(fifo[4]), .A2(n129), .A3(fifo[52]), .A4(n130), .Y(n146)
         );
  AO22X1_LVT U66 ( .A1(fifo[16]), .A2(n21), .A3(fifo[64]), .A4(n23), .Y(n143)
         );
  OR3X1_LVT U67 ( .A1(n147), .A2(n148), .A3(n149), .Y(
        o_dig_tx_fifo_mem_data_out[5]) );
  AO221X1_LVT U68 ( .A1(fifo[77]), .A2(n20), .A3(fifo[29]), .A4(n19), .A5(n150), .Y(n149) );
  AO22X1_LVT U69 ( .A1(fifo[5]), .A2(n129), .A3(fifo[53]), .A4(n130), .Y(n150)
         );
  AO22X1_LVT U70 ( .A1(fifo[17]), .A2(n21), .A3(fifo[65]), .A4(n23), .Y(n147)
         );
  OR3X1_LVT U71 ( .A1(n151), .A2(n152), .A3(n153), .Y(
        o_dig_tx_fifo_mem_data_out[6]) );
  AO221X1_LVT U72 ( .A1(fifo[78]), .A2(n20), .A3(fifo[30]), .A4(n19), .A5(n154), .Y(n153) );
  AO22X1_LVT U73 ( .A1(fifo[6]), .A2(n129), .A3(fifo[54]), .A4(n130), .Y(n154)
         );
  AO22X1_LVT U74 ( .A1(fifo[18]), .A2(n21), .A3(fifo[66]), .A4(n23), .Y(n151)
         );
  OR3X1_LVT U75 ( .A1(n155), .A2(n156), .A3(n157), .Y(
        o_dig_tx_fifo_mem_data_out[7]) );
  AO221X1_LVT U76 ( .A1(fifo[79]), .A2(n20), .A3(fifo[31]), .A4(n19), .A5(n158), .Y(n157) );
  AO22X1_LVT U77 ( .A1(fifo[7]), .A2(n129), .A3(fifo[55]), .A4(n130), .Y(n158)
         );
  AO22X1_LVT U78 ( .A1(fifo[19]), .A2(n21), .A3(fifo[67]), .A4(n23), .Y(n155)
         );
  NAND4X0_LVT U79 ( .A1(n159), .A2(n160), .A3(n161), .A4(n162), .Y(
        o_dig_tx_fifo_mem_data_out[8]) );
  OA22X1_LVT U80 ( .A1(n163), .A2(n1010), .A3(n164), .A4(n3), .Y(n162) );
  NAND3X0_LVT U81 ( .A1(n165), .A2(fifo[80]), .A3(n166), .Y(n161) );
  NAND3X0_LVT U82 ( .A1(n165), .A2(fifo[32]), .A3(n167), .Y(n160) );
  AND4X1_LVT U83 ( .A1(n168), .A2(n169), .A3(n171), .A4(n170), .Y(n159) );
  NAND3X0_LVT U84 ( .A1(n122), .A2(n172), .A3(fifo[68]), .Y(n171) );
  NAND3X0_LVT U85 ( .A1(n172), .A2(n123), .A3(fifo[20]), .Y(n170) );
  NAND3X0_LVT U86 ( .A1(n17), .A2(n172), .A3(fifo[92]), .Y(n169) );
  NAND3X0_LVT U87 ( .A1(n172), .A2(n124), .A3(fifo[44]), .Y(n168) );
  NAND4X0_LVT U88 ( .A1(n173), .A2(n174), .A3(n175), .A4(n176), .Y(
        o_dig_tx_fifo_mem_data_out[9]) );
  OA22X1_LVT U89 ( .A1(n163), .A2(n1110), .A3(n164), .A4(n4), .Y(n176) );
  NAND3X0_LVT U90 ( .A1(n165), .A2(fifo[81]), .A3(n166), .Y(n175) );
  NAND3X0_LVT U91 ( .A1(n165), .A2(fifo[33]), .A3(n167), .Y(n174) );
  AND4X1_LVT U92 ( .A1(n177), .A2(n178), .A3(n179), .A4(n180), .Y(n173) );
  NAND3X0_LVT U93 ( .A1(n172), .A2(n122), .A3(fifo[69]), .Y(n180) );
  NAND3X0_LVT U94 ( .A1(n172), .A2(n123), .A3(fifo[21]), .Y(n179) );
  NAND3X0_LVT U95 ( .A1(fifo[93]), .A2(n172), .A3(n17), .Y(n178) );
  NAND3X0_LVT U96 ( .A1(n172), .A2(n124), .A3(fifo[45]), .Y(n177) );
  NAND4X0_LVT U97 ( .A1(n182), .A2(n183), .A3(n184), .A4(n185), .Y(n211) );
  AND2X1_LVT U98 ( .A1(n186), .A2(n187), .Y(n185) );
  NAND3X0_LVT U99 ( .A1(n165), .A2(fifo[34]), .A3(n167), .Y(n187) );
  NAND3X0_LVT U100 ( .A1(n165), .A2(fifo[82]), .A3(n166), .Y(n186) );
  OA22X1_LVT U101 ( .A1(n164), .A2(n12), .A3(n163), .A4(n5), .Y(n184) );
  NAND2X0_LVT U102 ( .A1(fifo[94]), .A2(n18), .Y(n183) );
  AND3X1_LVT U103 ( .A1(n188), .A2(n189), .A3(n190), .Y(n182) );
  NAND2X0_LVT U104 ( .A1(fifo[70]), .A2(n23), .Y(n189) );
  NAND2X0_LVT U105 ( .A1(fifo[22]), .A2(n21), .Y(n188) );
  OR3X1_LVT U106 ( .A1(n191), .A2(n192), .A3(n193), .Y(
        o_dig_tx_fifo_mem_data_out[11]) );
  AO221X1_LVT U107 ( .A1(fifo[83]), .A2(n20), .A3(fifo[35]), .A4(n19), .A5(
        n194), .Y(n193) );
  AO22X1_LVT U108 ( .A1(fifo[11]), .A2(n129), .A3(fifo[59]), .A4(n130), .Y(
        n194) );
  NAND3X0_LVT U109 ( .A1(n181), .A2(i_dig_tx_fifo_mem_b_rptr[1]), .A3(
        i_dig_tx_fifo_mem_b_rptr[0]), .Y(n163) );
  NAND3X0_LVT U110 ( .A1(i_dig_tx_fifo_mem_b_rptr[0]), .A2(
        i_dig_tx_fifo_mem_b_rptr[2]), .A3(i_dig_tx_fifo_mem_b_rptr[1]), .Y(
        n164) );
  INVX1_LVT U111 ( .A(n195), .Y(n167) );
  INVX1_LVT U112 ( .A(n196), .Y(n166) );
  NAND2X0_LVT U113 ( .A1(i_dig_tx_fifo_mem_b_rptr[0]), .A2(n181), .Y(n196) );
  AO22X1_LVT U114 ( .A1(fifo[23]), .A2(n21), .A3(fifo[71]), .A4(n23), .Y(n191)
         );
  NAND2X0_RVT U115 ( .A1(i_dig_tx_fifo_mem_b_rptr[0]), .A2(
        i_dig_tx_fifo_mem_b_rptr[2]), .Y(n195) );
  NBUFFX2_HVT U116 ( .A(n163), .Y(n197) );
  INVX1_LVT U117 ( .A(i_dig_tx_fifo_mem_full), .Y(n203) );
  MUX21X1_LVT U118 ( .A1(fifo[10]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(n2), .Y(n34) );
  MUX21X1_LVT U119 ( .A1(fifo[9]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(n2), 
        .Y(n33) );
  MUX21X1_LVT U120 ( .A1(fifo[8]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(n2), 
        .Y(n32) );
  MUX21X1_LVT U121 ( .A1(fifo[7]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(n2), 
        .Y(n31) );
  MUX21X1_LVT U122 ( .A1(fifo[6]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(n2), 
        .Y(n30) );
  MUX21X1_LVT U123 ( .A1(fifo[5]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(n2), 
        .Y(n29) );
  MUX21X1_LVT U124 ( .A1(fifo[4]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(n2), 
        .Y(n28) );
  MUX21X1_LVT U125 ( .A1(fifo[3]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(n2), 
        .Y(n27) );
  MUX21X1_LVT U126 ( .A1(fifo[2]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(n2), 
        .Y(n26) );
  MUX21X1_LVT U127 ( .A1(fifo[1]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(n2), 
        .Y(n25) );
  MUX21X1_LVT U128 ( .A1(fifo[0]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(n2), 
        .Y(n24) );
  INVX1_LVT U129 ( .A(i_dig_tx_fifo_mem_b_wptr[0]), .Y(n208) );
  MUX21X1_LVT U130 ( .A1(fifo[22]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(n6), .Y(n46) );
  MUX21X1_LVT U131 ( .A1(fifo[21]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(n6), 
        .Y(n45) );
  MUX21X1_LVT U132 ( .A1(fifo[20]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(n6), 
        .Y(n44) );
  MUX21X1_LVT U133 ( .A1(fifo[19]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(n6), 
        .Y(n43) );
  MUX21X1_LVT U134 ( .A1(fifo[18]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(n6), 
        .Y(n42) );
  MUX21X1_LVT U135 ( .A1(fifo[17]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(n6), 
        .Y(n41) );
  MUX21X1_LVT U136 ( .A1(fifo[16]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(n6), 
        .Y(n40) );
  MUX21X1_LVT U137 ( .A1(fifo[15]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(n6), 
        .Y(n39) );
  MUX21X1_LVT U138 ( .A1(fifo[14]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(n6), 
        .Y(n38) );
  MUX21X1_LVT U139 ( .A1(fifo[13]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(n6), 
        .Y(n37) );
  MUX21X1_LVT U140 ( .A1(fifo[12]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(n6), 
        .Y(n36) );
  MUX21X1_LVT U141 ( .A1(fifo[34]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(n7), .Y(n58) );
  MUX21X1_LVT U142 ( .A1(fifo[33]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(n7), 
        .Y(n57) );
  MUX21X1_LVT U143 ( .A1(fifo[32]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(n7), 
        .Y(n56) );
  MUX21X1_LVT U144 ( .A1(fifo[31]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(n7), 
        .Y(n55) );
  MUX21X1_LVT U145 ( .A1(fifo[30]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(n7), 
        .Y(n54) );
  MUX21X1_LVT U146 ( .A1(fifo[29]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(n7), 
        .Y(n53) );
  MUX21X1_LVT U147 ( .A1(fifo[28]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(n7), 
        .Y(n52) );
  MUX21X1_LVT U148 ( .A1(fifo[27]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(n7), 
        .Y(n51) );
  MUX21X1_LVT U149 ( .A1(fifo[26]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(n7), 
        .Y(n50) );
  MUX21X1_LVT U150 ( .A1(fifo[25]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(n7), 
        .Y(n49) );
  MUX21X1_LVT U151 ( .A1(fifo[24]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(n7), 
        .Y(n48) );
  MUX21X1_LVT U152 ( .A1(fifo[46]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(n8), .Y(n70) );
  MUX21X1_LVT U153 ( .A1(fifo[45]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(n8), 
        .Y(n69) );
  MUX21X1_LVT U154 ( .A1(fifo[44]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(n8), 
        .Y(n68) );
  MUX21X1_LVT U155 ( .A1(fifo[43]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(n8), 
        .Y(n67) );
  MUX21X1_LVT U156 ( .A1(fifo[42]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(n8), 
        .Y(n66) );
  MUX21X1_LVT U157 ( .A1(fifo[41]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(n8), 
        .Y(n65) );
  MUX21X1_LVT U158 ( .A1(fifo[40]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(n8), 
        .Y(n64) );
  MUX21X1_LVT U159 ( .A1(fifo[39]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(n8), 
        .Y(n63) );
  MUX21X1_LVT U160 ( .A1(fifo[38]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(n8), 
        .Y(n62) );
  MUX21X1_LVT U161 ( .A1(fifo[37]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(n8), 
        .Y(n61) );
  MUX21X1_LVT U162 ( .A1(fifo[36]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(n8), 
        .Y(n60) );
  INVX1_LVT U163 ( .A(i_dig_tx_fifo_mem_b_wptr[2]), .Y(n202) );
  NAND2X0_LVT U164 ( .A1(n910), .A2(n120), .Y(n204) );
  MUX21X1_LVT U165 ( .A1(fifo[58]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(
        n198), .Y(n82) );
  MUX21X1_LVT U166 ( .A1(fifo[57]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(
        n198), .Y(n81) );
  MUX21X1_LVT U167 ( .A1(fifo[56]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(
        n198), .Y(n80) );
  MUX21X1_LVT U168 ( .A1(fifo[55]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(
        n198), .Y(n79) );
  MUX21X1_LVT U169 ( .A1(fifo[54]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(
        n198), .Y(n78) );
  MUX21X1_LVT U170 ( .A1(fifo[53]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(
        n198), .Y(n77) );
  MUX21X1_LVT U171 ( .A1(fifo[52]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(
        n198), .Y(n76) );
  MUX21X1_LVT U172 ( .A1(fifo[51]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        n198), .Y(n75) );
  MUX21X1_LVT U173 ( .A1(fifo[50]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        n198), .Y(n74) );
  MUX21X1_LVT U174 ( .A1(fifo[49]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        n198), .Y(n73) );
  MUX21X1_LVT U175 ( .A1(fifo[48]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        n198), .Y(n72) );
  MUX21X1_LVT U176 ( .A1(fifo[70]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(
        n209), .Y(n94) );
  MUX21X1_LVT U177 ( .A1(fifo[69]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(
        n209), .Y(n93) );
  MUX21X1_LVT U178 ( .A1(fifo[68]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(
        n209), .Y(n92) );
  MUX21X1_LVT U179 ( .A1(fifo[67]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(
        n209), .Y(n91) );
  MUX21X1_LVT U180 ( .A1(fifo[66]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(
        n200), .Y(n90) );
  MUX21X1_LVT U181 ( .A1(fifo[65]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(
        n209), .Y(n89) );
  MUX21X1_LVT U182 ( .A1(fifo[64]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(
        n200), .Y(n88) );
  MUX21X1_LVT U183 ( .A1(fifo[63]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        n200), .Y(n87) );
  MUX21X1_LVT U184 ( .A1(fifo[62]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        n200), .Y(n86) );
  MUX21X1_LVT U185 ( .A1(fifo[61]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        n200), .Y(n85) );
  MUX21X1_LVT U186 ( .A1(fifo[60]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        n200), .Y(n84) );
  MUX21X1_LVT U187 ( .A1(fifo[82]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(
        n210), .Y(n106) );
  MUX21X1_LVT U188 ( .A1(fifo[81]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(
        n210), .Y(n105) );
  MUX21X1_LVT U189 ( .A1(fifo[80]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(
        n210), .Y(n104) );
  MUX21X1_LVT U190 ( .A1(fifo[79]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(
        n210), .Y(n103) );
  MUX21X1_LVT U191 ( .A1(fifo[78]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(
        n201), .Y(n102) );
  MUX21X1_LVT U192 ( .A1(fifo[77]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(
        n210), .Y(n101) );
  MUX21X1_LVT U193 ( .A1(fifo[76]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(
        n201), .Y(n100) );
  MUX21X1_LVT U194 ( .A1(fifo[75]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        n201), .Y(n99) );
  MUX21X1_LVT U195 ( .A1(fifo[74]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        n201), .Y(n98) );
  MUX21X1_LVT U196 ( .A1(fifo[73]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        n201), .Y(n97) );
  MUX21X1_LVT U197 ( .A1(fifo[72]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        n201), .Y(n96) );
  MUX21X1_LVT U198 ( .A1(fifo[94]), .A2(i_dig_tx_fifo_mem_data_in[10]), .S0(
        n199), .Y(n118) );
  MUX21X1_LVT U199 ( .A1(fifo[93]), .A2(i_dig_tx_fifo_mem_data_in[9]), .S0(
        n199), .Y(n117) );
  MUX21X1_LVT U200 ( .A1(fifo[92]), .A2(i_dig_tx_fifo_mem_data_in[8]), .S0(
        n199), .Y(n116) );
  MUX21X1_LVT U201 ( .A1(fifo[91]), .A2(i_dig_tx_fifo_mem_data_in[7]), .S0(
        n199), .Y(n115) );
  MUX21X1_LVT U202 ( .A1(fifo[90]), .A2(i_dig_tx_fifo_mem_data_in[6]), .S0(
        n199), .Y(n114) );
  MUX21X1_LVT U203 ( .A1(fifo[89]), .A2(i_dig_tx_fifo_mem_data_in[5]), .S0(
        n199), .Y(n113) );
  MUX21X1_LVT U204 ( .A1(fifo[88]), .A2(i_dig_tx_fifo_mem_data_in[4]), .S0(
        n199), .Y(n112) );
  MUX21X1_LVT U205 ( .A1(fifo[87]), .A2(i_dig_tx_fifo_mem_data_in[3]), .S0(
        n199), .Y(n111) );
  MUX21X1_LVT U206 ( .A1(fifo[86]), .A2(i_dig_tx_fifo_mem_data_in[2]), .S0(
        n199), .Y(n110) );
  MUX21X1_LVT U207 ( .A1(fifo[85]), .A2(i_dig_tx_fifo_mem_data_in[1]), .S0(
        n199), .Y(n109) );
  MUX21X1_LVT U208 ( .A1(fifo[84]), .A2(i_dig_tx_fifo_mem_data_in[0]), .S0(
        n199), .Y(n108) );
  MUX21X1_LVT U209 ( .A1(fifo[11]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(n2), .Y(n35) );
  MUX21X1_LVT U210 ( .A1(fifo[23]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(n6), .Y(n47) );
  MUX21X1_LVT U211 ( .A1(fifo[35]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(n7), .Y(n59) );
  MUX21X1_LVT U212 ( .A1(fifo[47]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(n8), .Y(n71) );
  MUX21X1_LVT U213 ( .A1(fifo[59]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(
        n198), .Y(n83) );
  MUX21X1_LVT U214 ( .A1(fifo[71]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(
        n209), .Y(n95) );
  MUX21X1_LVT U215 ( .A1(fifo[83]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(
        n210), .Y(n107) );
  MUX21X1_LVT U216 ( .A1(fifo[95]), .A2(i_dig_tx_fifo_mem_data_in[11]), .S0(
        n199), .Y(n119) );
endmodule



    module dig_tx_asyn_fifo_FIFO_DEPTH8_REGISTER_WIDTH8_ADDRESS_WIDTH3_VALID_WIDTH1 ( 
        i_dig_tx_asyn_fifo_clk26, i_dig_tx_asyn_fifo_clk32, 
        i_dig_tx_asyn_fifo_wr_rst_n, i_dig_tx_asyn_fifo_re_rst_n, 
        i_dig_tx_asyn_fifo_wr_en, i_dig_tx_asyn_fifo_re_en, 
        i_dig_tx_asyn_fifo_data_in, o_dig_tx_asyn_fifo_data_out, 
        o_dig_tx_asyn_fifo_empty );
  input [11:0] i_dig_tx_asyn_fifo_data_in;
  output [11:0] o_dig_tx_asyn_fifo_data_out;
  input i_dig_tx_asyn_fifo_clk26, i_dig_tx_asyn_fifo_clk32,
         i_dig_tx_asyn_fifo_wr_rst_n, i_dig_tx_asyn_fifo_re_rst_n,
         i_dig_tx_asyn_fifo_wr_en, i_dig_tx_asyn_fifo_re_en;
  output o_dig_tx_asyn_fifo_empty;
  wire   asyn_fifo_full, n1, n2, n3, n4, n5;
  wire   [3:0] g_wptr;
  wire   [3:0] g_wptr_sync;
  wire   [3:0] g_rptr;
  wire   [3:0] g_rptr_sync;
  wire   [3:0] b_wptr;
  wire   [3:0] b_rptr;

  NBUFFX2_HVT U1 ( .A(i_dig_tx_asyn_fifo_wr_en), .Y(n1) );
  INVX1_LVT U2 ( .A(n5), .Y(n4) );
  INVX1_LVT U3 ( .A(i_dig_tx_asyn_fifo_wr_rst_n), .Y(n5) );
  INVX1_LVT U4 ( .A(n3), .Y(n2) );
  INVX1_LVT U5 ( .A(i_dig_tx_asyn_fifo_re_rst_n), .Y(n3) );
  dig_tx_fifo_synchronizer_PTR_WIDTH3_0 sync_wptr ( 
        .i_dig_tx_fifo_synchronizer_clk(i_dig_tx_asyn_fifo_clk32), 
        .i_dig_tx_fifo_synchronizer_rst_n(n2), 
        .i_dig_tx_fifo_synchronizer_d_in(g_wptr), 
        .o_dig_tx_fifo_synchronizer_d_out(g_wptr_sync) );
  dig_tx_fifo_synchronizer_PTR_WIDTH3_1 sync_rptr ( 
        .i_dig_tx_fifo_synchronizer_clk(i_dig_tx_asyn_fifo_clk26), 
        .i_dig_tx_fifo_synchronizer_rst_n(n4), 
        .i_dig_tx_fifo_synchronizer_d_in(g_rptr), 
        .o_dig_tx_fifo_synchronizer_d_out(g_rptr_sync) );
  dig_tx_fifo_wr_ptr_handler_PTR_WIDTH3 wptr_h ( 
        .i_dig_tx_fifo_wr_ptr_handler_clk26(i_dig_tx_asyn_fifo_clk26), 
        .i_dig_tx_fifo_wr_ptr_handler_wr_rst_n(n4), 
        .i_dig_tx_fifo_wr_ptr_handler_wr_en(i_dig_tx_asyn_fifo_wr_en), 
        .i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync(g_rptr_sync), 
        .o_dig_tx_fifo_wr_ptr_handler_b_wptr(b_wptr), 
        .o_dig_tx_fifo_wr_ptr_handler_g_wptr(g_wptr), 
        .o_dig_tx_fifo_wr_ptr_handler_full(asyn_fifo_full) );
  dig_tx_fifo_re_ptr_handler_PTR_WIDTH3 rptr_h ( 
        .i_dig_tx_fifo_re_ptr_handler_clk32(i_dig_tx_asyn_fifo_clk32), 
        .i_dig_tx_fifo_re_ptr_handler_re_rst_n(n2), 
        .i_dig_tx_fifo_re_ptr_handler_re_en(i_dig_tx_asyn_fifo_re_en), 
        .i_dig_tx_fifo_re_ptr_handler_g_wptr_sync(g_wptr_sync), 
        .o_dig_tx_fifo_re_ptr_handler_b_rptr(b_rptr), 
        .o_dig_tx_fifo_re_ptr_handler_g_rptr(g_rptr), 
        .o_dig_tx_fifo_re_ptr_handler_empty(o_dig_tx_asyn_fifo_empty) );
  dig_tx_fifo_mem_FIFO_DEPTH8_REGISTER_WIDTH12_PTR_WIDTH3 fifom ( 
        .i_dig_tx_fifo_mem_clk26(i_dig_tx_asyn_fifo_clk26), 
        .i_dig_tx_fifo_mem_wr_en(n1), .i_dig_tx_fifo_mem_b_wptr(b_wptr), 
        .i_dig_tx_fifo_mem_b_rptr(b_rptr), .i_dig_tx_fifo_mem_data_in(
        i_dig_tx_asyn_fifo_data_in), .i_dig_tx_fifo_mem_full(asyn_fifo_full), 
        .o_dig_tx_fifo_mem_data_out(o_dig_tx_asyn_fifo_data_out) );
endmodule


module dig_tx_pulse_delayed ( i_dix_pulse_delayed_clk32, 
        i_dix_pulse_delayed_rst_n, i_dix_pulse_delayed_din, o_dix_pulse_d0 );
  input i_dix_pulse_delayed_clk32, i_dix_pulse_delayed_rst_n,
         i_dix_pulse_delayed_din;
  output o_dix_pulse_d0;
  wire   reg_delayed;

  DFFARX1_LVT o_dix_pulse_d0_reg ( .D(reg_delayed), .CLK(
        i_dix_pulse_delayed_clk32), .RSTB(i_dix_pulse_delayed_rst_n), .Q(
        o_dix_pulse_d0) );
  DFFARX1_HVT reg_delayed_reg ( .D(i_dix_pulse_delayed_din), .CLK(
        i_dix_pulse_delayed_clk32), .RSTB(i_dix_pulse_delayed_rst_n), .Q(
        reg_delayed) );
endmodule


module dig_tx_fifo_synchronizer_PTR_WIDTH2_0 ( i_dig_tx_fifo_synchronizer_clk, 
        i_dig_tx_fifo_synchronizer_rst_n, i_dig_tx_fifo_synchronizer_d_in, 
        o_dig_tx_fifo_synchronizer_d_out );
  input [2:0] i_dig_tx_fifo_synchronizer_d_in;
  output [2:0] o_dig_tx_fifo_synchronizer_d_out;
  input i_dig_tx_fifo_synchronizer_clk, i_dig_tx_fifo_synchronizer_rst_n;

  wire   [2:0] metastable_flop;

  DFFARX1_LVT metastable_flop_reg_2_ ( .D(i_dig_tx_fifo_synchronizer_d_in[2]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .Q(metastable_flop[2]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_2_ ( .D(metastable_flop[2]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .Q(
        o_dig_tx_fifo_synchronizer_d_out[2]) );
  DFFARX1_LVT metastable_flop_reg_1_ ( .D(i_dig_tx_fifo_synchronizer_d_in[1]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .Q(metastable_flop[1]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_1_ ( .D(metastable_flop[1]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .Q(
        o_dig_tx_fifo_synchronizer_d_out[1]) );
  DFFARX1_LVT metastable_flop_reg_0_ ( .D(i_dig_tx_fifo_synchronizer_d_in[0]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .Q(metastable_flop[0]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_0_ ( .D(metastable_flop[0]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .Q(
        o_dig_tx_fifo_synchronizer_d_out[0]) );
endmodule


module dig_tx_fifo_synchronizer_PTR_WIDTH2_1 ( i_dig_tx_fifo_synchronizer_clk, 
        i_dig_tx_fifo_synchronizer_rst_n, i_dig_tx_fifo_synchronizer_d_in, 
        o_dig_tx_fifo_synchronizer_d_out );
  input [2:0] i_dig_tx_fifo_synchronizer_d_in;
  output [2:0] o_dig_tx_fifo_synchronizer_d_out;
  input i_dig_tx_fifo_synchronizer_clk, i_dig_tx_fifo_synchronizer_rst_n;

  wire   [2:0] metastable_flop;

  DFFARX1_LVT metastable_flop_reg_2_ ( .D(i_dig_tx_fifo_synchronizer_d_in[2]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .Q(metastable_flop[2]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_2_ ( .D(metastable_flop[2]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .Q(
        o_dig_tx_fifo_synchronizer_d_out[2]) );
  DFFARX1_LVT metastable_flop_reg_1_ ( .D(i_dig_tx_fifo_synchronizer_d_in[1]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .Q(metastable_flop[1]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_1_ ( .D(metastable_flop[1]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .Q(
        o_dig_tx_fifo_synchronizer_d_out[1]) );
  DFFARX1_LVT metastable_flop_reg_0_ ( .D(i_dig_tx_fifo_synchronizer_d_in[0]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .Q(metastable_flop[0]) );
  DFFARX1_LVT o_dig_tx_fifo_synchronizer_d_out_reg_0_ ( .D(metastable_flop[0]), 
        .CLK(i_dig_tx_fifo_synchronizer_clk), .RSTB(
        i_dig_tx_fifo_synchronizer_rst_n), .Q(
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
  wire   wfull, n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [2:0] b_wptr_next;
  wire   [1:0] g_wptr_next;

  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_0_ ( .D(b_wptr_next[0]), 
        .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n8), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]) );
  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_full_reg ( .D(wfull), .CLK(
        i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n8), .Q(
        o_dig_tx_fifo_wr_ptr_handler_full), .QN(n1) );
  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_1_ ( .D(b_wptr_next[1]), 
        .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n8), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[1]) );
  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_b_wptr_reg_2_ ( .D(b_wptr_next[2]), 
        .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n8), .Q(
        o_dig_tx_fifo_wr_ptr_handler_b_wptr[2]) );
  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_2_ ( .D(b_wptr_next[2]), 
        .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n8), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[2]) );
  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_1_ ( .D(g_wptr_next[1]), 
        .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n8), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[1]) );
  DFFARX1_LVT o_dig_tx_fifo_wr_ptr_handler_g_wptr_reg_0_ ( .D(g_wptr_next[0]), 
        .CLK(i_dig_tx_fifo_wr_ptr_handler_clk26), .RSTB(n8), .Q(
        o_dig_tx_fifo_wr_ptr_handler_g_wptr[0]) );
  AND3X1_LVT U3 ( .A1(n2), .A2(n3), .A3(n4), .Y(wfull) );
  NAND2X0_LVT U10 ( .A1(o_dig_tx_fifo_wr_ptr_handler_b_wptr[1]), .A2(n6), .Y(
        n5) );
  AND2X1_LVT U12 ( .A1(o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]), .A2(n7), .Y(n6) );
  AND2X1_LVT U14 ( .A1(i_dig_tx_fifo_wr_ptr_handler_wr_en), .A2(n1), .Y(n7) );
  XOR2X1_LVT U4 ( .A1(i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[1]), .A2(
        g_wptr_next[1]), .Y(n2) );
  XOR2X2_LVT U5 ( .A1(b_wptr_next[2]), .A2(b_wptr_next[1]), .Y(g_wptr_next[1])
         );
  XNOR2X1_LVT U6 ( .A1(n5), .A2(o_dig_tx_fifo_wr_ptr_handler_b_wptr[2]), .Y(
        b_wptr_next[2]) );
  XOR2X1_LVT U7 ( .A1(n7), .A2(o_dig_tx_fifo_wr_ptr_handler_b_wptr[0]), .Y(
        b_wptr_next[0]) );
  XOR2X1_LVT U8 ( .A1(b_wptr_next[1]), .A2(b_wptr_next[0]), .Y(g_wptr_next[0])
         );
  INVX2_LVT U9 ( .A(n9), .Y(n8) );
  INVX1_LVT U11 ( .A(i_dig_tx_fifo_wr_ptr_handler_wr_rst_n), .Y(n9) );
  XOR2X1_LVT U13 ( .A1(n6), .A2(o_dig_tx_fifo_wr_ptr_handler_b_wptr[1]), .Y(
        b_wptr_next[1]) );
  XNOR2X1_LVT U15 ( .A1(g_wptr_next[0]), .A2(
        i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[0]), .Y(n4) );
  XOR2X1_LVT U16 ( .A1(i_dig_tx_fifo_wr_ptr_handler_g_rptr_sync[2]), .A2(
        b_wptr_next[2]), .Y(n3) );
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
  wire   n18, imediate_empty, n1, n2, n3, n4, n5, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17;
  wire   [1:0] b_rptr_next;

  DFFASX1_LVT o_dig_tx_fifo_re_ptr_handler_empty_reg ( .D(imediate_empty), 
        .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .SETB(n9), .Q(
        o_dig_tx_fifo_re_ptr_handler_empty), .QN(n1) );
  DFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_1_ ( .D(b_rptr_next[1]), 
        .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(
        o_dig_tx_fifo_re_ptr_handler_b_rptr[1]) );
  DFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_2_ ( .D(n17), .CLK(
        i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(
        o_dig_tx_fifo_re_ptr_handler_b_rptr[2]) );
  DFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_2_ ( .D(n17), .CLK(
        i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[2]) );
  DFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_1_ ( .D(n7), .CLK(
        i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[1]) );
  DFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_g_rptr_reg_0_ ( .D(n8), .CLK(
        i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(
        o_dig_tx_fifo_re_ptr_handler_g_rptr[0]) );
  AND3X1_LVT U3 ( .A1(n2), .A2(n3), .A3(n4), .Y(imediate_empty) );
  DFFARX1_LVT o_dig_tx_fifo_re_ptr_handler_b_rptr_reg_0_ ( .D(b_rptr_next[0]), 
        .CLK(i_dig_tx_fifo_re_ptr_handler_clk32), .RSTB(n9), .Q(n18), .QN(n5)
         );
  NAND2X0_RVT U4 ( .A1(o_dig_tx_fifo_re_ptr_handler_b_rptr[1]), .A2(n13), .Y(
        n14) );
  INVX1_LVT U5 ( .A(n5), .Y(o_dig_tx_fifo_re_ptr_handler_b_rptr[0]) );
  XNOR2X1_LVT U6 ( .A1(n16), .A2(n17), .Y(n7) );
  XNOR2X1_LVT U7 ( .A1(n15), .A2(b_rptr_next[1]), .Y(n8) );
  INVX2_LVT U8 ( .A(n10), .Y(n9) );
  INVX1_LVT U9 ( .A(i_dig_tx_fifo_re_ptr_handler_re_rst_n), .Y(n10) );
  XNOR2X1_LVT U10 ( .A1(n14), .A2(o_dig_tx_fifo_re_ptr_handler_b_rptr[2]), .Y(
        n17) );
  INVX1_LVT U11 ( .A(n12), .Y(n13) );
  XOR2X1_HVT U12 ( .A1(n12), .A2(o_dig_tx_fifo_re_ptr_handler_b_rptr[1]), .Y(
        n16) );
  XOR2X1_HVT U13 ( .A1(n11), .A2(n18), .Y(n15) );
  XNOR2X1_LVT U14 ( .A1(n17), .A2(i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[2]), 
        .Y(n3) );
  XNOR2X1_LVT U15 ( .A1(n8), .A2(i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[0]), 
        .Y(n2) );
  XNOR2X1_LVT U16 ( .A1(n7), .A2(i_dig_tx_fifo_re_ptr_handler_g_wptr_sync[1]), 
        .Y(n4) );
  NAND2X0_LVT U17 ( .A1(i_dig_tx_fifo_re_ptr_handler_re_en), .A2(n1), .Y(n11)
         );
  INVX1_LVT U18 ( .A(n15), .Y(b_rptr_next[0]) );
  NAND3X0_LVT U19 ( .A1(n18), .A2(n1), .A3(i_dig_tx_fifo_re_ptr_handler_re_en), 
        .Y(n12) );
  INVX1_LVT U20 ( .A(n16), .Y(b_rptr_next[1]) );
endmodule


module dig_tx_fifo_mem_FIFO_DEPTH3_REGISTER_WIDTH8_PTR_WIDTH2 ( 
        i_dig_tx_fifo_mem_clk26, i_dig_tx_fifo_mem_wr_en, 
        i_dig_tx_fifo_mem_b_wptr, i_dig_tx_fifo_mem_b_rptr, 
        i_dig_tx_fifo_mem_data_in, i_dig_tx_fifo_mem_full, 
        o_dig_tx_fifo_mem_data_out );
  input [2:0] i_dig_tx_fifo_mem_b_wptr;
  input [2:0] i_dig_tx_fifo_mem_b_rptr;
  input [7:0] i_dig_tx_fifo_mem_data_in;
  output [7:0] o_dig_tx_fifo_mem_data_out;
  input i_dig_tx_fifo_mem_clk26, i_dig_tx_fifo_mem_wr_en,
         i_dig_tx_fifo_mem_full;
  wire   n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62;
  wire   [23:0] fifo;

  DFFX1_LVT fifo_reg_0__7_ ( .D(n35), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[23]) );
  DFFX1_LVT fifo_reg_0__6_ ( .D(n34), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[22]) );
  DFFX1_LVT fifo_reg_0__5_ ( .D(n33), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[21]) );
  DFFX1_LVT fifo_reg_0__4_ ( .D(n32), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[20]) );
  DFFX1_LVT fifo_reg_0__3_ ( .D(n31), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[19]) );
  DFFX1_LVT fifo_reg_0__2_ ( .D(n30), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[18]) );
  DFFX1_LVT fifo_reg_0__1_ ( .D(n29), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[17]) );
  DFFX1_LVT fifo_reg_0__0_ ( .D(n28), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[16]) );
  DFFX1_LVT fifo_reg_1__7_ ( .D(n27), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[15]) );
  DFFX1_LVT fifo_reg_1__6_ ( .D(n26), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[14]) );
  DFFX1_LVT fifo_reg_1__5_ ( .D(n25), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[13]) );
  DFFX1_LVT fifo_reg_1__4_ ( .D(n24), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[12]) );
  DFFX1_LVT fifo_reg_1__3_ ( .D(n23), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[11]) );
  DFFX1_LVT fifo_reg_1__2_ ( .D(n22), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[10]) );
  DFFX1_LVT fifo_reg_1__1_ ( .D(n21), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[9]) );
  DFFX1_LVT fifo_reg_1__0_ ( .D(n20), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[8]) );
  DFFX1_LVT fifo_reg_2__7_ ( .D(n19), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[7]) );
  DFFX1_LVT fifo_reg_2__6_ ( .D(n18), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[6]) );
  DFFX1_LVT fifo_reg_2__5_ ( .D(n17), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[5]) );
  DFFX1_LVT fifo_reg_2__4_ ( .D(n16), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[4]) );
  DFFX1_LVT fifo_reg_2__3_ ( .D(n15), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[3]), .QN(n5) );
  DFFX1_LVT fifo_reg_2__2_ ( .D(n14), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[2]) );
  DFFX1_LVT fifo_reg_2__1_ ( .D(n13), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[1]) );
  DFFX1_LVT fifo_reg_2__0_ ( .D(n12), .CLK(i_dig_tx_fifo_mem_clk26), .Q(
        fifo[0]) );
  INVX1_LVT U2 ( .A(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n52) );
  NAND3X0_LVT U3 ( .A1(n9), .A2(n36), .A3(n11), .Y(n58) );
  NAND3X0_LVT U4 ( .A1(fifo[20]), .A2(n53), .A3(n52), .Y(n46) );
  NAND2X0_LVT U5 ( .A1(n57), .A2(i_dig_tx_fifo_mem_data_in[0]), .Y(n1) );
  NAND2X0_LVT U6 ( .A1(fifo[16]), .A2(n58), .Y(n2) );
  NAND2X0_LVT U7 ( .A1(n1), .A2(n2), .Y(n28) );
  AND2X1_LVT U8 ( .A1(fifo[19]), .A2(n52), .Y(n3) );
  AND2X1_LVT U9 ( .A1(fifo[21]), .A2(n52), .Y(n4) );
  INVX1_LVT U10 ( .A(i_dig_tx_fifo_mem_b_rptr[1]), .Y(n53) );
  NAND3X0_RVT U11 ( .A1(n53), .A2(fifo[17]), .A3(n52), .Y(n37) );
  NAND3X0_RVT U12 ( .A1(n53), .A2(fifo[18]), .A3(n52), .Y(n40) );
  NAND3X0_RVT U13 ( .A1(n52), .A2(fifo[22]), .A3(n53), .Y(n54) );
  NAND2X0_RVT U14 ( .A1(fifo[4]), .A2(n6), .Y(n47) );
  OR2X1_LVT U15 ( .A1(n5), .A2(n53), .Y(n44) );
  NBUFFX2_LVT U16 ( .A(i_dig_tx_fifo_mem_b_rptr[1]), .Y(n6) );
  AND2X1_LVT U17 ( .A1(n45), .A2(n44), .Y(n7) );
  NAND2X0_LVT U18 ( .A1(n4), .A2(n53), .Y(n49) );
  NAND2X0_LVT U19 ( .A1(n3), .A2(n53), .Y(n43) );
  AO222X1_RVT U20 ( .A1(fifo[15]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .A3(
        fifo[23]), .A4(n8), .A5(fifo[7]), .A6(n6), .Y(
        o_dig_tx_fifo_mem_data_out[7]) );
  NAND2X0_LVT U21 ( .A1(n7), .A2(n43), .Y(o_dig_tx_fifo_mem_data_out[3]) );
  NAND2X0_HVT U22 ( .A1(fifo[11]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n45)
         );
  AND2X1_LVT U23 ( .A1(n53), .A2(n52), .Y(n8) );
  NAND2X0_HVT U24 ( .A1(fifo[6]), .A2(n6), .Y(n55) );
  NAND2X0_HVT U25 ( .A1(fifo[1]), .A2(n6), .Y(n38) );
  NAND2X0_HVT U26 ( .A1(fifo[2]), .A2(n6), .Y(n41) );
  NAND2X0_HVT U27 ( .A1(fifo[5]), .A2(n6), .Y(n50) );
  AND2X1_HVT U28 ( .A1(i_dig_tx_fifo_mem_wr_en), .A2(n10), .Y(n9) );
  INVX1_LVT U29 ( .A(i_dig_tx_fifo_mem_full), .Y(n10) );
  INVX1_LVT U30 ( .A(i_dig_tx_fifo_mem_b_wptr[0]), .Y(n36) );
  INVX1_LVT U31 ( .A(i_dig_tx_fifo_mem_b_wptr[1]), .Y(n11) );
  INVX1_LVT U32 ( .A(n58), .Y(n57) );
  NAND3X0_LVT U33 ( .A1(i_dig_tx_fifo_mem_b_wptr[0]), .A2(n9), .A3(n11), .Y(
        n60) );
  INVX1_LVT U34 ( .A(n60), .Y(n59) );
  AO22X1_LVT U35 ( .A1(i_dig_tx_fifo_mem_data_in[0]), .A2(n59), .A3(fifo[8]), 
        .A4(n60), .Y(n20) );
  NAND3X0_LVT U36 ( .A1(i_dig_tx_fifo_mem_b_wptr[1]), .A2(n9), .A3(n36), .Y(
        n62) );
  INVX1_LVT U37 ( .A(n62), .Y(n61) );
  AO22X1_LVT U38 ( .A1(i_dig_tx_fifo_mem_data_in[0]), .A2(n61), .A3(fifo[0]), 
        .A4(n62), .Y(n12) );
  AO222X1_LVT U39 ( .A1(fifo[8]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .A3(
        fifo[16]), .A4(n8), .A5(fifo[0]), .A6(n6), .Y(
        o_dig_tx_fifo_mem_data_out[0]) );
  AO22X1_LVT U40 ( .A1(i_dig_tx_fifo_mem_data_in[1]), .A2(n59), .A3(fifo[9]), 
        .A4(n60), .Y(n21) );
  AO22X1_LVT U41 ( .A1(i_dig_tx_fifo_mem_data_in[1]), .A2(n61), .A3(fifo[1]), 
        .A4(n62), .Y(n13) );
  AO22X1_LVT U42 ( .A1(i_dig_tx_fifo_mem_data_in[1]), .A2(n57), .A3(fifo[17]), 
        .A4(n58), .Y(n29) );
  NAND2X0_LVT U43 ( .A1(fifo[9]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n39) );
  NAND3X0_LVT U44 ( .A1(n39), .A2(n38), .A3(n37), .Y(
        o_dig_tx_fifo_mem_data_out[1]) );
  AO22X1_LVT U45 ( .A1(i_dig_tx_fifo_mem_data_in[2]), .A2(n59), .A3(fifo[10]), 
        .A4(n60), .Y(n22) );
  AO22X1_LVT U46 ( .A1(i_dig_tx_fifo_mem_data_in[2]), .A2(n61), .A3(fifo[2]), 
        .A4(n62), .Y(n14) );
  AO22X1_LVT U47 ( .A1(i_dig_tx_fifo_mem_data_in[2]), .A2(n57), .A3(fifo[18]), 
        .A4(n58), .Y(n30) );
  NAND2X0_LVT U48 ( .A1(fifo[10]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n42)
         );
  NAND3X0_LVT U49 ( .A1(n42), .A2(n41), .A3(n40), .Y(
        o_dig_tx_fifo_mem_data_out[2]) );
  AO22X1_LVT U50 ( .A1(i_dig_tx_fifo_mem_data_in[3]), .A2(n59), .A3(fifo[11]), 
        .A4(n60), .Y(n23) );
  AO22X1_LVT U51 ( .A1(i_dig_tx_fifo_mem_data_in[3]), .A2(n61), .A3(fifo[3]), 
        .A4(n62), .Y(n15) );
  AO22X1_LVT U52 ( .A1(i_dig_tx_fifo_mem_data_in[3]), .A2(n57), .A3(fifo[19]), 
        .A4(n58), .Y(n31) );
  AO22X1_LVT U53 ( .A1(fifo[12]), .A2(n60), .A3(i_dig_tx_fifo_mem_data_in[4]), 
        .A4(n59), .Y(n24) );
  AO22X1_LVT U54 ( .A1(fifo[4]), .A2(n62), .A3(i_dig_tx_fifo_mem_data_in[4]), 
        .A4(n61), .Y(n16) );
  AO22X1_LVT U55 ( .A1(fifo[20]), .A2(n58), .A3(i_dig_tx_fifo_mem_data_in[4]), 
        .A4(n57), .Y(n32) );
  NAND2X0_LVT U56 ( .A1(fifo[12]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n48)
         );
  NAND3X0_LVT U57 ( .A1(n48), .A2(n47), .A3(n46), .Y(
        o_dig_tx_fifo_mem_data_out[4]) );
  AO22X1_LVT U58 ( .A1(fifo[13]), .A2(n60), .A3(i_dig_tx_fifo_mem_data_in[5]), 
        .A4(n59), .Y(n25) );
  AO22X1_LVT U59 ( .A1(fifo[5]), .A2(n62), .A3(i_dig_tx_fifo_mem_data_in[5]), 
        .A4(n61), .Y(n17) );
  AO22X1_LVT U60 ( .A1(fifo[21]), .A2(n58), .A3(i_dig_tx_fifo_mem_data_in[5]), 
        .A4(n57), .Y(n33) );
  NAND2X0_LVT U61 ( .A1(fifo[13]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n51)
         );
  NAND3X0_LVT U62 ( .A1(n51), .A2(n50), .A3(n49), .Y(
        o_dig_tx_fifo_mem_data_out[5]) );
  AO22X1_LVT U63 ( .A1(fifo[14]), .A2(n60), .A3(i_dig_tx_fifo_mem_data_in[6]), 
        .A4(n59), .Y(n26) );
  AO22X1_LVT U64 ( .A1(fifo[6]), .A2(n62), .A3(i_dig_tx_fifo_mem_data_in[6]), 
        .A4(n61), .Y(n18) );
  AO22X1_LVT U65 ( .A1(fifo[22]), .A2(n58), .A3(i_dig_tx_fifo_mem_data_in[6]), 
        .A4(n57), .Y(n34) );
  NAND2X0_LVT U66 ( .A1(fifo[14]), .A2(i_dig_tx_fifo_mem_b_rptr[0]), .Y(n56)
         );
  NAND3X0_LVT U67 ( .A1(n56), .A2(n55), .A3(n54), .Y(
        o_dig_tx_fifo_mem_data_out[6]) );
  AO22X1_LVT U68 ( .A1(fifo[23]), .A2(n58), .A3(n57), .A4(
        i_dig_tx_fifo_mem_data_in[7]), .Y(n35) );
  AO22X1_LVT U69 ( .A1(fifo[15]), .A2(n60), .A3(i_dig_tx_fifo_mem_data_in[7]), 
        .A4(n59), .Y(n27) );
  AO22X1_LVT U70 ( .A1(fifo[7]), .A2(n62), .A3(i_dig_tx_fifo_mem_data_in[7]), 
        .A4(n61), .Y(n19) );
endmodule


module dig_tx_asyn_fifo_FIFO_DEPTH3_REGISTER_WIDTH8 ( i_dig_tx_asyn_fifo_clk26, 
        i_dig_tx_asyn_fifo_clk32, i_dig_tx_asyn_fifo_wr_rst_n, 
        i_dig_tx_asyn_fifo_re_rst_n, i_dig_tx_asyn_fifo_wr_en, 
        i_dig_tx_asyn_fifo_re_en, i_dig_tx_asyn_fifo_data_in, 
        o_dig_tx_asyn_fifo_data_out, o_dig_tx_asyn_fifo_empty );
  input [7:0] i_dig_tx_asyn_fifo_data_in;
  output [7:0] o_dig_tx_asyn_fifo_data_out;
  input i_dig_tx_asyn_fifo_clk26, i_dig_tx_asyn_fifo_clk32,
         i_dig_tx_asyn_fifo_wr_rst_n, i_dig_tx_asyn_fifo_re_rst_n,
         i_dig_tx_asyn_fifo_wr_en, i_dig_tx_asyn_fifo_re_en;
  output o_dig_tx_asyn_fifo_empty;
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
  dig_tx_fifo_mem_FIFO_DEPTH3_REGISTER_WIDTH8_PTR_WIDTH2 fifom ( 
        .i_dig_tx_fifo_mem_clk26(i_dig_tx_asyn_fifo_clk26), 
        .i_dig_tx_fifo_mem_wr_en(i_dig_tx_asyn_fifo_wr_en), 
        .i_dig_tx_fifo_mem_b_wptr(b_wptr), .i_dig_tx_fifo_mem_b_rptr(b_rptr), 
        .i_dig_tx_fifo_mem_data_in(i_dig_tx_asyn_fifo_data_in), 
        .i_dig_tx_fifo_mem_full(asyn_fifo_full), .o_dig_tx_fifo_mem_data_out(
        o_dig_tx_asyn_fifo_data_out) );
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
  wire   reg_file_0__3_, reg_file_1__7_, reg_file_1__6_, reg_file_1__5_,
         reg_file_1__4_, reg_file_1__3_, reg_file_1__2_, reg_file_1__1_,
         reg_file_1__0_, reg_file_2__7_, reg_file_2__6_, reg_file_2__5_,
         reg_file_2__4_, reg_file_2__3_, reg_file_2__2_, reg_file_2__1_,
         reg_file_2__0_, reg_file_3__7_, reg_file_3__6_, reg_file_3__5_,
         reg_file_3__4_, reg_file_3__3_, reg_file_3__2_, reg_file_3__1_,
         reg_file_3__0_, reg_file_4__7_, reg_file_4__6_, reg_file_4__5_,
         reg_file_4__4_, reg_file_4__3_, reg_file_4__2_, reg_file_4__1_,
         reg_file_4__0_, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, net15985,
         net15984, net17840, net17845, net18105, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n122, n123,
         n124, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191;

  DFFARX1_LVT reg_file_reg_0__8_ ( .D(n88), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(i_dig_tx_reg_file_rst_n), .QN(net17840) );
  DFFARX1_LVT reg_file_reg_0__3_ ( .D(n89), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(i_dig_tx_reg_file_rst_n), .Q(reg_file_0__3_) );
  DFFARX1_LVT reg_file_reg_0__2_ ( .D(n90), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n157), .Q(o_dig_tx_reg_file_power_domain) );
  DFFARX1_LVT reg_file_reg_0__1_ ( .D(n91), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n157), .Q(o_dig_tx_reg_file_tx_mode) );
  DFFARX1_LVT reg_file_reg_0__0_ ( .D(n92), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n157), .Q(o_dig_tx_reg_file_tx_start) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_1_ ( .D(n64), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n155), .Q(o_dig_tx_reg_file_data_out[1])
         );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_2_ ( .D(n65), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n155), .Q(o_dig_tx_reg_file_data_out[2])
         );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_3_ ( .D(n66), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n155), .Q(o_dig_tx_reg_file_data_out[3])
         );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_4_ ( .D(n67), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n155), .Q(o_dig_tx_reg_file_data_out[4])
         );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_5_ ( .D(n68), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n155), .Q(o_dig_tx_reg_file_data_out[5])
         );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_6_ ( .D(n69), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n154), .Q(o_dig_tx_reg_file_data_out[6])
         );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_7_ ( .D(n70), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n154), .Q(o_dig_tx_reg_file_data_out[7])
         );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_8_ ( .D(n71), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n154), .Q(o_dig_tx_reg_file_data_out[8])
         );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_9_ ( .D(n72), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n154), .Q(o_dig_tx_reg_file_data_out[9])
         );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_10_ ( .D(n73), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n154), .Q(o_dig_tx_reg_file_data_out[10]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_11_ ( .D(n74), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n154), .Q(o_dig_tx_reg_file_data_out[11]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_12_ ( .D(n75), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n154), .Q(o_dig_tx_reg_file_data_out[12]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_13_ ( .D(n76), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n154), .Q(o_dig_tx_reg_file_data_out[13]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_14_ ( .D(n77), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n154), .Q(o_dig_tx_reg_file_data_out[14]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_15_ ( .D(n78), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n154), .Q(o_dig_tx_reg_file_data_out[15]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_16_ ( .D(n79), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n154), .Q(o_dig_tx_reg_file_data_out[16]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_17_ ( .D(n80), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n154), .Q(o_dig_tx_reg_file_data_out[17]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_18_ ( .D(n81), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n153), .Q(o_dig_tx_reg_file_data_out[18]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_19_ ( .D(n82), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n153), .Q(o_dig_tx_reg_file_data_out[19]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_20_ ( .D(n83), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n153), .Q(o_dig_tx_reg_file_data_out[20]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_21_ ( .D(n84), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n153), .Q(o_dig_tx_reg_file_data_out[21]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_22_ ( .D(n85), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n153), .Q(o_dig_tx_reg_file_data_out[22]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_23_ ( .D(n86), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n153), .Q(o_dig_tx_reg_file_data_out[23]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_0_ ( .D(n87), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n153), .Q(o_dig_tx_reg_file_data_out[0])
         );
  DFFARX1_LVT o_dig_tx_reg_file_sys_tx_done_reg ( .D(n120), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n153), .Q(o_dig_tx_reg_file_sys_tx_done)
         );
  DFFARX1_LVT reg_file_reg_4__7_ ( .D(n63), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n153), .Q(reg_file_4__7_) );
  DFFARX1_LVT reg_file_reg_4__6_ ( .D(n61), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n153), .Q(reg_file_4__6_) );
  DFFARX1_LVT reg_file_reg_4__5_ ( .D(n59), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n152), .Q(reg_file_4__5_) );
  DFFARX1_LVT reg_file_reg_4__4_ ( .D(n57), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n152), .Q(reg_file_4__4_) );
  DFFARX1_LVT reg_file_reg_4__3_ ( .D(n55), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n152), .Q(reg_file_4__3_), .QN(n2) );
  DFFARX1_LVT reg_file_reg_4__2_ ( .D(n53), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n152), .Q(reg_file_4__2_), .QN(n23) );
  DFFARX1_LVT reg_file_reg_4__1_ ( .D(n51), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n152), .Q(reg_file_4__1_), .QN(n22) );
  DFFARX1_LVT reg_file_reg_4__0_ ( .D(n49), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n152), .Q(reg_file_4__0_), .QN(n21) );
  DFFASRX1_LVT reg_file_reg_3__3_ ( .D(n116), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n155), .SETB(1'b1), .Q(reg_file_3__3_), .QN(n8) );
  DFFASRX1_LVT reg_file_reg_3__2_ ( .D(n117), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n155), .SETB(1'b1), .Q(reg_file_3__2_), .QN(n18) );
  DFFASRX1_LVT reg_file_reg_3__1_ ( .D(n118), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n155), .SETB(1'b1), .Q(reg_file_3__1_), .QN(n19) );
  DFFASRX1_LVT reg_file_reg_3__0_ ( .D(n119), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n155), .SETB(1'b1), .Q(reg_file_3__0_), .QN(n17) );
  DFFASRX1_LVT reg_file_reg_1__7_ ( .D(n94), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n157), .SETB(1'b1), .Q(reg_file_1__7_) );
  DFFASRX1_LVT reg_file_reg_1__5_ ( .D(n96), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n157), .SETB(1'b1), .Q(reg_file_1__5_) );
  DFFASRX1_LVT reg_file_reg_1__3_ ( .D(n98), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n157), .SETB(1'b1), .Q(reg_file_1__3_), .QN(n20) );
  DFFASRX1_LVT reg_file_reg_1__2_ ( .D(n99), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n157), .SETB(1'b1), .Q(reg_file_1__2_), .QN(n10) );
  DFFASRX1_LVT reg_file_reg_1__1_ ( .D(n100), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n157), .SETB(1'b1), .Q(reg_file_1__1_), .QN(n11) );
  DFFASRX1_LVT reg_file_reg_1__0_ ( .D(n101), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n157), .SETB(1'b1), .Q(reg_file_1__0_), .QN(n9) );
  DFFASRX1_LVT reg_file_reg_2__7_ ( .D(n103), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n156), .SETB(1'b1), .Q(reg_file_2__7_) );
  DFFASRX1_LVT reg_file_reg_2__5_ ( .D(n105), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n156), .SETB(1'b1), .Q(reg_file_2__5_) );
  DFFASRX1_LVT reg_file_reg_2__3_ ( .D(n107), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n156), .SETB(1'b1), .Q(reg_file_2__3_) );
  DFFASRX1_LVT reg_file_reg_2__2_ ( .D(n108), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n156), .SETB(1'b1), .Q(reg_file_2__2_), .QN(n14) );
  DFFASRX1_LVT reg_file_reg_2__1_ ( .D(n109), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n156), .SETB(1'b1), .Q(reg_file_2__1_), .QN(n13) );
  DFFASRX1_LVT reg_file_reg_2__0_ ( .D(n110), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n156), .SETB(1'b1), .Q(reg_file_2__0_), .QN(n12) );
  DFFARX1_LVT reg_file_reg_4__8_ ( .D(n121), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n155), .Q(n30), .QN(net15984) );
  DFFARX1_LVT reg_file_reg_2__8_ ( .D(n102), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n156), .Q(n36) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_31_ ( .D(n62), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(i_dig_tx_reg_file_rst_n), .Q(
        o_dig_tx_reg_file_data_out[31]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_30_ ( .D(n60), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n153), .Q(o_dig_tx_reg_file_data_out[30]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_29_ ( .D(n58), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n152), .Q(o_dig_tx_reg_file_data_out[29]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_28_ ( .D(n56), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n152), .Q(o_dig_tx_reg_file_data_out[28]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_27_ ( .D(n54), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n152), .Q(o_dig_tx_reg_file_data_out[27]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_26_ ( .D(n52), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n152), .Q(o_dig_tx_reg_file_data_out[26]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_25_ ( .D(n50), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n152), .Q(o_dig_tx_reg_file_data_out[25]) );
  DFFARX1_LVT o_dig_tx_reg_file_data_out_reg_24_ ( .D(n48), .CLK(
        i_dig_tx_reg_file_clk), .RSTB(n152), .Q(o_dig_tx_reg_file_data_out[24]) );
  DFFARX1_LVT reg_file_reg_1__8_ ( .D(n93), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n157), .Q(n26), .QN(net17845) );
  DFFARX1_LVT reg_file_reg_3__8_ ( .D(n111), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n156), .Q(n25), .QN(net15985) );
  OA22X1_LVT U3 ( .A1(n29), .A2(n2), .A3(n178), .A4(n1), .Y(n180) );
  IBUFFX32_LVT U4 ( .A(reg_file_2__3_), .Y(n1) );
  OA22X1_LVT U5 ( .A1(n178), .A2(n14), .A3(n29), .A4(n23), .Y(n173) );
  OA22X1_LVT U6 ( .A1(n178), .A2(n13), .A3(n29), .A4(n22), .Y(n169) );
  OA22X1_LVT U7 ( .A1(n178), .A2(n12), .A3(n29), .A4(n21), .Y(n166) );
  INVX4_LVT U8 ( .A(i_dig_tx_reg_file_addr_in[2]), .Y(n29) );
  NAND2X0_LVT U9 ( .A1(reg_file_3__1_), .A2(n3), .Y(n4) );
  NAND2X0_LVT U10 ( .A1(i_dig_tx_reg_file_data_in[1]), .A2(n46), .Y(n5) );
  NAND2X0_LVT U11 ( .A1(n4), .A2(n5), .Y(n118) );
  INVX0_LVT U12 ( .A(n46), .Y(n3) );
  INVX0_LVT U13 ( .A(n29), .Y(n6) );
  AND2X4_LVT U14 ( .A1(n44), .A2(n188), .Y(n46) );
  MUX21X2_LVT U15 ( .A1(reg_file_1__3_), .A2(i_dig_tx_reg_file_data_in[3]), 
        .S0(n43), .Y(n98) );
  MUX21X2_LVT U16 ( .A1(reg_file_1__5_), .A2(i_dig_tx_reg_file_data_in[5]), 
        .S0(n43), .Y(n96) );
  MUX21X2_LVT U17 ( .A1(reg_file_1__7_), .A2(i_dig_tx_reg_file_data_in[7]), 
        .S0(n43), .Y(n94) );
  AND2X2_LVT U18 ( .A1(n123), .A2(n27), .Y(n43) );
  MUX21X2_LVT U19 ( .A1(reg_file_2__6_), .A2(i_dig_tx_reg_file_data_in[6]), 
        .S0(n47), .Y(n104) );
  MUX21X2_LVT U20 ( .A1(reg_file_2__4_), .A2(i_dig_tx_reg_file_data_in[4]), 
        .S0(n47), .Y(n106) );
  AO21X1_RVT U21 ( .A1(n36), .A2(n191), .A3(n47), .Y(n102) );
  MUX21X2_LVT U22 ( .A1(reg_file_2__2_), .A2(i_dig_tx_reg_file_data_in[2]), 
        .S0(n47), .Y(n108) );
  MUX21X2_LVT U23 ( .A1(reg_file_2__0_), .A2(i_dig_tx_reg_file_data_in[0]), 
        .S0(n47), .Y(n110) );
  AND2X4_LVT U24 ( .A1(n44), .A2(n179), .Y(n47) );
  MUX21X2_LVT U25 ( .A1(reg_file_3__4_), .A2(i_dig_tx_reg_file_data_in[4]), 
        .S0(n45), .Y(n115) );
  MUX21X2_LVT U26 ( .A1(reg_file_3__0_), .A2(i_dig_tx_reg_file_data_in[0]), 
        .S0(n45), .Y(n119) );
  MUX21X2_LVT U27 ( .A1(reg_file_3__6_), .A2(i_dig_tx_reg_file_data_in[6]), 
        .S0(n45), .Y(n113) );
  MUX21X2_LVT U28 ( .A1(reg_file_3__2_), .A2(i_dig_tx_reg_file_data_in[2]), 
        .S0(n45), .Y(n117) );
  AND2X4_LVT U29 ( .A1(n44), .A2(n188), .Y(n45) );
  NAND3X2_LVT U30 ( .A1(n191), .A2(n190), .A3(net18105), .Y(n15) );
  AND2X1_LVT U31 ( .A1(n44), .A2(n179), .Y(n122) );
  AND2X1_LVT U32 ( .A1(n123), .A2(n40), .Y(n42) );
  INVX4_LVT U33 ( .A(n15), .Y(n151) );
  AO21X1_LVT U34 ( .A1(reg_file_0__3_), .A2(n174), .A3(
        i_dig_tx_reg_file_tx_done), .Y(n89) );
  INVX1_LVT U35 ( .A(i_dig_tx_reg_file_addr_in[1]), .Y(n160) );
  INVX2_LVT U36 ( .A(n7), .Y(n149) );
  INVX1_LVT U37 ( .A(i_dig_tx_reg_file_addr_in[0]), .Y(n24) );
  NAND2X0_LVT U38 ( .A1(n189), .A2(n16), .Y(n190) );
  AO21X1_RVT U39 ( .A1(n38), .A2(n191), .A3(n170), .Y(n88) );
  INVX4_LVT U40 ( .A(n174), .Y(n170) );
  INVX1_LVT U41 ( .A(i_dig_tx_reg_file_addr_in[0]), .Y(n7) );
  AND2X1_LVT U42 ( .A1(i_dig_tx_reg_file_spi_re_en), .A2(
        i_dig_tx_reg_file_data_in_en), .Y(n16) );
  NAND2X0_LVT U43 ( .A1(n24), .A2(i_dig_tx_reg_file_addr_in[1]), .Y(n178) );
  NAND3X2_LVT U44 ( .A1(n124), .A2(n29), .A3(n39), .Y(n174) );
  INVX1_LVT U45 ( .A(net17840), .Y(n38) );
  NAND3X1_LVT U46 ( .A1(n124), .A2(reg_file_0__3_), .A3(n29), .Y(n181) );
  INVX1_LVT U47 ( .A(i_dig_tx_reg_file_addr_in[2]), .Y(n177) );
  OA22X1_LVT U48 ( .A1(n175), .A2(n17), .A3(n176), .A4(n9), .Y(n165) );
  OA22X1_LVT U49 ( .A1(n175), .A2(n18), .A3(n176), .A4(n10), .Y(n172) );
  OA22X1_LVT U50 ( .A1(n175), .A2(n19), .A3(n176), .A4(n11), .Y(n168) );
  DELLN1X2_LVT U51 ( .A(o_dig_tx_reg_file_valid_en), .Y(net18105) );
  AO21X1_RVT U52 ( .A1(n25), .A2(n191), .A3(n45), .Y(n111) );
  INVX1_LVT U53 ( .A(net17845), .Y(n37) );
  AO21X1_RVT U54 ( .A1(n26), .A2(n191), .A3(n43), .Y(n93) );
  AND2X1_RVT U55 ( .A1(n149), .A2(n160), .Y(n27) );
  INVX1_LVT U56 ( .A(n33), .Y(o_dig_tx_reg_file_valid_en) );
  AO21X2_RVT U57 ( .A1(n30), .A2(n191), .A3(n186), .Y(n121) );
  AND2X1_LVT U58 ( .A1(n38), .A2(n37), .Y(n31) );
  AND2X1_LVT U59 ( .A1(n35), .A2(n34), .Y(n32) );
  NAND3X0_LVT U60 ( .A1(n31), .A2(n36), .A3(n32), .Y(n33) );
  INVX1_LVT U61 ( .A(net15984), .Y(n34) );
  INVX1_LVT U62 ( .A(net15985), .Y(n35) );
  NAND3X2_LVT U63 ( .A1(n124), .A2(n29), .A3(o_dig_tx_reg_file_tx_start), .Y(
        n164) );
  NAND3X2_LVT U64 ( .A1(n124), .A2(n29), .A3(o_dig_tx_reg_file_tx_mode), .Y(
        n167) );
  NAND3X2_LVT U65 ( .A1(n124), .A2(n29), .A3(o_dig_tx_reg_file_power_domain), 
        .Y(n171) );
  AND2X1_LVT U66 ( .A1(n160), .A2(n7), .Y(n124) );
  INVX1_LVT U67 ( .A(n41), .Y(n39) );
  NAND3X0_LVT U68 ( .A1(n191), .A2(n189), .A3(n16), .Y(n41) );
  INVX1_LVT U69 ( .A(n162), .Y(n161) );
  AND2X1_RVT U70 ( .A1(n149), .A2(n160), .Y(n40) );
  INVX2_LVT U71 ( .A(n178), .Y(n179) );
  AND2X1_LVT U72 ( .A1(n161), .A2(n177), .Y(n44) );
  AND2X1_LVT U73 ( .A1(n29), .A2(n39), .Y(n123) );
  INVX2_LVT U74 ( .A(i_dig_tx_reg_file_tx_busy), .Y(n189) );
  NAND3X2_RVT U75 ( .A1(o_dig_tx_reg_file_sys_tx_done), .A2(net18105), .A3(n41), .Y(n163) );
  NAND4X0_LVT U76 ( .A1(n7), .A2(n160), .A3(i_dig_tx_reg_file_addr_in[2]), 
        .A4(n161), .Y(n159) );
  INVX4_LVT U77 ( .A(n15), .Y(n150) );
  INVX2_LVT U78 ( .A(n158), .Y(n156) );
  INVX2_LVT U79 ( .A(n158), .Y(n157) );
  INVX2_LVT U80 ( .A(n158), .Y(n152) );
  INVX2_LVT U81 ( .A(n158), .Y(n155) );
  INVX2_LVT U82 ( .A(n158), .Y(n153) );
  INVX2_LVT U83 ( .A(n158), .Y(n154) );
  INVX1_LVT U84 ( .A(i_dig_tx_reg_file_rst_n), .Y(n158) );
  INVX2_LVT U109 ( .A(n159), .Y(n186) );
  INVX1_LVT U110 ( .A(i_dig_tx_reg_file_tx_done), .Y(n191) );
  NAND3X0_LVT U111 ( .A1(n191), .A2(n189), .A3(n16), .Y(n162) );
  NAND2X0_LVT U112 ( .A1(i_dig_tx_reg_file_addr_in[0]), .A2(
        i_dig_tx_reg_file_addr_in[1]), .Y(n175) );
  INVX1_LVT U113 ( .A(n175), .Y(n188) );
  NAND2X0_LVT U114 ( .A1(n149), .A2(n160), .Y(n176) );
  NAND2X0_LVT U115 ( .A1(n191), .A2(n163), .Y(n120) );
  MUX21X1_LVT U116 ( .A1(o_dig_tx_reg_file_tx_start), .A2(
        i_dig_tx_reg_file_data_in[0]), .S0(n170), .Y(n92) );
  MUX21X1_LVT U117 ( .A1(reg_file_4__0_), .A2(i_dig_tx_reg_file_data_in[0]), 
        .S0(n186), .Y(n49) );
  MUX21X1_LVT U118 ( .A1(reg_file_1__0_), .A2(i_dig_tx_reg_file_data_in[0]), 
        .S0(n42), .Y(n101) );
  NAND3X0_LVT U119 ( .A1(n166), .A2(n165), .A3(n164), .Y(
        o_dig_tx_reg_file_data_slave_out[0]) );
  MUX21X1_LVT U120 ( .A1(o_dig_tx_reg_file_tx_mode), .A2(
        i_dig_tx_reg_file_data_in[1]), .S0(n170), .Y(n91) );
  MUX21X1_LVT U121 ( .A1(reg_file_2__1_), .A2(i_dig_tx_reg_file_data_in[1]), 
        .S0(n122), .Y(n109) );
  MUX21X1_LVT U122 ( .A1(reg_file_4__1_), .A2(i_dig_tx_reg_file_data_in[1]), 
        .S0(n186), .Y(n51) );
  MUX21X1_LVT U123 ( .A1(reg_file_1__1_), .A2(i_dig_tx_reg_file_data_in[1]), 
        .S0(n43), .Y(n100) );
  NAND3X0_LVT U124 ( .A1(n169), .A2(n168), .A3(n167), .Y(
        o_dig_tx_reg_file_data_slave_out[1]) );
  MUX21X1_LVT U125 ( .A1(o_dig_tx_reg_file_power_domain), .A2(
        i_dig_tx_reg_file_data_in[2]), .S0(n170), .Y(n90) );
  MUX21X1_LVT U126 ( .A1(reg_file_4__2_), .A2(i_dig_tx_reg_file_data_in[2]), 
        .S0(n186), .Y(n53) );
  MUX21X1_LVT U127 ( .A1(reg_file_1__2_), .A2(i_dig_tx_reg_file_data_in[2]), 
        .S0(n42), .Y(n99) );
  NAND3X0_LVT U128 ( .A1(n173), .A2(n172), .A3(n171), .Y(
        o_dig_tx_reg_file_data_slave_out[2]) );
  MUX21X1_LVT U129 ( .A1(reg_file_2__3_), .A2(i_dig_tx_reg_file_data_in[3]), 
        .S0(n122), .Y(n107) );
  MUX21X1_LVT U130 ( .A1(reg_file_4__3_), .A2(i_dig_tx_reg_file_data_in[3]), 
        .S0(n186), .Y(n55) );
  MUX21X1_LVT U131 ( .A1(reg_file_3__3_), .A2(i_dig_tx_reg_file_data_in[3]), 
        .S0(n46), .Y(n116) );
  OA22X1_LVT U132 ( .A1(n20), .A2(n176), .A3(n8), .A4(n175), .Y(n182) );
  NAND3X0_LVT U133 ( .A1(n182), .A2(n181), .A3(n180), .Y(
        o_dig_tx_reg_file_data_slave_out[3]) );
  MUX21X1_LVT U134 ( .A1(reg_file_1__4_), .A2(i_dig_tx_reg_file_data_in[4]), 
        .S0(n42), .Y(n97) );
  MUX21X1_LVT U135 ( .A1(reg_file_4__4_), .A2(i_dig_tx_reg_file_data_in[4]), 
        .S0(n186), .Y(n57) );
  AO22X1_LVT U136 ( .A1(reg_file_4__4_), .A2(n6), .A3(reg_file_2__4_), .A4(
        n179), .Y(n183) );
  AO221X1_LVT U137 ( .A1(reg_file_3__4_), .A2(n188), .A3(reg_file_1__4_), .A4(
        n27), .A5(n183), .Y(o_dig_tx_reg_file_data_slave_out[4]) );
  MUX21X1_LVT U138 ( .A1(reg_file_3__5_), .A2(i_dig_tx_reg_file_data_in[5]), 
        .S0(n46), .Y(n114) );
  MUX21X1_LVT U139 ( .A1(reg_file_2__5_), .A2(i_dig_tx_reg_file_data_in[5]), 
        .S0(n122), .Y(n105) );
  MUX21X1_LVT U140 ( .A1(reg_file_4__5_), .A2(i_dig_tx_reg_file_data_in[5]), 
        .S0(n186), .Y(n59) );
  AO22X1_LVT U141 ( .A1(reg_file_4__5_), .A2(n6), .A3(reg_file_2__5_), .A4(
        n179), .Y(n184) );
  AO221X1_LVT U142 ( .A1(reg_file_3__5_), .A2(n188), .A3(reg_file_1__5_), .A4(
        n40), .A5(n184), .Y(o_dig_tx_reg_file_data_slave_out[5]) );
  MUX21X1_LVT U143 ( .A1(reg_file_1__6_), .A2(i_dig_tx_reg_file_data_in[6]), 
        .S0(n42), .Y(n95) );
  MUX21X1_LVT U144 ( .A1(reg_file_4__6_), .A2(i_dig_tx_reg_file_data_in[6]), 
        .S0(n186), .Y(n61) );
  AO22X1_LVT U145 ( .A1(reg_file_4__6_), .A2(n6), .A3(reg_file_2__6_), .A4(
        n179), .Y(n185) );
  AO221X1_LVT U146 ( .A1(reg_file_3__6_), .A2(n188), .A3(reg_file_1__6_), .A4(
        n27), .A5(n185), .Y(o_dig_tx_reg_file_data_slave_out[6]) );
  MUX21X1_LVT U147 ( .A1(reg_file_3__7_), .A2(i_dig_tx_reg_file_data_in[7]), 
        .S0(n46), .Y(n112) );
  MUX21X1_LVT U148 ( .A1(reg_file_2__7_), .A2(i_dig_tx_reg_file_data_in[7]), 
        .S0(n122), .Y(n103) );
  MUX21X1_LVT U149 ( .A1(reg_file_4__7_), .A2(i_dig_tx_reg_file_data_in[7]), 
        .S0(n186), .Y(n63) );
  AO22X1_LVT U150 ( .A1(reg_file_4__7_), .A2(n6), .A3(reg_file_2__7_), .A4(
        n179), .Y(n187) );
  AO221X1_LVT U151 ( .A1(reg_file_3__7_), .A2(n188), .A3(reg_file_1__7_), .A4(
        n40), .A5(n187), .Y(o_dig_tx_reg_file_data_slave_out[7]) );
  MUX21X1_LVT U152 ( .A1(o_dig_tx_reg_file_data_out[0]), .A2(reg_file_1__0_), 
        .S0(n151), .Y(n87) );
  MUX21X1_LVT U153 ( .A1(o_dig_tx_reg_file_data_out[1]), .A2(reg_file_1__1_), 
        .S0(n151), .Y(n64) );
  MUX21X1_LVT U154 ( .A1(o_dig_tx_reg_file_data_out[2]), .A2(reg_file_1__2_), 
        .S0(n150), .Y(n65) );
  MUX21X1_LVT U155 ( .A1(o_dig_tx_reg_file_data_out[3]), .A2(reg_file_1__3_), 
        .S0(n150), .Y(n66) );
  MUX21X1_LVT U156 ( .A1(o_dig_tx_reg_file_data_out[4]), .A2(reg_file_1__4_), 
        .S0(n151), .Y(n67) );
  MUX21X1_LVT U157 ( .A1(o_dig_tx_reg_file_data_out[5]), .A2(reg_file_1__5_), 
        .S0(n150), .Y(n68) );
  MUX21X1_LVT U158 ( .A1(o_dig_tx_reg_file_data_out[6]), .A2(reg_file_1__6_), 
        .S0(n150), .Y(n69) );
  MUX21X1_LVT U159 ( .A1(o_dig_tx_reg_file_data_out[7]), .A2(reg_file_1__7_), 
        .S0(n151), .Y(n70) );
  MUX21X1_LVT U160 ( .A1(o_dig_tx_reg_file_data_out[8]), .A2(reg_file_2__0_), 
        .S0(n150), .Y(n71) );
  MUX21X1_LVT U161 ( .A1(o_dig_tx_reg_file_data_out[9]), .A2(reg_file_2__1_), 
        .S0(n151), .Y(n72) );
  MUX21X1_LVT U162 ( .A1(o_dig_tx_reg_file_data_out[10]), .A2(reg_file_2__2_), 
        .S0(n151), .Y(n73) );
  MUX21X1_LVT U163 ( .A1(o_dig_tx_reg_file_data_out[11]), .A2(reg_file_2__3_), 
        .S0(n150), .Y(n74) );
  MUX21X1_LVT U164 ( .A1(o_dig_tx_reg_file_data_out[12]), .A2(reg_file_2__4_), 
        .S0(n150), .Y(n75) );
  MUX21X1_LVT U165 ( .A1(o_dig_tx_reg_file_data_out[13]), .A2(reg_file_2__5_), 
        .S0(n151), .Y(n76) );
  MUX21X1_LVT U166 ( .A1(o_dig_tx_reg_file_data_out[14]), .A2(reg_file_2__6_), 
        .S0(n151), .Y(n77) );
  MUX21X1_LVT U167 ( .A1(o_dig_tx_reg_file_data_out[15]), .A2(reg_file_2__7_), 
        .S0(n151), .Y(n78) );
  MUX21X1_LVT U168 ( .A1(o_dig_tx_reg_file_data_out[16]), .A2(reg_file_3__0_), 
        .S0(n150), .Y(n79) );
  MUX21X1_LVT U169 ( .A1(o_dig_tx_reg_file_data_out[17]), .A2(reg_file_3__1_), 
        .S0(n150), .Y(n80) );
  MUX21X1_LVT U170 ( .A1(o_dig_tx_reg_file_data_out[18]), .A2(reg_file_3__2_), 
        .S0(n151), .Y(n81) );
  MUX21X1_LVT U171 ( .A1(o_dig_tx_reg_file_data_out[19]), .A2(reg_file_3__3_), 
        .S0(n151), .Y(n82) );
  MUX21X1_LVT U172 ( .A1(o_dig_tx_reg_file_data_out[20]), .A2(reg_file_3__4_), 
        .S0(n150), .Y(n83) );
  MUX21X1_LVT U173 ( .A1(o_dig_tx_reg_file_data_out[21]), .A2(reg_file_3__5_), 
        .S0(n150), .Y(n84) );
  MUX21X1_LVT U174 ( .A1(o_dig_tx_reg_file_data_out[22]), .A2(reg_file_3__6_), 
        .S0(n151), .Y(n85) );
  MUX21X1_LVT U175 ( .A1(o_dig_tx_reg_file_data_out[23]), .A2(reg_file_3__7_), 
        .S0(n150), .Y(n86) );
  MUX21X1_LVT U176 ( .A1(o_dig_tx_reg_file_data_out[24]), .A2(reg_file_4__0_), 
        .S0(n151), .Y(n48) );
  MUX21X1_LVT U177 ( .A1(o_dig_tx_reg_file_data_out[25]), .A2(reg_file_4__1_), 
        .S0(n150), .Y(n50) );
  MUX21X1_LVT U178 ( .A1(o_dig_tx_reg_file_data_out[26]), .A2(reg_file_4__2_), 
        .S0(n150), .Y(n52) );
  MUX21X1_LVT U179 ( .A1(o_dig_tx_reg_file_data_out[27]), .A2(reg_file_4__3_), 
        .S0(n151), .Y(n54) );
  MUX21X1_LVT U180 ( .A1(o_dig_tx_reg_file_data_out[28]), .A2(reg_file_4__4_), 
        .S0(n150), .Y(n56) );
  MUX21X1_LVT U181 ( .A1(o_dig_tx_reg_file_data_out[29]), .A2(reg_file_4__5_), 
        .S0(n151), .Y(n58) );
  MUX21X1_LVT U182 ( .A1(o_dig_tx_reg_file_data_out[30]), .A2(reg_file_4__6_), 
        .S0(n150), .Y(n60) );
  MUX21X1_LVT U183 ( .A1(o_dig_tx_reg_file_data_out[31]), .A2(reg_file_4__7_), 
        .S0(n151), .Y(n62) );
  DFFARX1_LVT reg_file_reg_2__6_ ( .D(n104), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(i_dig_tx_reg_file_rst_n), .Q(reg_file_2__6_) );
  DFFARX1_LVT reg_file_reg_2__4_ ( .D(n106), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n156), .Q(reg_file_2__4_) );
  DFFARX1_LVT reg_file_reg_3__6_ ( .D(n113), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n156), .Q(reg_file_3__6_) );
  DFFARX1_LVT reg_file_reg_3__4_ ( .D(n115), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n155), .Q(reg_file_3__4_) );
  DFFARX1_LVT reg_file_reg_3__7_ ( .D(n112), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n156), .Q(reg_file_3__7_) );
  DFFARX1_LVT reg_file_reg_3__5_ ( .D(n114), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n155), .Q(reg_file_3__5_) );
  DFFARX1_LVT reg_file_reg_1__6_ ( .D(n95), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n157), .Q(reg_file_1__6_) );
  DFFARX1_LVT reg_file_reg_1__4_ ( .D(n97), .CLK(i_dig_tx_reg_file_clk), 
        .RSTB(n157), .Q(reg_file_1__4_) );
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
  wire   N31, N32, n2, n5, n6, n7, net15386, net15391, net15392, net15405,
         net15406, net15408, net15411, net15412, net15418, net17585, net18059,
         net18192, net18203, net18241, net18250, net18230, net18211, net17867,
         net17575, net15399, net15395, net20240, net20260, net20268, net22463,
         net22540, net22570, net18123, net18122, net18013, net15401, net15396,
         net15394, net17862, net15986, n1, n3, n4, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n310, n320, n33, n34, n35;
  wire   [2:0] current_state;
  wire   [2:1] stall_counter;
  wire   [1:0] next_state;

  DFFARX1_LVT stall_counter_reg_2_ ( .D(N32), .CLK(i_dig_tx_control_unit_clk), 
        .RSTB(i_dig_tx_control_unit_rst_n), .Q(stall_counter[2]), .QN(n14) );
  DFFARX2_LVT current_state_reg_1_ ( .D(next_state[1]), .CLK(
        i_dig_tx_control_unit_clk), .RSTB(i_dig_tx_control_unit_rst_n), .Q(
        current_state[1]), .QN(n6) );
  DFFARX1_LVT stall_counter_reg_0_ ( .D(n20), .CLK(i_dig_tx_control_unit_clk), 
        .RSTB(i_dig_tx_control_unit_rst_n), .Q(n10), .QN(n2) );
  DFFARX2_LVT current_state_reg_0_ ( .D(next_state[0]), .CLK(
        i_dig_tx_control_unit_clk), .RSTB(i_dig_tx_control_unit_rst_n), .Q(
        current_state[0]), .QN(n7) );
  DFFARX2_LVT current_state_reg_2_ ( .D(o_dig_tx_control_unit_crc_en), .CLK(
        i_dig_tx_control_unit_clk), .RSTB(i_dig_tx_control_unit_rst_n), .Q(
        current_state[2]), .QN(n5) );
  DFFARX1_LVT stall_counter_reg_1_ ( .D(N31), .CLK(i_dig_tx_control_unit_clk), 
        .RSTB(i_dig_tx_control_unit_rst_n), .Q(stall_counter[1]), .QN(n16) );
  NAND3X2_LVT U3 ( .A1(net15986), .A2(net20268), .A3(net15399), .Y(net20240)
         );
  INVX0_HVT U4 ( .A(n8), .Y(n1) );
  AND3X1_LVT U5 ( .A1(net18211), .A2(net18250), .A3(current_state[2]), .Y(n8)
         );
  INVX2_LVT U6 ( .A(i_dig_tx_control_unit_data_fifo_empty), .Y(net20268) );
  AND2X1_LVT U7 ( .A1(net18211), .A2(n5), .Y(net22463) );
  INVX1_LVT U8 ( .A(net15405), .Y(n3) );
  OR2X1_LVT U9 ( .A1(n7), .A2(n5), .Y(net18230) );
  NOR2X0_LVT U10 ( .A1(net22570), .A2(net17862), .Y(net15986) );
  NAND4X0_LVT U11 ( .A1(net15391), .A2(n1), .A3(n26), .A4(n34), .Y(
        o_dig_tx_control_unit_crc_en) );
  INVX1_LVT U12 ( .A(i_dig_tx_control_unit_regfile_valid_en), .Y(net20260) );
  OR2X1_LVT U13 ( .A1(n33), .A2(net15386), .Y(
        o_dig_tx_control_unit_output_valid) );
  INVX4_LVT U14 ( .A(net17867), .Y(net18211) );
  DELLN3X2_HVT U15 ( .A(o_dig_tx_control_unit_tx_busy), .Y(n4) );
  INVX4_LVT U16 ( .A(n6), .Y(net17867) );
  AND2X1_HVT U17 ( .A1(i_dig_tx_control_unit_power_domain), .A2(n4), .Y(
        o_dig_tx_control_unit_spi_pow_en) );
  INVX0_LVT U18 ( .A(n13), .Y(n23) );
  NAND4X0_LVT U19 ( .A1(n11), .A2(n310), .A3(n29), .A4(n28), .Y(
        o_dig_tx_control_unit_spi_clk_en) );
  INVX1_LVT U20 ( .A(o_dig_tx_control_unit_serializer_payload_en), .Y(n25) );
  AOI21X1_LVT U21 ( .A1(n21), .A2(n10), .A3(net18203), .Y(n20) );
  INVX1_LVT U22 ( .A(net18241), .Y(net18203) );
  AOI21X1_LVT U23 ( .A1(i_dig_tx_control_unit_data_crc_done), .A2(net15386), 
        .A3(n15), .Y(n12) );
  AO22X1_LVT U24 ( .A1(n19), .A2(stall_counter[1]), .A3(net18241), .A4(
        stall_counter[2]), .Y(N32) );
  IBUFFX2_HVT U25 ( .A(net15986), .Y(net15405) );
  INVX2_LVT U26 ( .A(net22540), .Y(net22570) );
  NAND2X0_LVT U27 ( .A1(n5), .A2(n6), .Y(net17862) );
  NAND3X0_LVT U28 ( .A1(net15986), .A2(net20268), .A3(net15399), .Y(net15396)
         );
  NAND2X0_HVT U29 ( .A1(net17585), .A2(n3), .Y(net15411) );
  NAND3X0_LVT U30 ( .A1(net18013), .A2(net15396), .A3(net15394), .Y(
        o_dig_tx_control_unit_fifo_re_en) );
  NAND3X0_LVT U31 ( .A1(net15401), .A2(net22463), .A3(net18123), .Y(net18013)
         );
  INVX1_LVT U32 ( .A(i_dig_tx_control_unit_regfile_valid_en), .Y(net15401) );
  INVX1_LVT U33 ( .A(net18122), .Y(net18123) );
  NAND2X0_LVT U34 ( .A1(current_state[0]), .A2(net20268), .Y(net18122) );
  INVX1_LVT U35 ( .A(i_dig_tx_control_unit_tx_start), .Y(net15399) );
  NAND2X0_LVT U36 ( .A1(net17575), .A2(current_state[1]), .Y(net15394) );
  AND2X1_LVT U37 ( .A1(net22570), .A2(n5), .Y(net17575) );
  INVX2_LVT U38 ( .A(n7), .Y(net22540) );
  AO21X2_HVT U39 ( .A1(i_dig_tx_control_unit_data_fifo_empty), .A2(net15399), 
        .A3(net15405), .Y(net15418) );
  AND3X1_LVT U40 ( .A1(net22540), .A2(net17867), .A3(n5), .Y(n9) );
  NAND4X0_LVT U41 ( .A1(n11), .A2(n25), .A3(net15418), .A4(n27), .Y(
        next_state[0]) );
  NAND3X2_HVT U42 ( .A1(current_state[2]), .A2(current_state[1]), .A3(
        current_state[0]), .Y(n29) );
  OR3X2_HVT U43 ( .A1(i_dig_tx_control_unit_csn), .A2(
        i_dig_tx_control_unit_data_fifo_empty), .A3(net15406), .Y(net15412) );
  NAND2X0_RVT U44 ( .A1(net18241), .A2(n13), .Y(n34) );
  INVX4_LVT U45 ( .A(net15391), .Y(net15386) );
  OR2X2_LVT U46 ( .A1(net17867), .A2(net18230), .Y(net15391) );
  NAND2X0_HVT U47 ( .A1(net17575), .A2(current_state[1]), .Y(n11) );
  NAND3X0_LVT U48 ( .A1(net20240), .A2(net15395), .A3(net18192), .Y(
        o_dig_tx_control_unit_spi_re_en) );
  NAND4X0_LVT U49 ( .A1(net20260), .A2(net20268), .A3(net22463), .A4(
        current_state[0]), .Y(net15395) );
  AND2X1_HVT U50 ( .A1(i_dig_tx_control_unit_tx_start), .A2(net18059), .Y(
        net17585) );
  NAND2X0_RVT U51 ( .A1(net17575), .A2(current_state[1]), .Y(net18192) );
  NAND3X0_LVT U52 ( .A1(current_state[2]), .A2(net22570), .A3(net17867), .Y(
        net15392) );
  INVX0_HVT U53 ( .A(net20260), .Y(net18059) );
  NAND2X0_LVT U54 ( .A1(net17575), .A2(net18211), .Y(net15406) );
  NBUFFX2_LVT U55 ( .A(n7), .Y(net18250) );
  NBUFFX2_LVT U56 ( .A(n9), .Y(net18241) );
  NOR3X0_LVT U57 ( .A1(n2), .A2(n16), .A3(n14), .Y(n13) );
  AND2X1_LVT U58 ( .A1(net15408), .A2(n22), .Y(n15) );
  NAND4X0_LVT U59 ( .A1(n27), .A2(n12), .A3(net15411), .A4(net15412), .Y(
        next_state[1]) );
  NAND2X0_RVT U60 ( .A1(net18241), .A2(n23), .Y(n27) );
  OR2X2_LVT U61 ( .A1(net18241), .A2(o_dig_tx_control_unit_output_valid), .Y(
        o_dig_tx_control_unit_tx_busy) );
  MUX21X1_LVT U62 ( .A1(n20), .A2(n19), .S0(n16), .Y(N31) );
  NAND2X0_LVT U63 ( .A1(n9), .A2(n13), .Y(n17) );
  NAND2X0_LVT U64 ( .A1(n17), .A2(net15391), .Y(n320) );
  AND2X1_LVT U65 ( .A1(n9), .A2(n13), .Y(n18) );
  AND2X1_RVT U66 ( .A1(n21), .A2(n10), .Y(n19) );
  NAND3X0_LVT U67 ( .A1(net18211), .A2(net18250), .A3(current_state[2]), .Y(
        n30) );
  INVX1_LVT U68 ( .A(n27), .Y(n21) );
  INVX1_LVT U69 ( .A(net15392), .Y(net15408) );
  INVX1_LVT U70 ( .A(i_dig_tx_control_unit_crc_phy_done), .Y(n22) );
  NAND2X0_LVT U71 ( .A1(net15408), .A2(n22), .Y(n26) );
  INVX1_LVT U72 ( .A(i_dig_tx_control_unit_data_crc_done), .Y(n24) );
  AO22X1_LVT U73 ( .A1(i_dig_tx_control_unit_shr_crc_done), .A2(n8), .A3(
        net15386), .A4(n24), .Y(o_dig_tx_control_unit_serializer_payload_en)
         );
  AO21X1_LVT U74 ( .A1(i_dig_tx_control_unit_data_crc_done), .A2(net15386), 
        .A3(n15), .Y(o_dig_tx_control_unit_serializer_crc_en) );
  NAND2X0_LVT U75 ( .A1(i_dig_tx_control_unit_crc_phy_done), .A2(net15408), 
        .Y(n310) );
  OA21X1_LVT U76 ( .A1(net17585), .A2(net15405), .A3(net15406), .Y(n28) );
  NAND2X0_LVT U77 ( .A1(net15392), .A2(n30), .Y(n33) );
  INVX1_LVT U78 ( .A(n310), .Y(o_dig_tx_control_unit_tx_done) );
  OA21X1_LVT U79 ( .A1(n33), .A2(n320), .A3(i_dig_tx_control_unit_tx_mode), 
        .Y(o_dig_tx_control_unit_clock_mode_en) );
  INVX1_LVT U80 ( .A(i_dig_tx_control_unit_shr_crc_done), .Y(n35) );
  AO21X1_LVT U81 ( .A1(n8), .A2(n35), .A3(n18), .Y(
        o_dig_tx_control_unit_serializer_shr_en) );
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
  wire   N160, N161, N162, N163, N164, N165, N166, N167, N168, clock_freq_en,
         N231, N232, N233, N285, n9, n10, n11, n14, n47, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n1, n2, n3, n4, n5, n6, n7, n8, n12, n13, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n48, n49, n50, n51, n52, n53, n54, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143;
  wire   [4:0] counter_send_shr_crc;
  wire   [4:2] add_70_carry;

  DFFARX1_LVT clock_freq_en_reg ( .D(N285), .CLK(i_dig_tx_serializer_clk), 
        .RSTB(n52), .Q(clock_freq_en), .QN(n9) );
  DFFARX1_LVT counter_send_shr_crc_reg_0_ ( .D(n73), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n52), .Q(counter_send_shr_crc[0]), 
        .QN(n11) );
  DFFARX1_LVT o_dig_tx_serializer_shr_crc_done_reg ( .D(n72), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n52), .Q(
        o_dig_tx_serializer_shr_crc_done) );
  DFFARX1_LVT counter_send_shr_crc_reg_1_ ( .D(n71), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n52), .Q(counter_send_shr_crc[1]) );
  DFFARX1_LVT counter_send_shr_crc_reg_2_ ( .D(n70), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n52), .Q(counter_send_shr_crc[2]), 
        .QN(n13) );
  DFFARX1_LVT counter_send_shr_crc_reg_3_ ( .D(n69), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n52), .Q(counter_send_shr_crc[3]), 
        .QN(n10) );
  DFFARX1_LVT counter_send_shr_crc_reg_4_ ( .D(n68), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n52), .Q(counter_send_shr_crc[4]), 
        .QN(n3) );
  DFFARX1_LVT o_dig_tx_serializer_phy_out_reg ( .D(n67), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n51), .Q(o_dig_tx_serializer_phy_out)
         );
  DFFARX1_LVT counter_send_data_crc_reg_0_ ( .D(n65), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n51), .Q(N160), .QN(n7) );
  DFFARX1_LVT o_dig_tx_serializer_data_crc_done_reg ( .D(n60), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n51), .Q(
        o_dig_tx_serializer_data_crc_done) );
  DFFARX1_LVT counter_send_data_crc_reg_1_ ( .D(n64), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n51), .Q(N161), .QN(n6) );
  DFFARX1_LVT counter_send_data_crc_reg_2_ ( .D(n63), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n51), .Q(N162), .QN(n5) );
  DFFARX1_LVT counter_send_data_crc_reg_3_ ( .D(n62), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n51), .Q(N163) );
  DFFARX1_LVT counter_send_data_crc_reg_4_ ( .D(n61), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n51), .Q(N164), .QN(n8) );
  DFFARX1_LVT counter_send_crc_phy_reg_0_ ( .D(n59), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n51), .Q(N165), .QN(n14) );
  DFFARX1_LVT counter_send_crc_phy_reg_2_ ( .D(n57), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n51), .Q(N167), .QN(n4) );
  DFFARX1_LVT o_dig_tx_serializer_crc_phy_done_reg ( .D(n55), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n51), .Q(
        o_dig_tx_serializer_crc_phy_done) );
  DFFARX1_LVT counter_send_crc_phy_reg_1_ ( .D(n58), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n51), .Q(N166), .QN(n12) );
  AND2X1_LVT U51 ( .A1(counter_send_shr_crc[2]), .A2(counter_send_shr_crc[1]), 
        .Y(n47) );
  HADDX1_LVT add_70_U1_1_2 ( .A0(counter_send_shr_crc[2]), .B0(add_70_carry[2]), .C1(add_70_carry[3]), .SO(N231) );
  HADDX1_LVT add_70_U1_1_3 ( .A0(counter_send_shr_crc[3]), .B0(add_70_carry[3]), .C1(add_70_carry[4]), .SO(N232) );
  DFFARX1_LVT o_dig_tx_serializer_crc_in_reg ( .D(n66), .CLK(
        i_dig_tx_serializer_clk), .RSTB(i_dig_tx_serializer_rst_n), .Q(
        o_dig_tx_serializer_crc_in), .QN(n141) );
  DFFARX1_LVT counter_send_crc_phy_reg_3_ ( .D(n56), .CLK(
        i_dig_tx_serializer_clk), .RSTB(n51), .Q(N168) );
  AOI21X1_LVT U3 ( .A1(n2), .A2(n130), .A3(n129), .Y(n1) );
  NAND2X0_LVT U4 ( .A1(i_dig_tx_serializer_payload_en), .A2(n90), .Y(n76) );
  NAND3X2_RVT U5 ( .A1(i_dig_tx_serializer_crc_en), .A2(n90), .A3(n75), .Y(n92) );
  INVX4_LVT U6 ( .A(i_dig_tx_serializer_shr_en), .Y(n90) );
  INVX1_LVT U7 ( .A(n132), .Y(n116) );
  OR2X1_LVT U8 ( .A1(i_dig_tx_serializer_clock_mode_en), .A2(clock_freq_en), 
        .Y(o_dig_tx_serializer_clock_freq_en) );
  AO21X1_LVT U9 ( .A1(n14), .A2(n97), .A3(n18), .Y(n94) );
  INVX1_LVT U10 ( .A(n105), .Y(n107) );
  INVX1_LVT U11 ( .A(n131), .Y(n108) );
  MUX21X1_LVT U12 ( .A1(n15), .A2(n16), .S0(counter_send_shr_crc[0]), .Y(n73)
         );
  NAND3X0_LVT U13 ( .A1(n76), .A2(n90), .A3(n92), .Y(n54) );
  AND3X1_LVT U14 ( .A1(i_dig_tx_serializer_crc_en), .A2(n90), .A3(n75), .Y(n2)
         );
  INVX1_LVT U15 ( .A(i_dig_tx_serializer_payload_en), .Y(n75) );
  INVX0_RVT U16 ( .A(i_dig_tx_serializer_clock_mode_en), .Y(n93) );
  AND2X1_LVT U17 ( .A1(n116), .A2(n114), .Y(n15) );
  OA22X1_LVT U18 ( .A1(n133), .A2(n1), .A3(n16), .A4(n1), .Y(n137) );
  AND2X1_LVT U19 ( .A1(n132), .A2(n131), .Y(n16) );
  NAND4X0_LVT U20 ( .A1(o_dig_tx_serializer_phy_out), .A2(n134), .A3(n16), 
        .A4(n133), .Y(n136) );
  AO22X1_LVT U21 ( .A1(N233), .A2(n15), .A3(n16), .A4(counter_send_shr_crc[4]), 
        .Y(n68) );
  NAND3X0_LVT U22 ( .A1(i_dig_tx_serializer_payload_en), .A2(n90), .A3(
        o_dig_tx_serializer_clock_freq_en), .Y(n88) );
  XOR2X1_LVT U23 ( .A1(add_70_carry[4]), .A2(counter_send_shr_crc[4]), .Y(N233) );
  AND2X1_LVT U24 ( .A1(n22), .A2(n134), .Y(n17) );
  AND2X1_LVT U25 ( .A1(n133), .A2(n131), .Y(n18) );
  NAND2X0_RVT U26 ( .A1(i_dig_tx_serializer_shr_en), .A2(n128), .Y(n140) );
  NAND3X2_LVT U27 ( .A1(n75), .A2(n90), .A3(n74), .Y(n131) );
  NAND2X0_LVT U28 ( .A1(n17), .A2(n141), .Y(n19) );
  NAND2X0_LVT U29 ( .A1(n140), .A2(n139), .Y(n20) );
  NAND2X0_LVT U30 ( .A1(n20), .A2(n19), .Y(n142) );
  AO22X1_RVT U31 ( .A1(n14), .A2(n25), .A3(n18), .A4(N165), .Y(n59) );
  AND2X1_LVT U32 ( .A1(n131), .A2(n134), .Y(n21) );
  INVX1_LVT U33 ( .A(n76), .Y(n138) );
  AND2X1_LVT U34 ( .A1(n132), .A2(n131), .Y(n22) );
  INVX2_LVT U35 ( .A(n53), .Y(n51) );
  INVX1_LVT U36 ( .A(n53), .Y(n52) );
  AND2X1_LVT U37 ( .A1(n6), .A2(n7), .Y(n23) );
  AND2X1_LVT U38 ( .A1(n12), .A2(n4), .Y(n24) );
  AOI21X1_LVT U39 ( .A1(n93), .A2(n9), .A3(n102), .Y(n25) );
  INVX1_LVT U40 ( .A(i_dig_tx_serializer_rst_n), .Y(n53) );
  AND2X1_LVT U41 ( .A1(N160), .A2(n6), .Y(n26) );
  AND2X1_LVT U42 ( .A1(N161), .A2(n7), .Y(n27) );
  AND2X1_LVT U43 ( .A1(N160), .A2(N161), .Y(n28) );
  AND2X1_LVT U44 ( .A1(N167), .A2(n12), .Y(n29) );
  AND2X1_LVT U45 ( .A1(N166), .A2(n4), .Y(n30) );
  AND2X1_LVT U46 ( .A1(N167), .A2(N166), .Y(n31) );
  XOR2X1_HVT U47 ( .A1(counter_send_shr_crc[1]), .A2(counter_send_shr_crc[0]), 
        .Y(n91) );
  MUX21X1_LVT U48 ( .A1(n32), .A2(n33), .S0(N164), .Y(n143) );
  MUX41X1_LVT U49 ( .A1(n34), .A3(n35), .A2(n36), .A4(n37), .S0(N163), .S1(
        N162), .Y(n33) );
  AO221X1_LVT U50 ( .A1(i_dig_tx_serializer_reg_data_in[28]), .A2(n23), .A3(
        i_dig_tx_serializer_reg_data_in[30]), .A4(n27), .A5(n38), .Y(n37) );
  AO22X1_LVT U52 ( .A1(i_dig_tx_serializer_reg_data_in[31]), .A2(n28), .A3(
        i_dig_tx_serializer_reg_data_in[29]), .A4(n26), .Y(n38) );
  AO221X1_LVT U53 ( .A1(i_dig_tx_serializer_reg_data_in[20]), .A2(n23), .A3(
        i_dig_tx_serializer_reg_data_in[22]), .A4(n27), .A5(n39), .Y(n36) );
  AO22X1_LVT U54 ( .A1(i_dig_tx_serializer_reg_data_in[23]), .A2(n28), .A3(
        i_dig_tx_serializer_reg_data_in[21]), .A4(n26), .Y(n39) );
  AO221X1_LVT U55 ( .A1(i_dig_tx_serializer_reg_data_in[24]), .A2(n23), .A3(
        i_dig_tx_serializer_reg_data_in[26]), .A4(n27), .A5(n40), .Y(n35) );
  AO22X1_LVT U56 ( .A1(i_dig_tx_serializer_reg_data_in[27]), .A2(n28), .A3(
        i_dig_tx_serializer_reg_data_in[25]), .A4(n26), .Y(n40) );
  AO221X1_LVT U57 ( .A1(i_dig_tx_serializer_reg_data_in[16]), .A2(n23), .A3(
        i_dig_tx_serializer_reg_data_in[18]), .A4(n27), .A5(n41), .Y(n34) );
  AO22X1_LVT U58 ( .A1(i_dig_tx_serializer_reg_data_in[19]), .A2(n28), .A3(
        i_dig_tx_serializer_reg_data_in[17]), .A4(n26), .Y(n41) );
  MUX41X1_LVT U59 ( .A1(n42), .A3(n43), .A2(n44), .A4(n45), .S0(N163), .S1(
        N162), .Y(n32) );
  AO221X1_LVT U60 ( .A1(i_dig_tx_serializer_reg_data_in[12]), .A2(n23), .A3(
        i_dig_tx_serializer_reg_data_in[14]), .A4(n27), .A5(n46), .Y(n45) );
  AO22X1_LVT U61 ( .A1(i_dig_tx_serializer_reg_data_in[15]), .A2(n28), .A3(
        i_dig_tx_serializer_reg_data_in[13]), .A4(n26), .Y(n46) );
  AO221X1_LVT U62 ( .A1(i_dig_tx_serializer_reg_data_in[4]), .A2(n23), .A3(
        i_dig_tx_serializer_reg_data_in[6]), .A4(n27), .A5(n48), .Y(n44) );
  AO22X1_LVT U63 ( .A1(i_dig_tx_serializer_reg_data_in[7]), .A2(n28), .A3(
        i_dig_tx_serializer_reg_data_in[5]), .A4(n26), .Y(n48) );
  AO221X1_LVT U64 ( .A1(i_dig_tx_serializer_reg_data_in[8]), .A2(n23), .A3(
        i_dig_tx_serializer_reg_data_in[10]), .A4(n27), .A5(n49), .Y(n43) );
  AO22X1_LVT U65 ( .A1(i_dig_tx_serializer_reg_data_in[11]), .A2(n28), .A3(
        i_dig_tx_serializer_reg_data_in[9]), .A4(n26), .Y(n49) );
  AO221X1_LVT U66 ( .A1(i_dig_tx_serializer_reg_data_in[0]), .A2(n23), .A3(
        i_dig_tx_serializer_reg_data_in[2]), .A4(n27), .A5(n50), .Y(n42) );
  AO22X1_LVT U67 ( .A1(i_dig_tx_serializer_reg_data_in[3]), .A2(n28), .A3(
        i_dig_tx_serializer_reg_data_in[1]), .A4(n26), .Y(n50) );
  INVX0_LVT U68 ( .A(o_dig_tx_serializer_clock_freq_en), .Y(n112) );
  INVX0_LVT U69 ( .A(i_dig_tx_serializer_crc_en), .Y(n74) );
  INVX1_LVT U70 ( .A(n100), .Y(n101) );
  NAND2X0_LVT U71 ( .A1(n138), .A2(o_dig_tx_serializer_clock_freq_en), .Y(n134) );
  AND2X1_LVT U72 ( .A1(n9), .A2(n54), .Y(N285) );
  INVX1_LVT U73 ( .A(n88), .Y(n83) );
  MUX21X1_LVT U74 ( .A1(n83), .A2(n21), .S0(N160), .Y(n65) );
  AND2X1_LVT U75 ( .A1(n83), .A2(N160), .Y(n77) );
  AO21X1_LVT U76 ( .A1(n83), .A2(n7), .A3(n21), .Y(n79) );
  MUX21X1_LVT U77 ( .A1(n77), .A2(n79), .S0(N161), .Y(n64) );
  NAND2X0_LVT U78 ( .A1(N160), .A2(n5), .Y(n78) );
  MUX21X1_LVT U79 ( .A1(n5), .A2(n78), .S0(N161), .Y(n81) );
  INVX1_LVT U80 ( .A(n79), .Y(n80) );
  OAI22X1_LVT U81 ( .A1(n81), .A2(n88), .A3(n80), .A4(n5), .Y(n63) );
  NAND3X0_LVT U82 ( .A1(N161), .A2(N160), .A3(N162), .Y(n82) );
  INVX1_LVT U83 ( .A(n82), .Y(n110) );
  AND2X1_LVT U84 ( .A1(n83), .A2(n110), .Y(n84) );
  AO21X1_LVT U85 ( .A1(n83), .A2(n82), .A3(n21), .Y(n86) );
  MUX21X1_LVT U86 ( .A1(n84), .A2(n86), .S0(N163), .Y(n62) );
  NAND2X0_LVT U87 ( .A1(n110), .A2(n8), .Y(n85) );
  MUX21X1_LVT U88 ( .A1(n8), .A2(n85), .S0(N163), .Y(n89) );
  INVX1_LVT U89 ( .A(n86), .Y(n87) );
  OAI22X1_LVT U90 ( .A1(n89), .A2(n88), .A3(n87), .A4(n8), .Y(n61) );
  AO21X1_LVT U91 ( .A1(n93), .A2(n9), .A3(n90), .Y(n132) );
  NAND4X0_LVT U92 ( .A1(n10), .A2(counter_send_shr_crc[0]), .A3(n47), .A4(
        counter_send_shr_crc[4]), .Y(n114) );
  AO22X1_LVT U93 ( .A1(N232), .A2(n15), .A3(counter_send_shr_crc[3]), .A4(n16), 
        .Y(n69) );
  AO22X1_LVT U94 ( .A1(N231), .A2(n15), .A3(counter_send_shr_crc[2]), .A4(n16), 
        .Y(n70) );
  AO22X1_LVT U95 ( .A1(n15), .A2(n91), .A3(n16), .A4(counter_send_shr_crc[1]), 
        .Y(n71) );
  AND2X1_LVT U96 ( .A1(counter_send_shr_crc[1]), .A2(counter_send_shr_crc[0]), 
        .Y(add_70_carry[2]) );
  NAND2X0_LVT U97 ( .A1(N165), .A2(N166), .Y(n96) );
  INVX1_LVT U98 ( .A(n96), .Y(n99) );
  NAND3X0_LVT U99 ( .A1(N168), .A2(N167), .A3(n99), .Y(n105) );
  NAND2X0_LVT U100 ( .A1(n2), .A2(n105), .Y(n102) );
  NAND2X0_LVT U101 ( .A1(n2), .A2(o_dig_tx_serializer_clock_freq_en), .Y(n133)
         );
  NAND2X0_LVT U102 ( .A1(n133), .A2(n131), .Y(n106) );
  AND2X1_LVT U103 ( .A1(n25), .A2(N165), .Y(n95) );
  INVX1_LVT U104 ( .A(n102), .Y(n97) );
  MUX21X1_LVT U105 ( .A1(n95), .A2(n94), .S0(N166), .Y(n58) );
  AND2X1_LVT U106 ( .A1(n25), .A2(n99), .Y(n98) );
  AO21X1_LVT U107 ( .A1(n97), .A2(n96), .A3(n18), .Y(n100) );
  MUX21X1_LVT U108 ( .A1(n98), .A2(n100), .S0(N167), .Y(n57) );
  AND2X1_LVT U109 ( .A1(N167), .A2(n99), .Y(n104) );
  NAND2X0_LVT U110 ( .A1(n101), .A2(n102), .Y(n103) );
  AO22X1_LVT U111 ( .A1(n104), .A2(n25), .A3(n103), .A4(N168), .Y(n56) );
  OA21X1_LVT U112 ( .A1(n108), .A2(n107), .A3(n106), .Y(n109) );
  MUX21X1_LVT U113 ( .A1(o_dig_tx_serializer_crc_phy_done), .A2(n2), .S0(n109), 
        .Y(n55) );
  NAND4X0_LVT U114 ( .A1(N164), .A2(N163), .A3(n110), .A4(n138), .Y(n111) );
  OA21X1_LVT U115 ( .A1(n112), .A2(n111), .A3(n131), .Y(n113) );
  MUX21X1_LVT U116 ( .A1(n138), .A2(o_dig_tx_serializer_data_crc_done), .S0(
        n113), .Y(n60) );
  INVX1_LVT U117 ( .A(n114), .Y(n115) );
  AO22X1_LVT U118 ( .A1(n116), .A2(n115), .A3(o_dig_tx_serializer_shr_crc_done), .A4(n131), .Y(n72) );
  AO22X1_LVT U119 ( .A1(i_dig_tx_serializer_crc_out[6]), .A2(n31), .A3(
        i_dig_tx_serializer_crc_out[4]), .A4(n29), .Y(n117) );
  AO221X1_LVT U120 ( .A1(i_dig_tx_serializer_crc_out[0]), .A2(n24), .A3(
        i_dig_tx_serializer_crc_out[2]), .A4(n30), .A5(n117), .Y(n124) );
  AO22X1_LVT U121 ( .A1(i_dig_tx_serializer_crc_out[14]), .A2(n31), .A3(
        i_dig_tx_serializer_crc_out[12]), .A4(n29), .Y(n118) );
  AO221X1_LVT U122 ( .A1(i_dig_tx_serializer_crc_out[8]), .A2(n24), .A3(
        i_dig_tx_serializer_crc_out[10]), .A4(n30), .A5(n118), .Y(n123) );
  AO22X1_LVT U123 ( .A1(i_dig_tx_serializer_crc_out[7]), .A2(n31), .A3(
        i_dig_tx_serializer_crc_out[5]), .A4(n29), .Y(n119) );
  AO221X1_LVT U124 ( .A1(i_dig_tx_serializer_crc_out[1]), .A2(n24), .A3(
        i_dig_tx_serializer_crc_out[3]), .A4(n30), .A5(n119), .Y(n122) );
  AO22X1_LVT U125 ( .A1(i_dig_tx_serializer_crc_out[15]), .A2(n31), .A3(
        i_dig_tx_serializer_crc_out[13]), .A4(n29), .Y(n120) );
  AO221X1_LVT U126 ( .A1(i_dig_tx_serializer_crc_out[9]), .A2(n24), .A3(
        i_dig_tx_serializer_crc_out[11]), .A4(n30), .A5(n120), .Y(n121) );
  MUX41X1_LVT U127 ( .A1(n124), .A3(n123), .A2(n122), .A4(n121), .S0(N168), 
        .S1(N165), .Y(n130) );
  INVX1_LVT U128 ( .A(n47), .Y(n125) );
  AND3X1_LVT U129 ( .A1(n3), .A2(n125), .A3(n10), .Y(n127) );
  NAND3X0_LVT U130 ( .A1(n3), .A2(n10), .A3(n13), .Y(n126) );
  MUX21X1_LVT U131 ( .A1(n127), .A2(n126), .S0(n11), .Y(n128) );
  INVX1_LVT U132 ( .A(n140), .Y(n129) );
  NAND2X0_LVT U133 ( .A1(n22), .A2(n134), .Y(n139) );
  NAND3X0_LVT U134 ( .A1(n138), .A2(n139), .A3(n143), .Y(n135) );
  NAND3X0_LVT U135 ( .A1(n137), .A2(n136), .A3(n135), .Y(n67) );
  NAND2X0_LVT U136 ( .A1(n142), .A2(n135), .Y(n66) );
endmodule


module dig_tx_crc_REGISTER_WIDTH16_INPUT_LENGTH56 ( i_dig_tx_crc_clk, 
        i_dig_tx_crc_rst_n, i_dig_tx_crc_data_in, i_dig_tx_crc_en, 
        i_dig_tx_crc_clock_freq_en, o_dig_tx_crc_data_out, o_dig_tx_crc_valid
 );
  output [15:0] o_dig_tx_crc_data_out;
  input i_dig_tx_crc_clk, i_dig_tx_crc_rst_n, i_dig_tx_crc_data_in,
         i_dig_tx_crc_en, i_dig_tx_crc_clock_freq_en;
  output o_dig_tx_crc_valid;
  wire   N14, N15, N16, N17, N18, N19, N20, n2, n3, n140, n150, n160, n170,
         n180, n190, n200, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n1, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         add_57_n6, add_57_n5, add_57_n4, add_57_n3, add_57_n2, add_57_n1;
  wire   [15:0] remainder_d;
  wire   [6:0] counter;

  DFFARX1_LVT counter_reg_0_ ( .D(n53), .CLK(i_dig_tx_crc_clk), .RSTB(n12), 
        .Q(counter[0]) );
  DFFARX1_LVT o_dig_tx_crc_valid_reg ( .D(n52), .CLK(i_dig_tx_crc_clk), .RSTB(
        n12), .Q(o_dig_tx_crc_valid) );
  DFFARX1_LVT counter_reg_1_ ( .D(n35), .CLK(i_dig_tx_crc_clk), .RSTB(n12), 
        .Q(counter[1]) );
  DFFARX1_LVT counter_reg_2_ ( .D(n34), .CLK(i_dig_tx_crc_clk), .RSTB(n12), 
        .Q(counter[2]) );
  DFFARX1_LVT counter_reg_3_ ( .D(n33), .CLK(i_dig_tx_crc_clk), .RSTB(n11), 
        .Q(counter[3]), .QN(n3) );
  DFFARX1_LVT counter_reg_4_ ( .D(n32), .CLK(i_dig_tx_crc_clk), .RSTB(n11), 
        .Q(counter[4]) );
  DFFARX1_LVT counter_reg_5_ ( .D(n31), .CLK(i_dig_tx_crc_clk), .RSTB(n11), 
        .Q(counter[5]) );
  DFFARX1_LVT counter_reg_6_ ( .D(n30), .CLK(i_dig_tx_crc_clk), .RSTB(n11), 
        .Q(counter[6]), .QN(n2) );
  DFFARX1_LVT remainder_d_reg_0_ ( .D(n51), .CLK(i_dig_tx_crc_clk), .RSTB(n11), 
        .Q(remainder_d[0]) );
  DFFARX1_LVT remainder_d_reg_15_ ( .D(n36), .CLK(i_dig_tx_crc_clk), .RSTB(n11), .Q(remainder_d[15]) );
  DFFARX1_LVT remainder_d_reg_14_ ( .D(n37), .CLK(i_dig_tx_crc_clk), .RSTB(n11), .Q(remainder_d[14]) );
  DFFARX1_LVT remainder_d_reg_13_ ( .D(n38), .CLK(i_dig_tx_crc_clk), .RSTB(n11), .Q(remainder_d[13]) );
  DFFARX1_LVT remainder_d_reg_12_ ( .D(n39), .CLK(i_dig_tx_crc_clk), .RSTB(n11), .Q(remainder_d[12]) );
  DFFARX1_LVT remainder_d_reg_11_ ( .D(n40), .CLK(i_dig_tx_crc_clk), .RSTB(n11), .Q(remainder_d[11]), .QN(n8) );
  DFFARX1_LVT remainder_d_reg_10_ ( .D(n41), .CLK(i_dig_tx_crc_clk), .RSTB(n11), .Q(remainder_d[10]) );
  DFFARX1_LVT remainder_d_reg_9_ ( .D(n42), .CLK(i_dig_tx_crc_clk), .RSTB(n11), 
        .Q(remainder_d[9]) );
  DFFARX1_LVT remainder_d_reg_8_ ( .D(n43), .CLK(i_dig_tx_crc_clk), .RSTB(n10), 
        .Q(remainder_d[8]) );
  DFFARX1_LVT remainder_d_reg_7_ ( .D(n44), .CLK(i_dig_tx_crc_clk), .RSTB(n10), 
        .Q(remainder_d[7]) );
  DFFARX1_LVT remainder_d_reg_6_ ( .D(n45), .CLK(i_dig_tx_crc_clk), .RSTB(n10), 
        .Q(remainder_d[6]) );
  DFFARX1_LVT remainder_d_reg_5_ ( .D(n46), .CLK(i_dig_tx_crc_clk), .RSTB(n10), 
        .Q(remainder_d[5]) );
  DFFARX1_LVT remainder_d_reg_4_ ( .D(n47), .CLK(i_dig_tx_crc_clk), .RSTB(n10), 
        .Q(remainder_d[4]), .QN(n6) );
  DFFARX1_LVT remainder_d_reg_3_ ( .D(n48), .CLK(i_dig_tx_crc_clk), .RSTB(n10), 
        .Q(remainder_d[3]) );
  DFFARX1_LVT remainder_d_reg_2_ ( .D(n49), .CLK(i_dig_tx_crc_clk), .RSTB(n10), 
        .Q(remainder_d[2]) );
  DFFARX1_LVT remainder_d_reg_1_ ( .D(n50), .CLK(i_dig_tx_crc_clk), .RSTB(n10), 
        .Q(remainder_d[1]) );
  AO22X1_LVT U29 ( .A1(n4), .A2(remainder_d[11]), .A3(n1), .A4(remainder_d[12]), .Y(n40) );
  AO22X1_LVT U37 ( .A1(n4), .A2(remainder_d[4]), .A3(n1), .A4(remainder_d[5]), 
        .Y(n47) );
  AO22X1_LVT U43 ( .A1(n4), .A2(remainder_d[0]), .A3(n1), .A4(remainder_d[1]), 
        .Y(n51) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_15_ ( .D(n29), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n10), .Q(o_dig_tx_crc_data_out[15]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_14_ ( .D(n28), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n10), .Q(o_dig_tx_crc_data_out[14]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_13_ ( .D(n27), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n10), .Q(o_dig_tx_crc_data_out[13]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_12_ ( .D(n26), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n10), .Q(o_dig_tx_crc_data_out[12]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_11_ ( .D(n25), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n9), .Q(o_dig_tx_crc_data_out[11]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_10_ ( .D(n24), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n9), .Q(o_dig_tx_crc_data_out[10]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_9_ ( .D(n23), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n9), .Q(o_dig_tx_crc_data_out[9]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_8_ ( .D(n22), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n9), .Q(o_dig_tx_crc_data_out[8]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_7_ ( .D(n21), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n9), .Q(o_dig_tx_crc_data_out[7]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_6_ ( .D(n200), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n9), .Q(o_dig_tx_crc_data_out[6]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_5_ ( .D(n190), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n9), .Q(o_dig_tx_crc_data_out[5]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_4_ ( .D(n180), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n9), .Q(o_dig_tx_crc_data_out[4]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_3_ ( .D(n170), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n9), .Q(o_dig_tx_crc_data_out[3]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_2_ ( .D(n160), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n9), .Q(o_dig_tx_crc_data_out[2]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_1_ ( .D(n150), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n9), .Q(o_dig_tx_crc_data_out[1]) );
  DFFARX1_LVT o_dig_tx_crc_data_out_reg_0_ ( .D(n140), .CLK(i_dig_tx_crc_clk), 
        .RSTB(n9), .Q(o_dig_tx_crc_data_out[0]) );
  INVX4_LVT U3 ( .A(n59), .Y(n62) );
  OR2X1_LVT U4 ( .A1(n57), .A2(n55), .Y(n59) );
  AND2X2_LVT U5 ( .A1(n58), .A2(n57), .Y(n1) );
  AND2X2_LVT U6 ( .A1(i_dig_tx_crc_en), .A2(n54), .Y(n4) );
  INVX0_LVT U7 ( .A(i_dig_tx_crc_clock_freq_en), .Y(n54) );
  INVX2_LVT U8 ( .A(n13), .Y(n9) );
  INVX2_LVT U9 ( .A(n13), .Y(n10) );
  INVX2_LVT U10 ( .A(n13), .Y(n11) );
  INVX1_LVT U11 ( .A(n13), .Y(n12) );
  INVX1_LVT U12 ( .A(i_dig_tx_crc_rst_n), .Y(n13) );
  XNOR2X1_LVT U13 ( .A1(remainder_d[0]), .A2(i_dig_tx_crc_data_in), .Y(n60) );
  AO21X1_RVT U14 ( .A1(o_dig_tx_crc_valid), .A2(i_dig_tx_crc_en), .A3(n62), 
        .Y(n52) );
  XOR2X1_LVT U15 ( .A1(n60), .A2(n6), .Y(n5) );
  XOR2X1_LVT U16 ( .A1(n60), .A2(n8), .Y(n7) );
  NAND2X0_LVT U17 ( .A1(i_dig_tx_crc_en), .A2(i_dig_tx_crc_clock_freq_en), .Y(
        n55) );
  INVX1_LVT U18 ( .A(n55), .Y(n58) );
  AND4X1_LVT U19 ( .A1(counter[1]), .A2(counter[0]), .A3(n3), .A4(counter[2]), 
        .Y(n56) );
  NAND4X0_LVT U20 ( .A1(counter[4]), .A2(counter[5]), .A3(n2), .A4(n56), .Y(
        n57) );
  AO22X1_LVT U21 ( .A1(counter[6]), .A2(n4), .A3(N20), .A4(n1), .Y(n30) );
  AO22X1_LVT U22 ( .A1(n4), .A2(counter[5]), .A3(N19), .A4(n1), .Y(n31) );
  AO22X1_LVT U23 ( .A1(n4), .A2(counter[4]), .A3(N18), .A4(n1), .Y(n32) );
  AO22X1_LVT U24 ( .A1(counter[3]), .A2(n4), .A3(N17), .A4(n1), .Y(n33) );
  AO22X1_LVT U25 ( .A1(n4), .A2(counter[2]), .A3(N16), .A4(n1), .Y(n34) );
  AO22X1_LVT U26 ( .A1(n4), .A2(counter[1]), .A3(N15), .A4(n1), .Y(n35) );
  AO22X1_LVT U27 ( .A1(n4), .A2(counter[0]), .A3(N14), .A4(n1), .Y(n53) );
  AO22X1_LVT U28 ( .A1(n1), .A2(n5), .A3(remainder_d[3]), .A4(n4), .Y(n48) );
  AO22X1_LVT U30 ( .A1(remainder_d[2]), .A2(n4), .A3(remainder_d[3]), .A4(n1), 
        .Y(n49) );
  AO22X1_LVT U31 ( .A1(remainder_d[1]), .A2(n4), .A3(remainder_d[2]), .A4(n1), 
        .Y(n50) );
  MUX21X1_LVT U32 ( .A1(o_dig_tx_crc_data_out[0]), .A2(remainder_d[1]), .S0(
        n62), .Y(n140) );
  MUX21X1_LVT U33 ( .A1(o_dig_tx_crc_data_out[1]), .A2(remainder_d[2]), .S0(
        n62), .Y(n150) );
  MUX21X1_LVT U34 ( .A1(o_dig_tx_crc_data_out[2]), .A2(remainder_d[3]), .S0(
        n62), .Y(n160) );
  MUX21X1_LVT U35 ( .A1(o_dig_tx_crc_data_out[3]), .A2(n5), .S0(n62), .Y(n170)
         );
  AO22X1_LVT U36 ( .A1(n1), .A2(n7), .A3(remainder_d[10]), .A4(n4), .Y(n41) );
  AO22X1_LVT U38 ( .A1(remainder_d[9]), .A2(n4), .A3(remainder_d[10]), .A4(n1), 
        .Y(n42) );
  AO22X1_LVT U39 ( .A1(remainder_d[8]), .A2(n4), .A3(remainder_d[9]), .A4(n1), 
        .Y(n43) );
  AO22X1_LVT U40 ( .A1(remainder_d[7]), .A2(n4), .A3(remainder_d[8]), .A4(n1), 
        .Y(n44) );
  AO22X1_LVT U41 ( .A1(remainder_d[6]), .A2(n4), .A3(remainder_d[7]), .A4(n1), 
        .Y(n45) );
  AO22X1_LVT U42 ( .A1(remainder_d[5]), .A2(n4), .A3(remainder_d[6]), .A4(n1), 
        .Y(n46) );
  MUX21X1_LVT U44 ( .A1(o_dig_tx_crc_data_out[4]), .A2(remainder_d[5]), .S0(
        n62), .Y(n180) );
  MUX21X1_LVT U45 ( .A1(o_dig_tx_crc_data_out[5]), .A2(remainder_d[6]), .S0(
        n62), .Y(n190) );
  MUX21X1_LVT U46 ( .A1(o_dig_tx_crc_data_out[6]), .A2(remainder_d[7]), .S0(
        n62), .Y(n200) );
  MUX21X1_LVT U47 ( .A1(o_dig_tx_crc_data_out[7]), .A2(remainder_d[8]), .S0(
        n62), .Y(n21) );
  MUX21X1_LVT U48 ( .A1(o_dig_tx_crc_data_out[8]), .A2(remainder_d[9]), .S0(
        n62), .Y(n22) );
  MUX21X1_LVT U49 ( .A1(o_dig_tx_crc_data_out[9]), .A2(remainder_d[10]), .S0(
        n62), .Y(n23) );
  MUX21X1_LVT U50 ( .A1(o_dig_tx_crc_data_out[10]), .A2(n7), .S0(n62), .Y(n24)
         );
  INVX1_LVT U51 ( .A(n60), .Y(n61) );
  AO22X1_LVT U52 ( .A1(n1), .A2(n61), .A3(remainder_d[15]), .A4(n4), .Y(n36)
         );
  AO22X1_LVT U53 ( .A1(remainder_d[14]), .A2(n4), .A3(remainder_d[15]), .A4(n1), .Y(n37) );
  AO22X1_LVT U54 ( .A1(remainder_d[13]), .A2(n4), .A3(remainder_d[14]), .A4(n1), .Y(n38) );
  AO22X1_LVT U55 ( .A1(remainder_d[12]), .A2(n4), .A3(remainder_d[13]), .A4(n1), .Y(n39) );
  MUX21X1_LVT U56 ( .A1(o_dig_tx_crc_data_out[11]), .A2(remainder_d[12]), .S0(
        n62), .Y(n25) );
  MUX21X1_LVT U57 ( .A1(o_dig_tx_crc_data_out[12]), .A2(remainder_d[13]), .S0(
        n62), .Y(n26) );
  MUX21X1_LVT U58 ( .A1(o_dig_tx_crc_data_out[13]), .A2(remainder_d[14]), .S0(
        n62), .Y(n27) );
  MUX21X1_LVT U59 ( .A1(o_dig_tx_crc_data_out[14]), .A2(remainder_d[15]), .S0(
        n62), .Y(n28) );
  MUX21X1_LVT U60 ( .A1(o_dig_tx_crc_data_out[15]), .A2(n61), .S0(n62), .Y(n29) );
  NAND2X0_LVT add_57_U14 ( .A1(counter[2]), .A2(add_57_n1), .Y(add_57_n6) );
  NAND3X0_LVT add_57_U13 ( .A1(counter[2]), .A2(counter[3]), .A3(add_57_n1), 
        .Y(add_57_n5) );
  INVX1_LVT add_57_U12 ( .A(add_57_n5), .Y(add_57_n4) );
  NAND2X0_LVT add_57_U11 ( .A1(counter[5]), .A2(add_57_n2), .Y(add_57_n3) );
  XNOR2X1_LVT add_57_U10 ( .A1(add_57_n6), .A2(counter[3]), .Y(N17) );
  XNOR2X1_LVT add_57_U9 ( .A1(add_57_n3), .A2(counter[6]), .Y(N20) );
  INVX1_LVT add_57_U8 ( .A(counter[0]), .Y(N14) );
  XOR2X1_LVT add_57_U7 ( .A1(counter[1]), .A2(counter[0]), .Y(N15) );
  XOR2X1_LVT add_57_U6 ( .A1(counter[2]), .A2(add_57_n1), .Y(N16) );
  XNOR2X1_LVT add_57_U5 ( .A1(add_57_n5), .A2(counter[4]), .Y(N18) );
  XOR2X1_LVT add_57_U4 ( .A1(counter[5]), .A2(add_57_n2), .Y(N19) );
  AND2X1_LVT add_57_U3 ( .A1(counter[4]), .A2(add_57_n4), .Y(add_57_n2) );
  AND2X1_LVT add_57_U2 ( .A1(counter[1]), .A2(counter[0]), .Y(add_57_n1) );
endmodule


module dig_tx_pow_man_unit ( i_dig_tx_pow_man_unit_spi_pow_en, 
        o_dig_tx_pow_man_unit_spi_sleep_en );
  input i_dig_tx_pow_man_unit_spi_pow_en;
  output o_dig_tx_pow_man_unit_spi_sleep_en;


  NBUFFX2_LVT U1 ( .A(i_dig_tx_pow_man_unit_spi_pow_en), .Y(
        o_dig_tx_pow_man_unit_spi_sleep_en) );
endmodule


module dig_tx_system ( i_dig_tx_system_clk32, i_dig_tx_system_clk26, 
        i_dig_tx_system_rst_n, i_dig_tx_system_data_in, i_dig_tx_system_csn, 
        o_dig_tx_system_data_out, o_dig_tx_system_crc_valid, 
        o_dig_tx_system_regfile_valid, o_dig_tx_system_output_valid, 
        o_dig_tx_system_data_slave_out, o_dig_tx_system_done, 
        o_dig_tx_system_miso_ena, o_dig_tx_system_miso );
  output [7:0] o_dig_tx_system_data_slave_out;
  input i_dig_tx_system_clk32, i_dig_tx_system_clk26, i_dig_tx_system_rst_n,
         i_dig_tx_system_data_in, i_dig_tx_system_csn;
  output o_dig_tx_system_data_out, o_dig_tx_system_crc_valid,
         o_dig_tx_system_regfile_valid, o_dig_tx_system_output_valid,
         o_dig_tx_system_done, o_dig_tx_system_miso_ena, o_dig_tx_system_miso;
  wire   reg_file_tx_start, system_gated_clock, control_unit_spi_clk_en,
         spi_gated_clock, spi_rst_sync, sys_rst_sync, slave_wr_re_en,
         fifo_wr_enable, n_4_net_, fifo_re_en, fifo_empty, fifo_wr_delayed_en,
         spi_re_en, reg_file_busy, reg_file_tx_done, reg_file_tx_mode,
         reg_file_power_domain, control_unit_shr_crc_done,
         control_unit_data_crc_done, control_unit_crc_phy_done,
         control_unit_serializer_shr_en, control_unit_serializer_payload_en,
         control_unit_serializer_crc_en, control_unit_crc_en,
         control_unit_clock_freq_en, spi_pow_en, serializer_data_to_crc,
         clock_freq_en, n1, n2, n3, SYNOPSYS_UNCONNECTED_1,
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

  OR2X1_LVT U4 ( .A1(slave_wr_re_en), .A2(fifo_wr_enable), .Y(n_4_net_) );
  NBUFFX2_LVT U5 ( .A(fifo_wr_enable), .Y(n1) );
  INVX4_LVT U6 ( .A(n3), .Y(n2) );
  INVX1_LVT U7 ( .A(sys_rst_sync), .Y(n3) );
  dig_tx_clock_gating_0 u_dig_tx_sys_clock_gating ( 
        .i_dig_tx_clock_gating_clk(i_dig_tx_system_clk32), 
        .i_dig_tx_clock_gating_enable(reg_file_tx_start), 
        .o_dig_tx_clock_gating_gated_clock(system_gated_clock) );
  dig_tx_clock_gating_1 u_dig_tx_spi_clock_gating ( 
        .i_dig_tx_clock_gating_clk(i_dig_tx_system_clk26), 
        .i_dig_tx_clock_gating_enable(control_unit_spi_clk_en), 
        .o_dig_tx_clock_gating_gated_clock(spi_gated_clock) );
  dig_tx_rst_sync_0 u_dig_tx_rst_sync_spi ( .i_dig_tx_rst_sync_clk(
        spi_gated_clock), .i_dig_tx_rst_sync_rst_n(i_dig_tx_system_rst_n), 
        .o_dig_tx_rst_sync_rst_n(spi_rst_sync) );
  dig_tx_rst_sync_1 u_dig_tx_rst_sync_sys ( .i_dig_tx_rst_sync_clk(
        i_dig_tx_system_clk32), .i_dig_tx_rst_sync_rst_n(i_dig_tx_system_rst_n), .o_dig_tx_rst_sync_rst_n(sys_rst_sync) );
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
  dig_tx_asyn_fifo_FIFO_DEPTH8_REGISTER_WIDTH8_ADDRESS_WIDTH3_VALID_WIDTH1 u_dig_tx_asyn_fifo_read ( 
        .i_dig_tx_asyn_fifo_clk26(spi_gated_clock), .i_dig_tx_asyn_fifo_clk32(
        i_dig_tx_system_clk32), .i_dig_tx_asyn_fifo_wr_rst_n(spi_rst_sync), 
        .i_dig_tx_asyn_fifo_re_rst_n(n2), .i_dig_tx_asyn_fifo_wr_en(n_4_net_), 
        .i_dig_tx_asyn_fifo_re_en(fifo_re_en), .i_dig_tx_asyn_fifo_data_in({
        1'b0, slave_addr_out, dig_tx_spi_slave_data_out}), 
        .o_dig_tx_asyn_fifo_data_out({SYNOPSYS_UNCONNECTED_6, fifo_addr_out, 
        fifo_data_out}), .o_dig_tx_asyn_fifo_empty(fifo_empty) );
  dig_tx_pulse_delayed u_dig_tx_pulse_delayed ( .i_dix_pulse_delayed_clk32(
        i_dig_tx_system_clk32), .i_dix_pulse_delayed_rst_n(n2), 
        .i_dix_pulse_delayed_din(n1), .o_dix_pulse_d0(fifo_wr_delayed_en) );
  dig_tx_asyn_fifo_FIFO_DEPTH3_REGISTER_WIDTH8 u_dig_tx_asyn_fifo_write ( 
        .i_dig_tx_asyn_fifo_clk26(i_dig_tx_system_clk32), 
        .i_dig_tx_asyn_fifo_clk32(spi_gated_clock), 
        .i_dig_tx_asyn_fifo_wr_rst_n(n2), .i_dig_tx_asyn_fifo_re_rst_n(
        spi_rst_sync), .i_dig_tx_asyn_fifo_wr_en(fifo_wr_delayed_en), 
        .i_dig_tx_asyn_fifo_re_en(1'b1), .i_dig_tx_asyn_fifo_data_in(
        reg_file_spi_out), .o_dig_tx_asyn_fifo_data_out(
        o_dig_tx_system_data_slave_out) );
  dig_tx_reg_file_REGISTER_DEPTH5_REGISTER_WIDTH8_PAYLOAD_WIDTH32 u_dig_tx_reg_file ( 
        .i_dig_tx_reg_file_clk(i_dig_tx_system_clk32), 
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
        i_dig_tx_system_clk32), .i_dig_tx_control_unit_rst_n(n2), 
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

