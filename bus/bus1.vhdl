library ieee;
use ieee.std_logic_1164.all;

entity bus1 is
  port(
    inTS7:  in  std_logic_vector(15 downto 0);
    enTS7:  in  std_logic;
    inTS8:  in  std_logic_vector(15 downto 0);
    enTS8:  in  std_logic;
    inTS10: in  std_logic_vector(15 downto 0);
    enTS10: in  std_logic;
    inTS15: in  std_logic_vector(15 downto 0);
    enTS15: in  std_logic;
    output: out std_logic_vector(15 downto 0)
  );
end bus1;

architecture arch of bus1 is
  begin

  output <= inTS7  when (enTS7 = '1' and enTS8 = '0' and enTS10 = '0' and enTS15 = '0') else
            inTS8  when (enTS7 = '0' and enTS8 = '1' and enTS10 = '0' and enTS15 = '0') else 
            inTS10 when (enTS7 = '0' and enTS8 = '0' and enTS10 = '1' and enTS15 = '0') else
            inTS15 when (enTS7 = '0' and enTS8 = '0' and enTS10 = '0' and enTS15 = '1') else 
            (others => 'Z');
end arch;