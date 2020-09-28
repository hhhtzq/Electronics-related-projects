LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.NUMERIC_STD.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
USE ieee.STD_LOGIC_ARITH.ALL;

entity Range_Sensor is
Port(
fpgaclk : in STD_LOGIC;
pulse_in : in STD_LOGIC;
trigger_out : out STD_LOGIC;
range_out : out STD_LOGIC_VECTOR(8 downto 0));
end Range_Sensor;

architecture Behavioral of Range_Sensor is

signal clk_1us : STD_LOGIC;
signal Pulse_Duration :  STD_LOGIC_VECTOR(15 downto 0);

component Pulse_Generator
port(
fpgaclk : in STD_LOGIC;
trigger_out : out STD_LOGIC;
clk_1us : inout STD_LOGIC);
end component;

component Factor58_Divider
port(
clk_1us : in STD_LOGIC;
Pulse_Duration : in  STD_LOGIC_VECTOR(15 downto 0);
range_out : out STD_LOGIC_VECTOR(8 downto 0));
end component;

component Echo_Analyser
port(
clk_1us:            in  STD_LOGIC;
Pulse_In:           in  STD_LOGIC;
Pulse_duration:     out STD_LOGIC_VECTOR(15 downto 0));
end component;

begin

Task_2: Factor58_Divider
port map(
clk_1us => clk_1us,
Pulse_Duration => Pulse_Duration,
range_out => range_out
);

Task_3: Pulse_Generator
port map(
fpgaclk => fpgaclk,
clk_1us => clk_1us,
trigger_out => trigger_out
);

Task_4: Echo_Analyser
port map(
clk_1us => clk_1us,
Pulse_In => Pulse_In,
Pulse_duration => Pulse_duration
);

end Behavioral;