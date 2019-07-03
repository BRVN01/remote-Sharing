# remote-Sharing
Gosto de chamar esse script de "Mini Ansible", isso porque, sua função é transferir um único dado
para várias máquinas, só precisando ter a linguagem ***expect*** e o software ***xterm*** instalado.

### env.sh
É o script feito em Expect, ele simula uma pessoa digitando informações no terminal.

### transf.sh
É o script feito em Shell, nele são colocados os IP's e foi feito a tratativa de erro, com um ***for*** conseguimos transferir arquivos para várias máquinas usando ***scp***.
