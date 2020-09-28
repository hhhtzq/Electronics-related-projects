LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.NUMERIC_STD.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
USE ieee.STD_LOGIC_ARITH.ALL;

entity Pulse_Module is
Port( clk_1us : in STD_LOGIC;
trigger_out : out STD_LOGIC);
end Pulse_Module;

architecture Behavioral of Pulse_Module is

signal cnt : integer :=0;
signal inclk: STD_LOGIC :='0';

begin

process(clk_1us)
begin
if clk_1us'event and clk_1us='1' then
if cnt < 10 then
inclk<='1';
cnt<= cnt+1;
elsif cnt< 99999 then
cnt<= cnt+1;
inclk<='0';
else
cnt<=0;
end if;

trigger_out<= inclk;
end if;
end process;

end Behavioral;