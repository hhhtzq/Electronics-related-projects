-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
-- Date        : Tue Sep 19 15:15:53 2017
-- Host        : ID20866584 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/ZynqBerry/te0726-zynqberrydemo1-vivado_2017.1-build_03_20170705132546/zynqberrydemo1/vivado/zynqberrydemo1.srcs/sources_1/bd/zsys/ip/zsys_axis_to_i2s_0_0/zsys_axis_to_i2s_0_0_stub.vhdl
-- Design      : zsys_axis_to_i2s_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zsys_axis_to_i2s_0_0 is
  Port ( 
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    i2s_bclk : in STD_LOGIC;
    i2s_lrclk : in STD_LOGIC;
    i2s_sdata : out STD_LOGIC
  );

end zsys_axis_to_i2s_0_0;

architecture stub of zsys_axis_to_i2s_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axis_aclk,s_axis_aresetn,s_axis_tready,s_axis_tdata[15:0],s_axis_tvalid,i2s_bclk,i2s_lrclk,i2s_sdata";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "axis_to_i2s,Vivado 2017.1";
begin
end;
