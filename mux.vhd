library ieee;
use ieee.std_logic_1164.all;

entity mux is
    port (
        clock       : in  std_logic;
        soma        : in  std_logic_vector(15 downto 0);
        subtracao   : in  std_logic_vector(15 downto 0);
        sel         : in  std_logic;
        saida       : out std_logic_vector(15 downto 0)
    );
end mux;

architecture mux_arch of mux is
begin
    process (clock)
    begin
        if clock'event and clock = '1' then
            if sel = '0' then
                saida <= soma;
            else 
                saida <= subtracao;
            end if;
        end if;
    end process;
end mux_arch;
