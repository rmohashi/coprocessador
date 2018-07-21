library ieee;
use ieee.std_logic_1164.all;

entity comportamental_tb is
--  Port ( );
end comportamental_tb;

architecture Behavioral of comportamental_tb is

  constant delta_t : time := 10 ns;

  component coprocessador is
  port(
    x:      in  std_logic_vector(15 downto 0);
    s_c:    in  std_logic;
    start:  in  std_logic;
    clock:  in  std_logic;
    reset:  in  std_logic;
    r:      out std_logic_vector(15 downto 0);
    done:   out std_logic
  );
  end component;

  signal s_x:      std_logic_vector(15 downto 0);
  signal s_sc:     std_logic;
  signal s_start:  std_logic;
  signal s_clk:    std_logic;
  signal s_reset:  std_logic;
  signal s_r:      std_logic_vector(15 downto 0);
  signal s_done:   std_logic;
  
begin

  cop: coprocessador port map(s_x, s_sc, s_start, s_clk, s_reset, s_r, s_done);

   -- Generate clock with 10 ns period
  process
  begin
    s_clk <= '1';
    wait for 5 ns; 
    s_clk <= '0';
    wait for 5 ns;
  end process;

  process 
  begin
    -- Teste: Cosseno
    s_reset <= '0';
    s_sc <= '0';
    -- Test: cos(0)
    s_x <= (others => '0');
    s_start <= '0';
    wait for delta_t;
    s_start <= '1';
    wait for delta_t;
    -- Test: cos(pi/6)
    s_x <= "0000100001100000";
    wait for delta_t;
    -- Test: cos(pi/4)
    s_x <= "0000110010010000";
    wait for delta_t;
    -- Test: cos(pi/3)
    s_x <= "0001000011000001";
    wait for delta_t;
    -- Test: cos(pi/2)
    s_x <= "0001100100100001";
    -- Verificando que o Reset é assíncrono
    wait for delta_t / 4;
    s_reset <= '1';
    s_x <= (others => '0');
    wait for delta_t / 4;
    s_reset <= '0';
    -- Test: Seno
    wait until s_done = '1';
    wait for delta_t;
    s_sc <= '1';
    -- Test: sin(0)
    s_x <= (others => '0');
    wait for delta_t;
    -- Test: sin(pi/6)
    s_x <= "0000100001100000";
    wait for delta_t;
    -- Test: sin(pi/4)
    s_x <= "0000110010010000";
    wait for delta_t;
    -- Test: sin(pi/3)
    s_x <= "0001000011000001";
    wait for delta_t;
    -- Test: sin(pi/2)
    s_x <= "0001100100100001";
    wait for delta_t * 2;
    report "Simulation Finished" severity FAILURE;
  end process;


end Behavioral;
