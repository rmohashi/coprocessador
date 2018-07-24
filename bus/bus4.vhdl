library ieee;
use ieee.std_logic_1164.all;

entity bus4 is
  port(
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
    process(enTS4, enTS5, enTS6, enTS12)
    begin
    if enTS4 = '1' and enTS5 = '0' and enTS6 = '0' and enTS12 = '0' then
      output <= inTS4;
    elsif enTS4 = '0' and enTS5 = '1' and enTS6 = '0' and enTS12 = '0' then
      output <= inTS5;
    elsif enTS4 = '0' and enTS5 = '0' and enTS6 = '1' and enTS12 = '0' then
      output <= inTS6;
    elsif enTS4 = '0' and enTS5 = '0' and enTS6 = '0' and enTS12 = '1' then
      output <= inTS12;
    else 
      output <= (others => 'Z');
    end if;
  end process;
end arch;