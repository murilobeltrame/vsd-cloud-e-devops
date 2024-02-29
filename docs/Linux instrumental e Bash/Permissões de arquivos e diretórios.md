# Permissões de arquivos e diretórios

## Conceitos

* Um **Usuário** sempre faz parte de um **Grupo de Usuários**;
* As permissões são organizadas em
    1. Permissões do usuário dono do arquivo;
    2. Permissões de usuários do mesmo grupo do dono do arquivo;
    3. Permissões de todos os usuários;
* As permissões possíveis são
    * `x`, 1, **execução**;
    * `w`, 2, **escrita**;
    * `r`, 4, **leitura**;

Logo:

| **Usuário** | **Grupo** | **Todos** |
| --- | --- | --- |
| [0-7] | [0-7] | [0-7] |

| **Octal** | **Binário** | **Caracteres** | **Significado** |
| --- | --- | --- | --- |
| 0 | 000 | \-\-\- | Nenhuma permissão |
| 1 | 001 | --x | Permissão de execução |
| 2 | 010 | -w- | Permissão de escrita |
| 3 | 011 | -wx | Permissão de execução e escrita |
| 4 | 100 | r-- | Permissão de leitura |
| 5 | 101 | r-x | Permissão de execução e leitura |
| 6 | 110 | rw- | Permissão de escrita e leitura |
| 7 | 111 | rwx | Permissão de execução, escrita e leitura |

## Comandos

* `whoami`, usuário atual;
* `groups`, grupos do usuário;
* `chmod`, altera permissões de arquivos e diretórios;