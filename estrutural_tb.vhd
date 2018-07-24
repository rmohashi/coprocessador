library ieee;
use ieee.std_logic_1164.all;

entity estrutural_tb is
end estrutural_tb;

architecture arch of estrutural_tb is

  constant delta_t : time := 10 ns;

  component coprocessador_est is
  port(
    x:      in  std_logic_vector(15 downto 0);
    s_c:    in  std_logic;
    start:  in  std_logic;
    clock:  in  std_logic;
    reset:  in  std_logic;
    r:      out std_logic_vector(15 downto 0);
    done:   out std_logic;
    -- Sinais de depuração
    d_enReg:    out std_logic_vector(1 to 5);
    d_enTS:     out std_logic_vector(1 to 16);
    d_selMux:   out std_logic_vector(1 to 10);
    d_selUF:    out std_logic
  );
  end component;

  signal s_x:      std_logic_vector(15 downto 0);
  signal s_sc:     std_logic;
  signal s_start:  std_logic;
  signal s_clk:    std_logic;
  signal s_reset:  std_logic;
  signal s_r:      std_logic_vector(15 downto 0);
  signal s_done:   std_logic;

  signal s_d_enReg:     std_logic_vector(1 to 5);
  signal s_d_enTS:      std_logic_vector(1 to 16);
  signal s_d_selMux:    std_logic_vector(1 to 10);
  signal s_d_selUF:     std_logic;
  
begin

  cop: coprocessador_est port map(s_x, s_sc, s_start, s_clk, s_reset, s_r, s_done, s_d_enReg, s_d_enTS, s_d_selMux, s_d_selUF);
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
    wait until s_done = '1';
    wait for delta_t * 2;
    report "Simulation Finished" severity FAILURE;
  end process;
end arch;
