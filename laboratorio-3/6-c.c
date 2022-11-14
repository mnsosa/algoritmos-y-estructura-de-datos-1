#include <stdio.h>
#include <stdbool.h>


int pedirEntero(void) {
    int x;
    printf("Ingrese un numero entero: ");
    scanf("%d", &x);
    return x;
}

void imprimirEntero(int x) {
    printf("%d\n", x);
}


int main(void) {
    int x, y, m, z;
    x = pedirEntero();
    y = pedirEntero();
    m = pedirEntero();
    z = pedirEntero();
    if (x < y) 
        m = x;
    else
        m = y;
    printf("x=%d, y=%d, z=%d, m=%d\n", x, y, z, m); 
    if (m >= z)
        m = z;
    printf("x=%d, y=%d, z=%d, m=%d\n", x, y, z, m); 
    imprimirEntero(m);
}

// es mucho mas legible y modular. ahora la funcion main delega
// las funcionalidades de solicitar e imprimir enteros.
// todos los ejercicios anteriores solicitan al usuario valores,
// por lo que todos al menos deberian implementar la funcion de 
// pedirEntero