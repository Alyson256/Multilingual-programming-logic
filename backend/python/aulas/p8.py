notas = 0
media = 0
total = 0

for i in range(1,5):
    notas = float(input("digite suas notas: "))
    if notas < 0:
        print("digite um valor positivo!")
    else: 
        total += notas


media = total / 4

if media >= 7:
    print("aprovado!")
else:
    print("boa! você foi reprovado!")