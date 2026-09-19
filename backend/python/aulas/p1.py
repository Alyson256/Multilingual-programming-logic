nome = input("digite seu nome:")
idade = int(input("digite sua idade:"))

if nome.isdigit():
    print("O nome não pode conter números.")
elif idade < 0:
    print("A idade não pode ser negativa.")
else:
    print(f"Olá {nome}, você tem {idade} anos.")
