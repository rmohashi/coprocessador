library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplicador_16bits is
    port (
        clock       : in  std_logic;
        A , B       : in  std_logic_vector(15 downto 0);
        resultado   : out std_logic_vector(31 downto 0)
    );
end multiplicador_16bits;

architecture multiplicador_16bits_arch of multiplicador_16bits is
signal x : std_logic_vector(31 downto 0);

begin
    process (clock, x)
    begin
        if clock'event and clock = '1' then
            x <= std_logic_vector(unsigned(A) * unsigned(B));
        end if;

        resultado <= x;
    end process;
end multiplicador_16bits_arch;
