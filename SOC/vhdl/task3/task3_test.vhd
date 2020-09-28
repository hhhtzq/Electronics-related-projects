----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/02/28 23:34:15
-- Design Name: 
-- Module Name: test_echo - Behavioral
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

entity task3_test is
    
end task3_test;

architecture Behavioral of task3_test is
component echo_analyzer is 
     Port ( echo_in : in std_logic;
           	ck_1us : in std_logic;
           	echo_out : out std_logic_vector(15 downto 0)
           );
      end component;
signal echo_in : STD_logic:=  '0';
signal ck_1us : STD_logic:=  '0';
signal echo_out : STD_logic_vector(15 downto 0);    
--signal clk1 : STD_LOGIC :=  '1';
--signal echo_pulse : STD_LOGIC:=  '0';
--signal pulse_duration : STD_LOGIC_VECTOR(16 downto 0);
--signal count : STD_LOGIC_VECTOR(16 downto 0);
--signal count1 : STD_LOGIC_VECTOR(16 downto 0);
--signal count2 : STD_LOGIC_VECTOR(16 downto 0);
begin
   uut: echo_analyzer port map(echo_in=> echo_in, ck_1us=>ck_1us, echo_out => echo_out);
   
   clock_generator: process (ck_1us)
       constant T_pw : time :=500 ns;
        begin
             if ck_1us = '0' then 
                ck_1us <= '1' after T_pw, '0' after 2*T_pw;
             end if;
        end process clock_generator;
  echo_in_generator: process(echo_in)
   constant T: time :=240 us;
   begin
         if echo_in = '0' then 
         echo_in <= '1' after T,'0' after 2*T;
         end if;
   end process echo_in_generator;
end Behavioral;
