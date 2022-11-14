// 3
#include <stdio.h>
#include <assert.h>

int pedirEntero() {
    int x;
    printf("Ingrese entero: ");
    scanf("%d", &x);
    return x;
}

int suma_hasta(int N) {
    int x = 1;
    int suma = 0;
    
    while (x <= N) {
        suma += x; // sumo x a suma
        x++; // sumo 1 a x
    }
    
    return suma;
}

int main() {
    // precondicion
    int n;
    n = pedirEntero();
    
    // corroboramos que n no sea negativo
    assert  (n >= 0);
    
    // programa
    int suma = suma_hasta(n);
    
    // postcondicion
    printf("La suma de 1 hasta %d es %d", n, suma);
    
    return 0;
}




