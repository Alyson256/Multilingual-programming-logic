def ler_inteiro(mensagem):
    while True:
        try:
            valor = int(input(mensagem))
            return valor
        except ValueError:
            print("Erro: Digite apenas números inteiros.")

a = ler_inteiro("Digite o número de linhas da matriz: ")
b = ler_inteiro("Digite o número de colunas da matriz: ")

elemento = 0

def matriz(a,b):
    matriz = []
    for i in range(a):
        linha = []
        for j in range(b):
            elemento = int(input(f"Digite o elemento da posição [{i}][{j}]: "))
            linha.append(elemento)
        matriz.append(linha)
    return matriz



def imprimir_matriz(matriz):
    for linha in matriz:
        print(linha)

linha = matriz(a,b)
imprimir_matriz(linha)