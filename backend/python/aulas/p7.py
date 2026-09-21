while True: 
    num = int(input("Digite um número entre 1 e 10: "))
    if 1 <= num <= 10:
        print(f"{num} é um número válido\nobrigado pela colaboração")
        break
    else: 
        print(f"{num} é um número inválido, digite um número entre 1 e 10")
