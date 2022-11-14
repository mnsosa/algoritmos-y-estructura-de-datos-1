// 4
#include <stdio.h>

struct div_t {
    int cociente;
    int resto;
}; // importate ver ese ;

struct div_t division(int x, int y) {
    // devuelve el cociente y el resto de la division entera
    struct div_t miDiv;
    miDiv.cociente = x/y;
    miDiv.resto = x % y;
    return miDiv;
}

int main() {
    struct div_t midivision;
    int x, y;
    
    printf("PROGRAMA PARA HACER X DIVIDIDO Y");
    printf("\n--------------------------------");
    printf("\n\nIngrese x: ");
    scanf("%d", &x);
    printf("Ingrese y: ");
    scanf("%d", &y);
    
    if (y == 0) { // si divisor es cero
        printf("DIVISOR ES CERO, NO SE PUEDE EJECUTAR");
    }
    else {
        midivision = division(x, y);
        printf("COCIENTE: %d", midivision.cociente);
        printf("\nRESTO: %d", midivision.resto);    
    }
}



