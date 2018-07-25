library ieee;
use ieee.std_logic_1164.all;

entity bus2 is
  port(
    inTS1:  in  std_logic_vector(15 downto 0);
    enTS1:  in  std_logic;
    inTS13: in  std_logic_vector(15 downto 0);
    enTS13: in  std_logic;
    inTS16: in  std_logic_vector(15 downto 0);
    enTS16: in  std_logic;
    output: out std_logic_vector(15 downto 0)
  );
end bus2;

architecture arch of bus2 is
  begin
    output <= inTS1  when (enTS1 = '1' and enTS13 = '0' and enTS16 = '0') else
              inTS13 when (enTS1 = '0' and enTS13 = '1' and enTS16 = '0') else
              inTS16 when (enTS1 = '0' and enTS13 = '0' and enTS16 = '1') else
              (others => 'Z');

end arch;
