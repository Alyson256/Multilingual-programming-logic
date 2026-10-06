# Guia de listas, vetores e matrizes em Python

Este guia reúne operações comuns para guardar e manipular dados em Python. Os exemplos usam listas, que são a estrutura mais usada para representar vetores e matrizes simples.

## 1. Listas e vetores

Uma lista guarda vários valores em uma ordem. Em muitos exercícios, uma lista de uma dimensão é chamada de **vetor**.

```python
notas = [8.5, 7.0, 9.2]
nomes = ["Ana", "Beto", "Caio"]

print(notas)
print(nomes)
```

Os índices começam em `0`:

```python
print(nomes[0])   # Ana: primeiro item
print(nomes[-1])  # Caio: último item
```

Para alterar um item, use seu índice:

```python
notas[1] = 7.5
print(notas)  # [8.5, 7.5, 9.2]
```

Acessar um índice que não existe causa `IndexError`. Uma lista com três itens tem índices `0`, `1` e `2`.

## 2. Adicionar itens

### `append(valor)`

Adiciona **um item ao final** da lista. O item pode ser de qualquer tipo, inclusive outra lista.

```python
frutas = ["maçã", "pera"]
frutas.append("uva")
print(frutas)  # ['maçã', 'pera', 'uva']
```

### `extend(iteravel)`

Adiciona cada item de outra sequência ao final da lista.

```python
numeros = [1, 2]
numeros.extend([3, 4])
print(numeros)  # [1, 2, 3, 4]
```

Diferença importante: `append([3, 4])` colocaria a lista inteira como um único item, enquanto `extend([3, 4])` colocaria `3` e `4` separadamente.

### `insert(indice, valor)` ...

Insere um item em uma posição. Os itens seguintes mudam de índice.

```python
cores = ["azul", "verde"]
cores.insert(1, "vermelho")
print(cores)  # ['azul', 'vermelho', 'verde']
```

## 3. Remover itens

### `pop([indice])`

Remove e **devolve** um item. Sem índice, remove o último. Com índice, remove daquela posição.

```python
fila = ["Lia", "Noah", "Bia"]
ultimo = fila.pop()
primeiro = fila.pop(0)

print(ultimo)  # Bia
print(primeiro)  # Lia
print(fila)  # ['Noah']
```

`pop()` em uma lista vazia ou com índice inválido causa `IndexError`.

### `remove(valor)`

Remove a primeira ocorrência de um valor. Se o valor não estiver na lista, causa `ValueError`.

```python
numeros = [2, 4, 2, 6]
numeros.remove(2)
print(numeros)  # [4, 2, 6]
```

Para evitar erro quando não souber se o valor existe:

```python
if 5 in numeros:
    numeros.remove(5)
```

### `del` e `clear()`

`del` remove pelo índice ou por um intervalo. `clear()` remove todos os itens.

```python
letras = ["a", "b", "c", "d"]
del letras[1]      # remove 'b'
del letras[1:3]    # remove do índice 1 até antes do 3
print(letras)      # ['a']

letras.clear()
print(letras)      # []
```

## 4. Consultar e percorrer listas

### Tamanho e pertencimento

```python
valores = [10, 20, 30]
print(len(valores))       # 3
print(20 in valores)      # True
print(99 not in valores)  # True
```

### Percorrer valores

Use `for` quando precisar de cada valor:

```python
for valor in valores:
    print(valor)
```

Use `range(len(lista))` quando precisar também do índice ou quiser alterar itens por posição:

```python
for indice in range(len(valores)):
    print(indice, valores[indice])
```

Outra opção é `enumerate()`, que fornece índice e valor:

```python
for indice, valor in enumerate(valores):
    print(indice, valor)
```

### Fatiamento (slicing)

`lista[inicio:fim]` cria uma nova lista do índice `inicio` até antes de `fim`.

```python
letras = ["a", "b", "c", "d", "e"]
print(letras[1:4])  # ['b', 'c', 'd']
print(letras[:3])   # ['a', 'b', 'c']
print(letras[2:])   # ['c', 'd', 'e']
```

