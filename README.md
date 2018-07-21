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
* Adicione os arquivos necessários 
  (no caso do testbench, o mesmo deve ser adicionado como _Simulation-Only Source_)
* Adicione a bibliteca `fixed_pkg_c.vhdl` disponível na pasta do submódulo `vhdl2008c`

### Execução do projeto

No software Vivado:

* Defina o testbench como módulo principal de simulação:
  * Vá em _Tools_ > _Settings_ > _Simulation_, selecione o testbench na opção _Simulation top module name_ e clique em Ok
* Clique em _Simulation_ > _Run Behavioral Simulation_