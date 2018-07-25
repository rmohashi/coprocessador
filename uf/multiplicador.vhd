library ieee;
use ieee.std_logic_1164.all;
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

entity multiplicador_16bits is
  port (
    A , B       : in  std_logic_vector(15 downto 0);
    resultado   : out std_logic_vector(15 downto 0) 
  );
end multiplicador_16bits;

architecture arch of multiplicador_16bits is
  signal s_a, s_b   : sfixed(3 downto -12);
  signal s_r        : sfixed(3 downto -12) := (others => '0');
begin

  s_a <= sfixed(A);
  s_b <= sfixed(B);
  s_r <= resize(s_a * s_b, s_r);
  resultado <= to_slv(s_r);
  
end arch;