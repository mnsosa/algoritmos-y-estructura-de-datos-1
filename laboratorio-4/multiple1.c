// 2
#include <stdio.h>

int pedirEntero() {
    int x;
    printf("Ingrese entero: ");
    scanf("%d", &x);
    return x;
}

int main() {
    // precondicion
    int x, y;
    x = pedirEntero();
    y = pedirEntero();
    // programa
    y = x + y;
    x = x + 1;
    // mostramos postcondicion
    printf("x = %d, y = %d", x, y);
    
}