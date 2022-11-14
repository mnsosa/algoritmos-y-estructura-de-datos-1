// ejercicio 1 
#include <stdio.h>
#include <assert.h>

// en Hs
// holaHasta :: Int -> Void

void holaHasta(int n) {
    // mientras que n > 0, 
    // mostrar hola por pantalla
    while (n > 0) {
            printf("hola\n");
            n--; // decremento en 1 n, entonces
            // cada vez que itera, n vale 1 menos
    }
}

int main() {
    
    int x;
    
    printf("Ingrese un numero entero: \n");
    scanf("%d", &x); // pido al usuario que ingrese entero
    
    assert(x > 0);
    
    holaHasta(x);
    
    return 0;
}