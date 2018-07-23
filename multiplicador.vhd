library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

entity multiplicador_16bits is
    port (
        A , B       : in  std_logic_vector(15 downto 0);
        resultado   : out std_logic_vector(15 downto 0)
    );
end multiplicador_16bits;

architecture multiplicador_16bits_arch of multiplicador_16bits is
signal s1, s2   : sfixed(3 downto -12);
signal x        : sfixed(3 downto -12);

begin
    s1 <= to_sfixed(A, s1);
    s2 <= to_sfixed(A, s2);
    x <= resize(s1 * s2, x);

    resultado <= std_logic_vector(x);
end multiplicador_16bits_arch;
