library ieee;
use ieee.std_logic_1164.all;
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

entity divisor_16bits is
  port (
    clk         : in  std_logic;
    A , B       : in  std_logic_vector(15 downto 0);
    resultado   : out std_logic_vector(15 downto 0)
  );
end divisor_16bits;

architecture arch of divisor_16bits is
  signal s_a        : sfixed(3 downto -12);
  signal s_b        : sfixed(15 downto 0);
  signal s_r        : sfixed(3 downto -12) := (others => '0');
begin

  s_a <= sfixed(A);
  s_b <= sfixed(B);
  s_r <= resize(s_a / s_b, s_r);
  
  resultado <= to_slv(s_r);
  -- process(clk)
  -- begin
  --   if rising_edge(clk) then
  --     resultado <= to_slv(s_r);
  --   end if;
  -- end process;
end arch;