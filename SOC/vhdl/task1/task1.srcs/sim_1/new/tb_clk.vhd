----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/02/13 16:31:43
-- Design Name: 
-- Module Name: tb_clk - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_clk is
end tb_clk;

architecture Behavioral of tb_clk is

component clk_gen is
       Port ( fpga_ck : in STD_LOGIC;
   ck_1us : out STD_LOGIC
      );
end component;

signal clk : STD_LOGIC := '0';
signal triggout : STD_LOGIC;

begin
uut : clk_gen port map(clk => tb_clk, triggout => tb_triggout);

process(clk)
tb_clk <= not tb_clk after 100ns;