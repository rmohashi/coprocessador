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
begin

  process(start)
    variable v1, v2, v4, v6, v8, v9: sfixed(3 downto -12);
    variable v10, v12, v13, v14, v16, v17, v18: sfixed(3 downto -12);
    variable v20, v21, v22, v24, v25, v26: sfixed(3 downto -12);
    variable v3, v5, v7, v11, v15, v19, v23: sfixed(12 downto 0);
  begin
    -- S0
    v1 := sfixed(x);
    if start = '1' then
      -- S1
      v2 := v1 * v1;
      v3 := "0000000000010";
      -- S2
      v4 := v2 / v3;
      v5 := "0000000000001";
      v6 := v2 * v1;
      v7 := "0000000000110";
      -- S3
      v8 := v5 - v4;
      v9 := v6 / v7;
      v10 := v2 * v2;
      v11 := "0000000011000";
      -- S4
      v12 := v1 - v9;
      v13 := v10 / v11;
      v14 := v2 * v6;
      v15 := "0000001111000";
      -- S5
      v16 := v8 + v13;
      v17 := v14 / v15;
      v18 := v6 * v6;
      v19 := "0001011010000";
      -- S6
      v20 := v12 + v17;
      v21 := v18 / v19;
      v22 := v6 * v4;
      v23 := "1001110110000";
      -- S7
      v24 := v16 - v21;
      v25 := v22 / v23;
      if s_c = '1' then
        -- S8
        r <= std_logic_vector(v24);
        done <= '1';
      else
        -- S9
        v26 := v20 - v25;
        -- s10
        r <= std_logic_vector(v26);
        done <= '1';
      end if;
    end if;
  end process;

end comportamental;
