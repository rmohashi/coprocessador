library ieee;
use ieee.std_logic_1164.all;

entity inversor is
  port (
    entrada     : in  std_logic_vector(15 downto 0);
    saida       : out std_logic_vector(15 downto 0) 
  );
end inversor;

architecture inversor_arch of inversor is
begin
  saida <= NOT entrada;
end inversor_arch;