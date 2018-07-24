library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
  port (
    a           : in  std_logic_vector(15 downto 0);
    b           : in  std_logic_vector(15 downto 0);
    c           : in  std_logic_vector(15 downto 0);
    d           : in  std_logic_vector(15 downto 0);
    sel         : in  std_logic_vector(0 to 1);
    saida       : out std_logic_vector(15 downto 0)
  );
end mux4to1;

architecture arch of mux4to1 is
begin
  saida <= a when (SEL = "00") else
           b when (SEL = "01") else
           c when (SEL = "10") else
           d when (SEL = "11") else 
           (others => 'Z');
end arch;