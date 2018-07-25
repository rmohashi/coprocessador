library ieee;
use ieee.std_logic_1164.all;

entity coprocessador_est is
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
end coprocessador_est;

architecture estrutural of coprocessador_est is

  component coprocessador_uc is
  port(
    start:    in  std_logic;
    s_c:      in  std_logic;
    reset:    in  std_logic;
    clk:      in  std_logic;
    enReg:    out std_logic_vector(1 to 5);
    enTS:     out std_logic_vector(1 to 16);
    selMux:   out std_logic_vector(1 to 10);
    selUF:    out std_logic;
    done:     out std_logic
  );
  end component;

  component coprocessador_fd is
  port(
    clk:      in std_logic;
    x:        in std_logic_vector(15 downto 0);
    enReg:    in std_logic_vector(1 to 5);
    enTS:     in std_logic_vector(1 to 16);
    selMux:   in std_logic_vector(1 to 10);
    selUF:    in std_logic;
    r:        out std_logic_vector(15 downto 0)
  );
  end component;

  signal s_enReg:     std_logic_vector(1 to 5);
  signal s_enTS:      std_logic_vector(1 to 16);
  signal s_selMux:    std_logic_vector(1 to 10);
  signal s_selUF:     std_logic;

begin

  uc: coprocessador_uc port map(start, s_c, reset, clock, s_enReg, s_enTS,s_selMux, s_selUF, done);
  fd: coprocessador_fd port map(clock, x, s_enReg, s_enTS, s_selMux, s_selUF, r);

  d_enReg <= s_enReg;
  d_enTS <= s_enTS;
  d_selMux <= s_selMux;
  d_selUF <= s_selUF;

end estrutural;
