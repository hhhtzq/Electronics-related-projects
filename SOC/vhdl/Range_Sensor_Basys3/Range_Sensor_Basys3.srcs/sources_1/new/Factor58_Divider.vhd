LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.NUMERIC_STD.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
USE ieee.STD_LOGIC_ARITH.ALL;

entity Factor58_Divider is
Port(
Pulse_Duration : in  STD_LOGIC_VECTOR(15 downto 0);
range_out :      out STD_LOGIC_VECTOR(8 downto 0);
clk_1us :        in STD_LOGIC
);
end Factor58_Divider;

architecture Behavioral of Factor58_Divider is

begin
process(clk_1us)

variable input_value : integer := 0;
--variable temp1 : integer := 0;
variable output_value : integer := 0;

begin

if rising_edge(clk_1us) then

input_value := conv_integer(Pulse_Duration);
output_value:= input_value/58;
range_out <= STD_LOGIC_vector(to_unsigned(output_value, range_out'length));

end if;

end process;

end Behavioral;