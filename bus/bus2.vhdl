library ieee;
use ieee.std_logic_1164.all;

entity bus2 is
  port(
    inTS1:  in  std_logic_vector(15 downto 0);
    enTS1:  in  std_logic;
    inTS2:  in  std_logic_vector(15 downto 0);
    enTS2:  in  std_logic;
    inTS13: in  std_logic_vector(15 downto 0);
    enTS13: in  std_logic;
    inTS16: in  std_logic_vector(15 downto 0);
    enTS16: in  std_logic;
    output: out std_logic_vector(15 downto 0)
  );
end bus2;

architecture arch of bus2 is
  begin
    process(enTS1, enTS2, enTS13, enTS16)
    begin
    if enTS1 = '1' and enTS2 = '0' and enTS13 = '0' and enTS16 = '0' then
      output <= inTS1;
    elsif enTS1 = '0' and enTS2 = '1' and enTS13 = '0' and enTS16 = '0' then
      output <= inTS2;
    elsif enTS1 = '0' and enTS2 = '0' and enTS13 = '1' and enTS16 = '0' then
      output <= inTS13;
    elsif enTS1 = '0' and enTS2 = '0' and enTS13 = '0' and enTS16 = '1' then
      output <= inTS16;
    else 
      output <= (others => 'Z');
    end if;
  end process;
end arch;