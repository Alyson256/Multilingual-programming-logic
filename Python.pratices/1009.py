nome = input()
salario = float(input())
vendas = float(input())

total_a_receber = salario + (vendas * 0.15)

print(f"TOTAL = R$ {total_a_receber:.2f}")