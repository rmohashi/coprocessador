library ieee;
use ieee.std_logic_1164.all;
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

entity somador_subtrator is
  port (
    A           : in  std_logic_vector(15 downto 0);
    B           : in  std_logic_vector(15 downto 0);
    sel         : in  std_logic;                        -- 0 = soma/ 1 = sub
    resultado   : out std_logic_vector(15 downto 0) := (others => '0')
  );
end somador_subtrator;

architecture arch of somador_subtrator is
  signal s_a, s_b     : sfixed(3 downto -12);
  signal s_sum, s_sub : sfixed(3 downto -12) := (others => '0');
begin
  s_a <= sfixed(A);
  s_b <= sfixed(B);
  s_sum <= resize(s_a + s_b, s_sum);
  s_sub <= resize(s_a - s_b, s_sub);

  resultado <= to_slv(s_sub) when sel = '1' else to_slv(s_sum);
end arch;