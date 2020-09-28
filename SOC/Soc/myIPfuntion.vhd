library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity myIPfuntion is
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
end myIPfuntion;

architecture arch_myIPfuntion of myIPfuntion is
	signal result64 : std_logic_vector (63 downto 0);

	begin
	process (clk)
		begin
			if rising_edge(clk) then
--				result64 <= std_logic_vector(unsigned(op1) * unsigned(op2));
				result64 <= op1 * op2;
				prodL <= result64(31 downto 0);
				prodH <= result64(63 downto 32);
			end if;
	end process;
end arch_myIPfuntion;

