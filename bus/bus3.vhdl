library ieee;
use ieee.std_logic_1164.all;

entity bus3 is
  port(
    inTS3:  in  std_logic_vector(15 downto 0);
    enTS3:  in  std_logic;
    inTS11: in  std_logic_vector(15 downto 0);
    enTS11: in  std_logic;
    inTS14: in  std_logic_vector(15 downto 0);
    enTS14: in  std_logic;
    output: out std_logic_vector(15 downto 0)
  );
end bus3;

architecture arch of bus3 is
  begin

  output <= inTS3  when (enTS3 = '1' and enTS11 = '0' and enTS14 = '0') else 
            inTS11 when (enTS3 = '0' and enTS11 = '1' and enTS14 = '0') else
            inTS14 when (enTS3 = '0' and enTS11 = '0' and enTS14 = '1') else
            (others => 'Z');
   
end arch;