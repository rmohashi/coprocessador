# Coprocessador

## Descrição

Coprocessador das funções seno e cosseno desenvolvido na linguagem VHDL.

## Setup

### Clonando o projeto

Clone esse repositório com o comando:

```bash
git clone --recursive https://github.com/rmohashi/coprocessador.git
```

### Configuração do projeto

No software Vivado:

* Crie um novo projeto na localização da pasta clonada
* Adicione os arquivos necessários - coprocessador, uf, bus, testbench
  (no caso do testbench, o mesmo deve ser adicionado como **Simulation-Only Source**)
* Adicione os arquivos `fixed_pkg_c.vhdl` e `math_utility_pkg.vhdl` disponível na pasta do submódulo `vhdl2008c`, na biblioteca `ieee_proposed`

## Execução

No software Vivado:

* Defina o testbench como módulo principal de simulação:
  * Vá em ***Tools > Settings > Simulation***, selecione o testbench na opção `Simulation top module name` e clique em **Ok**
* Clique em ***Simulation > Run Behavioral Simulation***

## Autores

* Bruno Eidi Nishimoto - [brunonishimoto](https://github.com/brunonishimoto)
* Bruno Yukio Fujita Saito - [BrunoSaito](https://github.com/BrunoSaito)
* Matheus Felix Dias Lima da Silva - [matheusssf](https://github.com/matheusssf)
* Rodrigo Masaru Ohashi - [rmohashi](https://github.com/rmohashi)
