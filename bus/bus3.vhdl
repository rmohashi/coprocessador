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
    process(enTS3, enTS11, enTS14)
    begin
    if enTS3 = '1' and enTS11 = '0' and enTS14 = '0'  then
      output <= inTS3;
    elsif enTS3 = '0' and enTS11 = '1' and enTS14 = '0'  then
      output <= inTS11;
    elsif enTS3 = '0' and enTS11 = '0' and enTS14 = '1'  then
      output <= inTS14;
    else 
      output <= (others => 'Z');
    end if;
  end process;
end arch;