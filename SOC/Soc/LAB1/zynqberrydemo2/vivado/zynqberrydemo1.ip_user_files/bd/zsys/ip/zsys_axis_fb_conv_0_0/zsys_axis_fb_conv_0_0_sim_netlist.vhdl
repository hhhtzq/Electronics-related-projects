-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
-- Date        : Tue Sep 19 15:18:50 2017
-- Host        : ID20866584 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               c:/ZynqBerry/te0726-zynqberrydemo1-vivado_2017.1-build_03_20170705132546/zynqberrydemo1/vivado/zynqberrydemo1.srcs/sources_1/bd/zsys/ip/zsys_axis_fb_conv_0_0/zsys_axis_fb_conv_0_0_sim_netlist.vhdl
-- Design      : zsys_axis_fb_conv_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_fb_conv_0_0 is
  port (
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tuser : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC;
    video_out_tdata : out STD_LOGIC_VECTOR ( 23 downto 0 );
    video_out_tlast : out STD_LOGIC;
    video_out_tuser : out STD_LOGIC;
    video_out_tvalid : out STD_LOGIC;
    video_out_tready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of zsys_axis_fb_conv_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of zsys_axis_fb_conv_0_0 : entity is "zsys_axis_fb_conv_0_0,axis_fb_conv_v1_0,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of zsys_axis_fb_conv_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of zsys_axis_fb_conv_0_0 : entity is "axis_fb_conv_v1_0,Vivado 2017.1";
end zsys_axis_fb_conv_0_0;

architecture STRUCTURE of zsys_axis_fb_conv_0_0 is
  signal \^s_axis_tdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s_axis_tlast\ : STD_LOGIC;
  signal \^s_axis_tuser\ : STD_LOGIC;
  signal \^s_axis_tvalid\ : STD_LOGIC;
  signal \^video_out_tready\ : STD_LOGIC;
begin
  \^s_axis_tdata\(23 downto 0) <= s_axis_tdata(23 downto 0);
  \^s_axis_tlast\ <= s_axis_tlast;
  \^s_axis_tuser\ <= s_axis_tuser;
  \^s_axis_tvalid\ <= s_axis_tvalid;
  \^video_out_tready\ <= video_out_tready;
  s_axis_tready <= \^video_out_tready\;
  video_out_tdata(23 downto 16) <= \^s_axis_tdata\(7 downto 0);
  video_out_tdata(15 downto 0) <= \^s_axis_tdata\(23 downto 8);
  video_out_tlast <= \^s_axis_tlast\;
  video_out_tuser <= \^s_axis_tuser\;
  video_out_tvalid <= \^s_axis_tvalid\;
end STRUCTURE;
