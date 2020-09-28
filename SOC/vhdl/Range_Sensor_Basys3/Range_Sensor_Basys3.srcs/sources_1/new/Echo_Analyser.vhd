LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.NUMERIC_STD.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
USE ieee.STD_LOGIC_ARITH.ALL;

entity Echo_Analyser is
Port(
clk_1us:          in  STD_LOGIC;
Pulse_In:        in  STD_LOGIC;
Pulse_duration:        out STD_LOGIC_VECTOR(15 downto 0)
);
end Echo_Analyser;

architecture Behavioral of Echo_Analyser is

begin

process(clk_1us)

variable counter,counter1 : integer := 0;
variable reset : integer := 0;

begin
if rising_edge(clk_1us) then
if pulse_In = '1' then
counter := counter +1;
counter1 := counter;
else--if falling_Edge (Pulse_in)then

Pulse_duration <= STD_LOGIC_vector(to_unsigned(counter1, Pulse_duration'length));
counter:=0;
end if;
end if;

end process;

end Behavioral;