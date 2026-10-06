a = int(input("Digite o número de linhas da matriz: "))
b = int(input("Digite o número de colunas da matriz: "))

def criar_matriz(a, b):
    matriz = []
    for i in range(a):
        linha = []
        for j in range(b):
            elemento = int(input(f"Digite o elemento da posição [{i}][{j}]: "))
            linha.append(elemento)
        matriz.append(linha)
    return matriz

print(f"A matriz criada é: {criar_matriz(a, b)}")

def criar_matriz(a, b):
    matriz = []
    for i in range(a):
        linha = []
        for j in range(b):
            elemento = {i} + {j}
            linha.append(elemento)
        matriz.append(linha)
    print(f"a soma da posição [{i}][{j}] é: {criar_matriz(a, b)}")
    return matriz

