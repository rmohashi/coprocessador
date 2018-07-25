library ieee;
use ieee.std_logic_1164.all;

entity somador_subtrator_16bits is
  port (
    A           : in  std_logic_vector(15 downto 0);
    B           : in  std_logic_vector(15 downto 0);
    sel         : in  std_logic;                        -- 0 = soma; 1 = sub
    resultado   : out std_logic_vector(15 downto 0) := (others => 'Z')
  );
end somador_subtrator_16bits;

architecture somador_subtrator_16bits_behavioral of somador_subtrator_16bits is
  component inversor is
    port (
      entrada     : in  std_logic_vector(15 downto 0);
      saida       : out std_logic_vector(15 downto 0)
    );
  end component;

  component mux is
    port (
      soma        : in  std_logic_vector(15 downto 0);
      subtracao   : in  std_logic_vector(15 downto 0);
      sel         : in  std_logic;
      saida       : out std_logic_vector(15 downto 0)
    );
  end component;

  component somador_16bits is
    port (
      cin         : in std_logic;
      A , B       : in std_logic_vector(15 downto 0);
      cout        : out std_logic;
      resultado   : out std_logic_vector(15 downto 0)
    );
  end component;

  signal s1, s2 : std_logic_vector(15 downto 0) := (others => 'Z');

begin

  inver        : inversor         port map (B, s1);
  multiplexador: mux              port map (B, s1, sel, s2);
  somador      : somador_16bits   port map (sel, A, s2, open, resultado);

end somador_subtrator_16bits_behavioral;