## 5. Cálculos e ordenação

Para listas numéricas:

```python
valores = [4, 1, 9, 2]
print(sum(valores))  # soma: 16
print(min(valores))  # menor: 1
print(max(valores))  # maior: 9
```

`sort()` ordena a própria lista; `sorted()` devolve uma nova lista ordenada.

```python
valores.sort()
print(valores)  # [1, 2, 4, 9]

outros = [4, 1, 9, 2]
ordenados = sorted(outros)
print(ordenados)  # [1, 2, 4, 9]
print(outros)     # [4, 1, 9, 2]
```

Para ordenar do maior para o menor, use `reverse=True`:

```python
valores.sort(reverse=True)
```

## 6. Matrizes

Uma matriz pode ser representada por uma **lista de listas**. Cada lista interna representa uma linha.

```python
matriz = [
    [1, 2, 3],
    [4, 5, 6],
]
```

Acesse um valor usando `[linha][coluna]`. Os dois índices começam em `0`:

```python
print(matriz[0][0])  # 1: primeira linha, primeira coluna
print(matriz[1][2])  # 6: segunda linha, terceira coluna
```

### Criar uma matriz preenchida pelo usuário

```python
quantidade_linhas = int(input("Quantidade de linhas: "))
quantidade_colunas = int(input("Quantidade de colunas: "))

matriz = []

for indice_linha in range(quantidade_linhas):
    linha = []
    for indice_coluna in range(quantidade_colunas):
        valor = int(input(f"Valor [{indice_linha}][{indice_coluna}]: "))
        linha.append(valor)
    matriz.append(linha)

print(matriz)
```

Repare que `linha` é criada novamente a cada volta do laço externo. Assim, cada linha da matriz é uma lista independente.

### Evite compartilhar a mesma linha

Este padrão parece criar linhas separadas, mas todas apontam para a **mesma lista**:

```python
matriz = [[0] * 3] * 2
matriz[0][0] = 9
print(matriz)  # [[9, 0, 0], [9, 0, 0]]
```

Para criar linhas independentes, use uma compreensão de lista:

```python
matriz = [[0 for coluna in range(3)] for linha in range(2)]
matriz[0][0] = 9
print(matriz)  # [[9, 0, 0], [0, 0, 0]]
```

### Percorrer todos os elementos

```python
for linha in matriz:
    for valor in linha:
        print(valor)
```

Para percorrer com índices:

```python
for indice_linha in range(len(matriz)):
    for indice_coluna in range(len(matriz[indice_linha])):
        print(matriz[indice_linha][indice_coluna])
```

### Somar os valores de cada linha

```python
for indice_linha, linha in enumerate(matriz):
    print(f"Soma da linha {indice_linha}: {sum(linha)}")
```

Em uma matriz retangular, `len(matriz)` informa a quantidade de linhas e `len(matriz[0])` informa a quantidade de colunas, desde que exista pelo menos uma linha.

## 7. Funções e métodos: diferença rápida

Uma **função** recebe dados entre parênteses, como `len(lista)` e `sum(lista)`. Um **método** é chamado depois de um objeto, como `lista.append(valor)` e `lista.pop()`.

A maioria dos métodos que alteram uma lista, como `append()`, `extend()`, `insert()` e `sort()`, modifica a lista diretamente. Não é necessário atribuir o resultado de volta:

```python
itens = [1, 2]
resultado = itens.append(3)
print(itens)     # [1, 2, 3]
print(resultado) # None
```

## 8. Exercícios para praticar

1. Crie uma lista com cinco números e mostre a soma e a média.
2. Leia cinco nomes usando `append()` e depois mostre cada nome com seu índice.
3. Crie uma lista, remova um item pelo valor com `remove()` e outro pelo índice com `pop()`.
4. Leia números para uma matriz de duas linhas e três colunas. Mostre a soma de cada linha.
5. Percorra uma matriz e conte quantos valores são maiores que zero.

Tente resolver os exercícios antes de consultar uma solução. Se aparecer um erro, leia a mensagem e confira os índices, os tipos dos valores e se a lista está vazia.
