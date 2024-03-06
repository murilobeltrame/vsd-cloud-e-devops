# Introdução ao Bash scripting

## Conceitos

Bash é uma interface de linha de comando muito popular para Linux.<br />
Uma característica que torna o Bash tão popular e poderoso deve-se à possibilidade de ser _scriptado_.<br />
Scripts Bash são ferramentas comuns para atividades administrativas e de automação para servidores Linux.<br />
Mais sobre Bash: https://opensource.com/resources/what-bash

## Comandos

* Variáveis
```sh
FOO='BAR' # Declara a variável FOO
echo $FOO # Imprime o valor lido da variável FOO
```

* Argumentos
```sh
$ ./meu_script.sh valor1 valor2

# meu_script.sh
echo $1 # Imprime o valor do primeiro argumento, 'valor1'
echo $2 # Imprime o valor do segundo argumento, 'valor2'
```

* Inputs
```sh
# meu_script.sh
read -p "Informe um valor:" NUM1
echo "O valor é $NUM1"

# ---
$ ./meu_script.sh
Informe um valor: 765
O valor é 765
```

* Condicionais
```sh
AGE=18

if [ $AGE -lt 18 ]; then
    echo 'Não pode comprar bebida alcoólica'
fi

```

| **Condição** | **Significado** |
| --- | --- |
| [[ -z STRING ]] | Dtring é vazia |
| [[ -n STRING ]] | String **não** é vazia |
| [[ STRING == STRING ]] | Igualdade de strings |
| [[ STRING != STRING ]] | **Não** igualdade de strings |
| [[ NUM -eq NUM ]] | Igualdade de numerais |
| [[ NUM -ne NUM ]] | **Não** igualdade de números |
| [[ NUM -lt NUM ]] | Menos que |
| [[ NUM -le NUM ]] | Menos que ou igual |
| [[ NUM -gt NUM ]] | Mais que |
| [[ NUM -ge NUM ]] | Mais que ou igual |
| [[ STRING =~ STRING ]] | Expressão regular |
| [[ -e FILE ]] | Arquivo existe |
| [[ -r FILE ]] | É possível ler |
| [[ -h FILE ]] | Link simbólico |
| [[ -d FILE ]] | Se é um diretório |
| [[ -w FILE ]] | É possível escrever |
| [[ -s FILE ]] | Arquivo tem mais de 0 bytes |
| [[ -f FILE ]] | Se é um arquivo |
| [[ -x FILE ]] | Se é executável |
| [[ FILE1 -nt FILE2 ]] | Se `FILE1` é mais recente que `FILE2` |
| [[ FILE1 -ot FILE2 ]] | Se `FILE1` é mais antigo que `FILE2` |
| [[ FILE1 -ef FILE2 ]] | Se são o mesmo arquivo |
| [[ ! EXPR ]] | Negação |
| [[ X && Y ]] | E |
| [[ X \|\| Y ]] | Ou |



* Funções

```sh
get_name() {
    echo 'Murilo'
}

echo "Olá $(get_name)"
```

```sh
get_greeting() {
    if [ $1 -lt 12 ]; then
        echo 'Bom dia, ';
    elif [ $1 -lt 18 ]; then
        echo 'Boa tarde, ';
    else 
        echo 'Boa noite, ';
    fi
}

HOUR=$(date +%H)
echo "$(get_greeting $HOUR), Murilo"
```

| **Argumento** | **Descrição** |
| --- | --- |
| `$#` | Numero de argumentos |
| `$*` | Todos os argumentos |
| `$@` | Todos os argumentos separados por espaço |
| `$1` | O primeiro argumento. `$2` para o segundo e assim por diante .. |
| `$_` | O último argumento do comando anterior |

Mais em: https://devhints.io/bash

# Exercício

Script uma calculadora.<br />
* Ao invocar o script, é perguntado a operação a ser executada: Adição, Subtração, Multiplicação ou Divisão;
* Após isso deve perguntar o primeiro valor para a operação;
* Após isso deve perguntar o segundo valor para a operação;
* Deve imprimir o resultado da operação;