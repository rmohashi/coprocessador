library ieee;
use ieee.std_logic_1164.all;

entity estrutural_tb is
end estrutural_tb;

architecture arch of estrutural_tb is

  constant delta_t : time := 20 ns;

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
    wait for 10 ns;
    s_clk <= '0';
    wait for 10 ns;
  end process;

  process
  begin
    -- Teste: Cosseno
    s_reset <= '0';
    s_sc <= '0';
    -- Test: cos(0)
    s_x <= (others => '0');
    -- s_x <= "0000100001100000";
    s_start <= '0';
    wait for delta_t;
    s_start <= '1';
    wait until s_done = '1';
    -- Test: cos(pi/6)
    s_x <= "0000100001100000";
    s_start <= '0';
    wait for delta_t * 2;
    s_start <= '1';
    wait until s_done = '1';
    -- Test: cos(pi/4)
    s_x <= "0000110010010000";
    s_start <= '0';
    wait for delta_t * 2;
    s_start <= '1';
    wait until s_done <= '1';
    wait for delta_t;
    -- Test: cos(pi/3)
    s_x <= "0001000011000001";
    s_start <= '0';
    wait for delta_t * 2;
    s_start <= '1';
    wait until s_done <= '1';
    wait for delta_t;
    -- Test: cos(pi/2)
    s_x <= "0001100100100001";
    s_start <= '0';
    wait for delta_t * 2;
    s_start <= '1';
    wait until s_done <= '1';
    wait for delta_t;
    -- Verificando que o Reset é assíncrono
    s_x <= "0001000011000001";
    s_start <= '0';
    wait for delta_t * 2;
    s_start <= '1';
    wait for delta_t * 5 / 4;
    s_reset <= '1';
    wait for delta_t;
    s_reset <= '0';
    -- Teste: Seno
    s_sc <= '1';
    -- Test: sen(0)
    s_x <= (others => '0');
    s_start <= '0';
    wait for delta_t * 2;
    s_start <= '1';
    wait until s_done <= '1';
    wait for delta_t;
    -- Test: sen(pi/6)
    s_x <= "0000100001100000";
    s_start <= '0';
    wait for delta_t * 2;
    s_start <= '1';
    wait until s_done = '1';
    -- Test: sen(pi/4)
    s_x <= "0000110010010000";
    s_start <= '0';
    wait for delta_t * 2;
    s_start <= '1';
    wait until s_done <= '1';
    wait for delta_t;
    -- Test: sen(pi/3)
    s_x <= "0001000011000001";
    s_start <= '0';
    wait for delta_t * 2;
    s_start <= '1';
    wait until s_done <= '1';
    wait for delta_t;
    -- Test: sen(pi/2)
    s_x <= "0001100100100001";
    s_start <= '0';
    wait for delta_t * 2;
    s_start <= '1';
    wait until s_done <= '1';
    wait for delta_t;
    report "Simulation Finished" severity FAILURE;
  end process;
end arch;
