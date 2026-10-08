# Guia introdutório de tratamento de erros e exceções em Python

Este guia apresenta formas de reconhecer, prevenir e tratar erros em Python. Os exemplos são voltados a quem está começando e podem ser executados separadamente.

## 1. O que são erros e exceções?

Um erro indica que algo impediu o programa de funcionar como esperado. Alguns erros são detectados antes da execução, como um erro de sintaxe. Outros acontecem enquanto o programa está rodando; em Python, muitos desses problemas são representados por **exceções**.

Por exemplo, dividir um número por zero gera `ZeroDivisionError`:

```python
resultado = 10 / 0
```

Sem tratamento, a exceção interrompe o programa e Python mostra uma mensagem com o tipo do problema e o local em que ele ocorreu. Essa mensagem é chamada de *traceback* e ajuda a encontrar a causa.

## 2. Exceções comuns

| Exceção | Situação comum |
| --- | --- |
| `ValueError` | Um valor tem formato inadequado, como `int("abc")`. |
| `TypeError` | Uma operação é usada com um tipo incompatível, como `"idade: " + 20`. |
| `ZeroDivisionError` | Uma divisão é feita por zero. |
| `IndexError` | Um índice de lista não existe, como `itens[5]` em uma lista pequena. |
| `KeyError` | Uma chave não existe em um dicionário. |
| `FileNotFoundError` | O programa tenta abrir um arquivo que não foi encontrado. |

Entender o tipo da exceção ajuda a decidir se é possível recuperar do problema e como orientar a pessoa usando o programa.

## 3. Tratar uma exceção com `try` e `except`

Coloque no bloco `try` o código que pode falhar e em `except` a resposta para uma exceção esperada:

```python
try:
    idade = int(input("Digite sua idade: "))
except ValueError:
    print("Digite a idade usando apenas números inteiros.")
else:
    print(f"No próximo ano, você terá {idade + 1} anos.")
```

Se a conversão para inteiro falhar, Python executa o `except`. Se não houver exceção, executa o bloco `else`. Assim, o cálculo só é feito quando `idade` recebeu um valor válido.

### Trate exceções específicas

Prefira informar o tipo que você espera tratar:

```python
try:
    quantidade = int(input("Quantidade: "))
except ValueError:
    print("A quantidade precisa ser um número inteiro.")
```

Evite capturar qualquer exceção sem necessidade:

```python
try:
    quantidade = int(input("Quantidade: "))
except Exception:
    print("Algo deu errado.")
```

Um `except Exception` pode esconder erros inesperados e dificultar a descoberta do defeito. Use-o apenas quando houver um motivo claro para tratar diversos tipos de exceção da mesma forma.

## 4. Validar dados e tentar novamente

Se for possível pedir uma entrada novamente, um laço pode tratar o valor inválido sem encerrar o programa:

```python
while True:
    try:
        numero = int(input("Digite um número inteiro positivo: "))
        if numero <= 0:
            print("O número precisa ser maior que zero.")
            continue
        break
    except ValueError:
        print("Essa entrada não é um número inteiro. Tente novamente.")

print(f"Você digitou {numero}.")
```

`continue` inicia a próxima repetição do laço. `break` encerra o laço quando o número atende às condições. A conversão pode falhar com `ValueError`; já a regra de que o número deve ser positivo é validada explicitamente.

## 5. Verificar uma condição ou tratar a exceção?

Quando a situação pode ser verificada facilmente, uma condição costuma deixar o código mais claro:

```python
divisor = int(input("Divisor: "))

if divisor == 0:
    print("Não é possível dividir por zero.")
else:
    print(10 / divisor)
```

Para uma lista, verifique se o índice existe antes de acessá-lo:

```python
nomes = ["Lia", "Noah"]
indice = int(input("Índice do nome: "))

if 0 <= indice < len(nomes):
    print(nomes[indice])
else:
    print("Esse índice não corresponde a um nome.")
```

Use `try` e `except` quando uma operação puder falhar mesmo após as verificações, ou quando a própria operação for a forma mais simples de descobrir se deu certo. Evite usar exceções para controlar o fluxo normal do programa.

## 6. `finally` e abertura de arquivos

O bloco `finally` é executado haja ou não uma exceção. Ele pode ser útil para uma ação que precisa acontecer nos dois casos, por exemplo, liberar um recurso.

Para arquivos, prefira `with`: ele fecha o arquivo automaticamente, inclusive quando ocorre uma exceção:

```python
try:
    with open("dados.txt", encoding="utf-8") as arquivo:
        conteudo = arquivo.read()
except FileNotFoundError:
    print("O arquivo dados.txt não foi encontrado.")
else:
    print(conteudo)
```

Use `finally` apenas quando precisar executar uma ação comum ao sucesso e à falha que não seja cuidada automaticamente por uma estrutura como `with`.

## 7. Gerar uma exceção com `raise`

Às vezes, uma função recebe um valor que viola uma regra e deve avisar quem a chamou. Use `raise` com uma exceção apropriada:

```python
def calcular_media(total, quantidade):
    if quantidade <= 0:
        raise ValueError("A quantidade precisa ser maior que zero.")
    return total / quantidade

try:
    media = calcular_media(30, 3)
except ValueError as erro:
    print(f"Não foi possível calcular a média: {erro}")
else:
    print(f"Média: {media}")
```

O `raise` interrompe a execução da função e comunica o problema ao código que a chamou. A exceção deve descrever uma condição realmente inválida; não a use apenas para substituir uma mensagem comum ou uma decisão normal do programa.

## 8. Boas práticas para iniciantes

- Leia o tipo da exceção e a última linha do *traceback*; ela costuma indicar o que falhou.
- Trate somente situações que você sabe como resolver ou explicar.
- Dê mensagens claras e úteis, sem esconder a causa do problema.
- Mantenha o bloco `try` pequeno, limitado às operações que podem falhar.
- Valide regras de negócio explicitamente, mesmo quando a entrada tem o tipo correto.
- Não use `except: pass`: isso ignora o problema e pode deixar o programa em um estado incorreto.
- Não envolva todo o programa em um `try` genérico; isso pode mascarar defeitos de programação.
- Durante o aprendizado, deixe exceções inesperadas aparecerem para que você possa investigar o *traceback*.

## 9. Exercícios para praticar

1. Peça dois números inteiros e trate uma entrada inválida com `ValueError`.
2. Leia um número e informe se ele pode ser dividido por 2 sem resto. Trate entradas que não sejam inteiros.
3. Peça um índice para acessar uma lista de nomes e mostre uma mensagem se o índice não existir.
4. Crie uma função que receba uma temperatura em Celsius e gere `ValueError` se receber um valor abaixo do zero absoluto (`-273.15`).
5. Tente abrir um arquivo chamado `anotacoes.txt` e trate o caso em que ele não existe.

Ao praticar, teste tanto entradas válidas quanto inválidas. O objetivo não é esconder todos os erros: é tratar os casos esperados com clareza e deixar os defeitos inesperados fáceis de investigar.
