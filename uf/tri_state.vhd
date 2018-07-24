library ieee;
use ieee.std_logic_1164.all;

entity tri_state is
  port (
    entrada     : in  std_logic_vector(15 downto 0);
    enable      : in  std_logic;
    saida       : out std_logic_vector(15 downto 0) := (others => 'Z')
  );
end tri_state;

architecture inversor_arch of tri_state is
begin
  saida <= entrada when enable = '1' else (others => 'Z');
end inversor_arch;