library ieee;
use ieee.std_logic_1164.all;

entity bus4 is
  port(
    inTS2:  in  std_logic_vector(15 downto 0);
    enTS2:  in  std_logic;
    inTS4:  in  std_logic_vector(15 downto 0);
    enTS4:  in  std_logic;
    inTS5:  in  std_logic_vector(15 downto 0);
    enTS5:  in  std_logic;
    inTS6:  in  std_logic_vector(15 downto 0);
    enTS6:  in  std_logic;
    inTS12: in  std_logic_vector(15 downto 0);
    enTS12: in  std_logic;
    output: out std_logic_vector(15 downto 0)
  );
end bus4;

architecture arch of bus4 is
  begin

  output <= inTS2  when (enTS2 = '1' and enTS4 = '0' and enTS5 = '0' and enTS6 = '0' and enTS12 = '0') else
            inTS4  when (enTS2 = '0' and enTS4 = '1' and enTS5 = '0' and enTS6 = '0' and enTS12 = '0') else
            inTS5  when (enTS2 = '0' and enTS4 = '0' and enTS5 = '1' and enTS6 = '0' and enTS12 = '0') else
            inTS6  when (enTS2 = '0' and enTS4 = '0' and enTS5 = '0' and enTS6 = '1' and enTS12 = '0') else
            inTS12 when (enTS2 = '0' and enTS4 = '0' and enTS5 = '0' and enTS6 = '0' and enTS12 = '1') else
            (others => 'Z');
end arch;
