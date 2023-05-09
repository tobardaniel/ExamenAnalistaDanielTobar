'''
Este programa espera 2 entradas únicamente. 
Entrada 1: Cota inferior 
Entrada 2: Cota superior
Un ejemplo de un archivo al que se puede redirigir el programa es 'Problema1_texto_input.txt'
'''

from math import floor

#Función para determinar si un número es primo.
def IsPrimo(n : int):
    '''
    args:
    n (int): Número que se analizará si es primo. 
    Esta función analiza si un número es primo determinando si algún número menor a él lo divide.
    El programa sólo analiza desde 2 hasta la raíz de n, pues si un número es compuesto, tiene un factor menor o igual a su raíz.
    '''
    max = floor(n**0.5)+1
    esprimo = True
    for x in range(2,max):
        if n % x == 0:
            esprimo = False
            break
    return esprimo

#Función para sumar los primos en algún rango
def suma_primos_en_rango(a,b):
    '''
    args:
    a (int): Cota inferior del rango
    b (int): Cota superior del rango
    Esta función determina si los valores en el rango [a,b] son primos, y los suma al total en caso de ser así.
    '''
    suma = 0
    for x in range(a, b + 1):
        if IsPrimo(x):
            suma += x
    return suma

#Módulo para inicializar el programa.
if __name__ == '__main__':
    a = int(input())
    b = int(input())
    print(suma_primos_en_rango(a,b))

