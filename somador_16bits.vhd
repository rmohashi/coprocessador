library ieee;
use ieee.std_logic_1164.all;

entity somador_16bits is
    port (
        clock       : in  std_logic;
        cin         : in  std_logic;
        A , B       : in  std_logic_vector(15 downto 0);
        cout        : out std_logic;
        resultado   : out std_logic_vector(15 downto 0)
    );
end somador_16bits;

architecture somador_16bits_arch of somador_16bits is
begin
    process(clock, A, B, cin)
    variable soma   : std_logic_vector(15 downto 0);
    variable c      : std_logic;
    begin
        if clock'event and clock = '1' then
            c := cin;
            for i in 0 to 15 loop
                soma(i) := A(i) xor B(i) xor c;
                c := (A(i) and B(i)) or ((A(i) xor B(i)) and c);
            end loop;
            cout      <= c;
            resultado <= soma;
        end if;
    end process;
end somador_16bits_arch;
