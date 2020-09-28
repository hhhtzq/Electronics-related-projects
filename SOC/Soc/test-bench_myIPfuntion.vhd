 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testMult is
--  Port ( );
end testMult;

architecture Behavioral of testMult is

component myIPfuntion 
    generic (
-- 		Width of operands and result
		DATA_WIDTH : integer    := 32
	);
    Port (
		clk : in std_logic;
		op1 : in std_logic_vector(DATA_WIDTH-1 downto 0);
		op2 : in std_logic_vector(DATA_WIDTH-1 downto 0);
		prodL : out std_logic_vector(DATA_WIDTH-1 downto 0);
		prodH : out std_logic_vector(DATA_WIDTH-1 downto 0)
	); 
end component;

signal s_op1, s_op2, s_prodL, s_prodH : std_logic_vector(31 downto 0);
signal s_clk : std_logic := '0';


begin

uut: myIPfuntion generic map (DATA_WIDTH => 32) port map (
            clk => s_clk,
            op1 => s_op1,
            op2 => s_op2,
            prodL => s_prodL,
            prodH => s_prodH );
        
 s_clk <= not s_clk after 100 ns;
 s_op1 <= CONV_STD_LOGIC_VECTOR(5,32) after 1 us, CONV_STD_LOGIC_VECTOR(7,32) after 2 us;
 s_op2 <= CONV_STD_LOGIC_VECTOR(2,32) after 1 us, CONV_STD_LOGIC_VECTOR(5,32) after 2 us;

end Behavioral;
