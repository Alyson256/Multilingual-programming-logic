
cod1, num1, valor1 = input().split()
cod2, num2, valor2 = input().split()


total_a_pagar = (int(num1) * float(valor1)) + (int(num2) * float(valor2))


print(f"VALOR A PAGAR: R$ {total_a_pagar:.2f}")