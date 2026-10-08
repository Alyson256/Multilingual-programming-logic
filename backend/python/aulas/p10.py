cad1 = 0
cad2 = 0
nulo = 0
voto = 0

for i in range(1,6):
    try:
        voto = int(input("hora de votar\nescolha entre (1/2): "))
    except ValueError:
        print("Erro: Digite apenas números inteiros.")

    if voto == 1:
        cad1 += 1
    elif voto == 2:
        cad2 += 1
    else:
        nulo += 1


print("====RESULTADOS DA ELEIÇÃO====")
print(f"candidato 1: {cad1} voto(s)")
print(f"candidato 1: {cad2} voto(s)")
print(f"Votos nulos: {nulo} voto(s)")