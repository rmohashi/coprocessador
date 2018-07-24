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
    process(enTS7, enTS8, enTS10, enTS15)
    begin
    if enTS7 = '1' and enTS8 = '0' and enTS10 = '0' and enTS15 = '0' then
      output <= inTS7;
    elsif enTS7 = '0' and enTS8 = '1' and enTS10 = '0' and enTS15 = '0' then
      output <= inTS8;
    elsif enTS7 = '0' and enTS8 = '0' and enTS10 = '1' and enTS15 = '0' then
      output <= inTS10;
    elsif enTS7 = '0' and enTS8 = '0' and enTS10 = '0' and enTS15 = '1' then
      output <= inTS15;
    else 
      output <= (others => 'Z');
    end if;
  end process;
end arch;