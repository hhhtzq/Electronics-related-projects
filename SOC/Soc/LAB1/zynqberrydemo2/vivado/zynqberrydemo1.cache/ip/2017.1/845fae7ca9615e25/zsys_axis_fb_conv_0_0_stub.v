// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
// Date        : Tue Sep 19 15:18:49 2017
// Host        : ID20866584 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ zsys_axis_fb_conv_0_0_stub.v
// Design      : zsys_axis_fb_conv_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "axis_fb_conv_v1_0,Vivado 2017.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axis_tdata, s_axis_tlast, s_axis_tuser, 
  s_axis_tvalid, s_axis_tready, s_axis_aclk, s_axis_aresetn, video_out_tdata, 
  video_out_tlast, video_out_tuser, video_out_tvalid, video_out_tready)
/* synthesis syn_black_box black_box_pad_pin="s_axis_tdata[31:0],s_axis_tlast,s_axis_tuser,s_axis_tvalid,s_axis_tready,s_axis_aclk,s_axis_aresetn,video_out_tdata[23:0],video_out_tlast,video_out_tuser,video_out_tvalid,video_out_tready" */;
  input [31:0]s_axis_tdata;
  input s_axis_tlast;
  input s_axis_tuser;
  input s_axis_tvalid;
  output s_axis_tready;
  input s_axis_aclk;
  input s_axis_aresetn;
  output [23:0]video_out_tdata;
  output video_out_tlast;
  output video_out_tuser;
  output video_out_tvalid;
  input video_out_tready;
endmodule
