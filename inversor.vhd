library ieee;
use ieee.std_logic_1164.all;

entity inversor is
    port (
        clock       : in  std_logic;
        entrada     : in  std_logic_vector(15 downto 0);
        saida       : out std_logic_vector(15 downto 0)
    );
end inversor;

architecture inversor_arch of inversor is
begin
    process (clock)
    begin
        if clock'event and clock = '1' then
            saida <= NOT entrada;
        end if;
    end process;
end inversor_arch;
