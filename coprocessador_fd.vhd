library ieee;
use ieee.std_logic_1164.all;

entity coprocessador_fd is
  port(
    clk:      in std_logic;
    x:        in std_logic_vector(15 downto 0);
    enReg:    in std_logic_vector(1 to 5);
    enTS:     in std_logic_vector(1 to 16);
    selMux:   in std_logic_vector(1 to 10);
    selUF:    in std_logic;
    r:        out std_logic_vector(15 downto 0)
  );
end coprocessador_fd;

architecture estrutural of coprocessador_fd is
  component bus1 is
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
  end component;

  component bus2 is
  port(
    inTS1:  in  std_logic_vector(15 downto 0);
    enTS1:  in  std_logic;
    inTS2:  in  std_logic_vector(15 downto 0);
    enTS2:  in  std_logic;
    inTS13: in  std_logic_vector(15 downto 0);
    enTS13: in  std_logic;
    inTS16: in  std_logic_vector(15 downto 0);
    enTS16: in  std_logic;
    output: out std_logic_vector(15 downto 0)
  );
  end component;

  component bus3 is
  port(
    inTS3:  in  std_logic_vector(15 downto 0);
    enTS3:  in  std_logic;
    inTS11: in  std_logic_vector(15 downto 0);
    enTS11: in  std_logic;
    inTS14: in  std_logic_vector(15 downto 0);
    enTS14: in  std_logic;
    output: out std_logic_vector(15 downto 0)
  );
  end component;

  component bus4 is
  port(
    inTS2:  in  std_logic_vector(15 downto 0);
    enTS2:  in  std_logic;
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
  end component;

  component reg16 is
  port (
    CLK, CLKEN, OE_L, CLR_L: in std_logic;
    D: in std_logic_vector(15 downto 0);
    Q: out std_logic_vector(15 downto 0)
  );
  end component;

  component mux4to1 is
  port (
    a           : in  std_logic_vector(15 downto 0);
    b           : in  std_logic_vector(15 downto 0);
    c           : in  std_logic_vector(15 downto 0);
    d           : in  std_logic_vector(15 downto 0);
    sel         : in  std_logic_vector(0 to 1);
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

  component multiplicador_16bits is
  port (
    A , B       : in  std_logic_vector(15 downto 0);
    resultado   : out std_logic_vector(15 downto 0)
  );
  end component;

  component divisor_16bits is
  port (
    clk         : in  std_logic;
    A , B       : in  std_logic_vector(15 downto 0);
    resultado   : out std_logic_vector(15 downto 0)
  );
  end component;

  component somador_subtrator is
  port (
    A           : in  std_logic_vector(15 downto 0);
    B           : in  std_logic_vector(15 downto 0);
    sel         : in  std_logic;                        -- 0 = soma; 1 = sub
    resultado   : out std_logic_vector(15 downto 0)
  );
  end component;

  component tri_state is
  port (
    entrada     : in  std_logic_vector(15 downto 0);
    enable      : in  std_logic;
    saida       : out std_logic_vector(15 downto 0)
  );
  end component;

  signal s_bus1, s_bus2, s_bus3, s_bus4 : std_logic_vector(15 downto 0);
  signal s_reg1, s_reg2, s_reg3, s_reg4, s_reg5: std_logic_vector(15 downto 0);
  signal s_m1, s_m2, s_m3, s_m4, s_m5, s_m6 : std_logic_vector(15 downto 0);
  signal s_mul, s_div, s_sum_sub : std_logic_vector(15 downto 0);

  constant k_1    : std_logic_vector := "0001000000000000"; -- Em ponto fixo
  constant k_2    : std_logic_vector := "0000000000000010";
  constant k_6    : std_logic_vector := "0000000000000110";
  constant k_24   : std_logic_vector := "0000000000011000";
  constant k_120  : std_logic_vector := "0000000001111000";
  constant k_720  : std_logic_vector := "0000001011010000";
  constant k_5040 : std_logic_vector := "0001001110110000";

begin

  b1: bus1 port map(k_120, enTS(7), k_24, enTS(8), s_mul, enTS(10), s_div, enTS(15), s_bus1);
  b2: bus2 port map(x, enTS(1), k_2, enTS(2), s_div, enTS(13), s_sum_sub, enTS(16), s_bus2);
  b3: bus3 port map(k_1, enTS(3), s_mul, enTS(11), s_div, enTS(14), s_bus3);
  b4: bus4 port map(k_2, enTS(2), k_6, enTS(4), k_5040, enTS(5), k_720, enTS(6), s_mul, enTS(12), s_bus4);

  r1: reg16 port map(clk, enReg(1), '0', '1', s_bus2, s_reg1);
  r2: reg16 port map(clk, enReg(2), '0', '1', s_bus1, s_reg2);
  r3: reg16 port map(clk, enReg(3), '0', '1', s_bus3, s_reg3);
  r4: reg16 port map(clk, enReg(4), '0', '1', s_bus4, s_reg4);
  r5: reg16 port map(clk, enReg(5), '0', '1', s_bus1, s_reg5);

  m1: mux4to1 port map(s_reg1, s_reg2, s_reg3, s_reg4, selMux(1 to 2), s_m1);
  m2: mux     port map(s_reg1, s_reg2, selMux(3), s_m2);
  m3: mux4to1 port map(s_reg2, s_reg3, s_reg4, (others => '0'), selMux(4 to 5), s_m3);
  m4: mux4to1 port map(s_reg1, s_reg4, s_reg5, (others => '0'), selMux(6 to 7), s_m4);
  m5: mux     port map(s_reg1, s_reg3, selMux(8), s_m5);
  m6: mux4to1 port map(s_reg1, s_reg2, s_reg3, (others => '0'), selMux(9 to 10), s_m6);

  mul: multiplicador_16bits port map(s_m1, s_m2, s_mul);
  div: divisor_16bits port map(clk, s_m3, s_m4, s_div);
  sum_sub: somador_subtrator port map(s_m5, s_m6, selUF, s_sum_sub);

  result: tri_state port map(s_reg1, enTS(9), r);
end estrutural;
