// 1.b - intercambio
#include <stdio.h>

int ingresarEntero() {
    int x;
    printf("Ingrese entero: ");
    scanf("%d", &x);
    return x;
}

int main() {
    int x, y;
    
    // solicito valores de x e y
    x = ingresarEntero();
    y = ingresarEntero();
    printf("\nEstado actual:\n");
    printf("(x -> %d, y -> %d)\n", x, y);
    
    // INTERCAMBIO
    int z; // declaro una variable auxiliar
    z = x;
    x = y;
    y = z;
    
    printf("\nLos valores intercambiados son\n");
    printf("(x -> %d, y -> %d)", x, y);
}
