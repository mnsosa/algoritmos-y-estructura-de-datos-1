// 1.b
#include <stdio.h>

int minimo(int x, int y) {
    // pregunto: es x menor a y?
    if (x < y)
        // si sí, devuelvo x
        return x;
    else // si no, devuelvo y
        return y;
}

int ingresarEntero() { //entra nada y devuelvo entero
    int x;
    printf("Ingrese numero entero: ");
    scanf("%d", &x);
    return x; // devuelvo x, que contiene lo que ingreso el usuario
}

int main() {
    int x, y;
    
    x = ingresarEntero();
    y = ingresarEntero();
    
    printf("El minimo es %d", minimo(x, y));

    return 0;
}
