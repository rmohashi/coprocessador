library ieee;
use ieee.std_logic_1164.all;
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

entity coprocessador is
  port(
    x:      in  std_logic_vector(15 downto 0);
    s_c:    in  std_logic;
    start:  in  std_logic;
    clock:  in  std_logic;
    reset:  in  std_logic;
    r:      out std_logic_vector(15 downto 0);
    done:   out std_logic
  );
end coprocessador;

architecture comportamental of coprocessador is
  signal s_r:    std_logic_vector(15 downto 0);
  signal s_done: std_logic;
begin

  process(start, clock, reset)
    variable v1, v2, v4, v6, v7, v9: sfixed(3 downto -12);
    variable v10, v11, v13, v14, v15, v16, v18: sfixed(3 downto -12);
    variable v20, v21, v22, v24, v25, v26: sfixed(3 downto -12);
    variable v3, v5, v8, v12, v17, v19, v23: sfixed(12 downto 0);
  begin
    -- S0 
    v1 := sfixed(x);      
    if reset = '1' then
      s_done <= '0';
    elsif rising_edge(clock) and start = '1' then 
      -- S1
      s_done <= '0';
      v2 := resize(v1 * v1, v2);
      v3 := "0000000000010"; -- 2
      if s_c = '1' then 
        -- Seno
        -- S2
        v4 := resize(v2 * v1, v4);
        v5 := "0000000000110"; -- 6
        -- S3
        v6 := resize(v4 / v5, v6);
        v7 := resize(v4 * v2, v7);
        v8 := "0000001111000"; -- 120
        -- S4
        v9 := resize(v1 - v6, v9);
        v10 := resize(v7 / v8, v10);
        v11 := resize(v7 * v2, v11);
        v12 := "1001110110000"; -- 5040
        -- S5
        v13 := resize(v9 + v10, v13);
        v14 := resize(v11 / v12, v14);
        -- S6
        v15 := resize(v13 - v14, v15);
        -- S7
        s_r <= std_logic_vector(v15);
        s_done <= '1';
      else 
        -- Cosseno
        -- S8
        v16 := resize(v2 / v3, v16);
        v17 := "0000000000001"; -- 1
        v18 := resize(v2 * v2, v18);
        v19 := "0000000011000"; -- 24
        -- S9
        v20 := resize(v17 - v16, v20);
        v21 := resize(v18 / v19, v21);
        v22 := resize(v18 * v2, v22);
        v23 := "0001011010000"; -- 720
        -- S10
        v24 := resize(v20 + v21, v24);
        v25 := resize(v22 / v23, v25);
        -- S11
        v26 := resize(v24 - v25, v26);
        -- S12
        s_r <= std_logic_vector(v26);
        s_done <= '1';
      end if;
    end if;
  end process;

  r <= s_r;
  done <= s_done;
  
end comportamental;
