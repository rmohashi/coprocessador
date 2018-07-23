library ieee;
use ieee.std_logic_1164.all;

entity coprocessador_uc is
  port(
    -- Entradas
    start:    in  std_logic;
    s_c:      in  std_logic;
    reset:    in  std_logic;
    clk:      in  std_logic;
    -- Saídas
    enReg:    out std_logic_vector(1 to 5);
    enTS:     out std_logic_vector(1 to 16);
    selMux:   out std_logic_vector(1 to 10);
    selUF:    out std_logic;
    done:     out std_logic
  );
end coprocessador_uc;

architecture arch of coprocessador_uc is
  type tipo_estado is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12);
  signal estado:  tipo_estado;

begin
  
  -- Bloco de decisão do próximo estado
  process(clk, start, s_c, reset)
  begin
    if reset = '1' then 
      estado <= s0;
    elsif rising_edge(clk) then
      case estado is
        when s0 => 
          if start = '1' then
            estado <= s1;
          else 
            estado <= s0;
          end if;
        when s1 =>
          if s_c = '1' then 
            estado <= s2;
          else 
            estado <= s8;
          end if;
        -- Seno
        when s2 =>
          estado <= s3;
        when s3 =>
          estado <= s4;
        when s4 =>
          estado <= s5;
        when s5 =>
          estado <= s6;
        when s6 =>
          estado <= s7;
        when s7 =>
          estado <= s0;
        -- Cosseno
        when s8 =>
          estado <= s9;
        when s9 =>
          estado <= s10;
        when s10 =>
          estado <= s11;
        when s11 =>
          estado <= s12;
        when s12 =>
          estado <= s0;
      end case;
    end if;
  end process;

  -- Bloco de lógica de saída
  process(estado)
  begin
    case estado is
      when s0 =>
        enReg  <= "10000";   
        enTS   <= "10000" & "00000" & "000000";   
        selMux <= "00" & "0" & "00" & "00" & "0" & "00";  
        selUF  <= '0';
        done   <= '0';
      when s1 =>
        enReg  <= "01010";   
        enTS   <= "00010" & "00001" & "000000";   
        selMux <= "00" & "0" & "00" & "00" & "0" & "00";  
        selUF  <= '0';
        done   <= '0';
      when s2 =>
        enReg  <= "00110";   
        enTS   <= "00010" & "00000" & "100000";   
        selMux <= "00" & "1" & "00" & "00" & "0" & "00";  
        selUF  <= '0';
        done   <= '0';
      when s3 =>
        enReg  <= "00111";   
        enTS   <= "00010" & "01000" & "010000";   
        selMux <= "10" & "1" & "01" & "01" & "0" & "00";  
        selUF  <= '0';
        done   <= '0';
      when s4 =>
        enReg  <= "11100";   
        enTS   <= "00001" & "00000" & "100011";   
        selMux <= "11" & "1" & "10" & "10" & "0" & "10";  
        selUF  <= '0';
        done   <= '0';
      when s5 =>
        enReg  <= "11000";   
        enTS   <= "00000" & "00000" & "000011";   
        selMux <= "00" & "0" & "01" & "01" & "0" & "01";  
        selUF  <= '1';
        done   <= '0';
      when s6 =>
        enReg  <= "10000";   
        enTS   <= "00000" & "00000" & "000001";   
        selMux <= "00" & "0" & "00" & "00" & "0" & "01";  
        selUF  <= '0';
        done   <= '0';
      when s7 =>
        enReg  <= "00000";   
        enTS   <= "00000" & "00010" & "000000";   
        selMux <= "00" & "0" & "00" & "00" & "0" & "00";  
        selUF  <= '0';
        done   <= '1';
      when s8 =>
        enReg  <= "10111";   
        enTS   <= "00100" & "00100" & "011000";   
        selMux <= "01" & "1" & "01" & "00" & "0" & "00";  
        selUF  <= '0';
        done   <= '0';
      when s9 =>
        enReg  <= "11110";   
        enTS   <= "00000" & "10000" & "100011";   
        selMux <= "11" & "1" & "10" & "10" & "1" & "00";  
        selUF  <= '0';
        done   <= '0';
      when s10 =>
        enReg  <= "11000";   
        enTS   <= "00000" & "00000" & "000011";   
        selMux <= "00" & "0" & "01" & "01" & "0" & "01";  
        selUF  <= '1';
        done   <= '0';
      when s11 =>
        enReg  <= "10000";   
        enTS   <= "00000" & "00000" & "000001";   
        selMux <= "00" & "0" & "00" & "00" & "0" & "01";  
        selUF  <= '0';
        done   <= '0';
      when s12 =>
        enReg  <= "00000";   
        enTS   <= "00000" & "00010" & "000000";   
        selMux <= "00" & "0" & "00" & "00" & "0" & "00";  
        selUF  <= '0';
        done   <= '1';
    end case;
  end process;
end arch;
