// 2 - multiple2
#include <stdio.h>

int pedirEntero() {
    int x;
    printf("Ingrese entero: ");
    scanf("%d", &x);
    return x;
}

int main() {
    // precondicion
    int x, y, z;
    x = pedirEntero();
    y = pedirEntero();
    z = pedirEntero();
    // programa
    int x_aux, y_aux;
    x_aux = x;
    y_aux = y;
    
    x = y;
    y = x_aux + y + z;
    z = x_aux + y_aux;
    
    // mostramos postcondicion
    printf("x = %d, y = %d, z = %d", x, y, z);
    
    return 0;
}




