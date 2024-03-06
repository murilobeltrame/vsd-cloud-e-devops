#!/bin/bash

# Função para realizar a adição
addition() {
    result=$(($1 + $2))
    echo "Resultado da adição: $result"
}

# Função para realizar a subtração
subtraction() {
    result=$(($1 - $2))
    echo "Resultado da subtração: $result"
}

# Função para realizar a multiplicação
multiplication() {
    result=$(($1 * $2))
    echo "Resultado da multiplicação: $result"
}

# Função para realizar a divisão
division() {
    # Verificar se o segundo número é zero
    if [ $2 -eq 0 ]; then
        echo "Erro: Divisão por zero não é permitida!"
    else
        result=$(($1 / $2))
        echo "Resultado da divisão: $result"
    fi
}

# Menu de opções
echo "Calculadora Simples em Bash"
echo "Escolha a operação:"
echo "1. Adição"
echo "2. Subtração"
echo "3. Multiplicação"
echo "4. Divisão"
read -p "Opção: " option

# Ler os números
read -p "Digite o primeiro número: " num1
read -p "Digite o segundo número: " num2

# Selecionar a operação com base na opção escolhida
case $option in
    1) addition $num1 $num2 ;;
    2) subtraction $num1 $num2 ;;
    3) multiplication $num1 $num2 ;;
    4) division $num1 $num2 ;;
    *) echo "Opção inválida!" ;;
esac