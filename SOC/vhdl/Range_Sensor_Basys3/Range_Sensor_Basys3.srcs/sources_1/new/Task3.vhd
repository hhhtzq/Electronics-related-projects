LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.NUMERIC_STD.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
USE ieee.STD_LOGIC_ARITH.ALL;

entity Pulse_Generator is
Port(
fpgaclk : in STD_LOGIC;
trigger_out : out STD_LOGIC;
clk_1us : inout STD_LOGIC);
end Pulse_Generator;

architecture Behavioral of Pulse_Generator is


component Clock_Generator
port(   fpgaclk: in STD_LOGIC;
clk_1us: out STD_LOGIC);
end component;

component Pulse_Module
port(   clk_1us : in STD_LOGIC;
trigger_out : out STD_LOGIC);
end component;

begin
Task_1: Clock_Generator
port map(   fpgaclk => fpgaclk,
clk_1us => clk_1us
);
Task_3:Pulse_Module
port map(   clk_1us => clk_1us,
trigger_out => trigger_out);

end Behavioral;