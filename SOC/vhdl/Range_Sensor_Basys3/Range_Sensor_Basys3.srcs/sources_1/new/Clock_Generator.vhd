LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.NUMERIC_STD.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
USE ieee.STD_LOGIC_ARITH.ALL;

entity Clock_Generator is
Port(
fpgaclk : in STD_LOGIC;
clk_1us : out STD_LOGIC);
end Clock_Generator;

architecture Behavioral of Clock_Generator is

signal cnt : integer :=0;
signal inclk: STD_LOGIC :='0';

begin
process(fpgaclk)
begin
if fpgaclk'event and fpgaclk='1' then
if cnt < 49 then
cnt<= cnt+1;
else
cnt<=0;
inclk<= not inclk;
end if;

clk_1us<= inclk;
end if;
end process;
end Behavioral;