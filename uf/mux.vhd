library ieee;
use ieee.std_logic_1164.all;

entity mux is
  port (
    soma        : in  std_logic_vector(15 downto 0);
    subtracao   : in  std_logic_vector(15 downto 0);
    sel         : in  std_logic;
    saida       : out std_logic_vector(15 downto 0) 
  );
end mux;

architecture mux_arch of mux is
begin
  saida <= soma when sel = '0' else
           subtracao;
end mux_arch;