#include <stdio.h>


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
    int entero = pedirEntero();
    imprimirEntero(entero);
    return 0;
}