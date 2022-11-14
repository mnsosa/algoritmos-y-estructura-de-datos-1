// 1.b - absoluto
#include <stdio.h>

int valor_abs(int x) {
    if (x >= 0)
        // si x es positivo, devuelvo x
        return x;
    else
        // si x es negativo, lo multiplico por -1
        // y me queda positivo
        return -x;
}

int main() {
    int x;
    
    // solicito x
    printf("Ingrese x: ");
    scanf("%d", &x);
    
    // muestro un mensaje y el valor abs
    printf("El valor abs de %d es %d", x, valor_abs(x));
}