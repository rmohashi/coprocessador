library IEEE;
use IEEE.std_logic_1164.all;

entity reg16 is
  port (
    CLK, CLKEN, OE_L, CLR_L: in std_logic;
    D: in std_logic_vector(15 downto 0);   -- Input bus
    Q: out std_logic_vector (15 downto 0) := (others => '0') -- Output bus (three-state)
  );
end reg16;

architecture arch of reg16 is
  signal CLR, OE: STD_LOGIC;  -- active-high versions of signals
  signal IQ: STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- internal Q signals
begin

  process(CLK, CLR_L, OE_L)
  begin
    CLR <= not CLR_L; 
	  OE <= not OE_L;

    if (CLR = '1') then
		  IQ <= (others => '0');
    elsif (CLK'event and CLK='1') then
      if (CLKEN='1') then 
			  IQ <= D;
      else 
        IQ <= IQ;
		  end if;
    end if;	
  end process;

  Q <= IQ;

end arch;