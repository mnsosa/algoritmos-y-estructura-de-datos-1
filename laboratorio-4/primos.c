// 13
#include <stdio.h>
#include <stdbool.h>


bool es_primo(int n) {
    int i = 2;
    // uso criterio de la raiz
    while (i <= (int)sqrt(n)) {
        if (n%i == 0) // si un i divide a n
            return false;
        i++;
    }
    return true;
}

int nesimo_primo(int N) {
    if (N == 1)  // si piden el primero, devuelvo 2
        return 2;
    // devuelve en n-esimo primo
    int num = 3; // empiezo en 3
    // a partir de este primo, todos son impares
    // uso este conocimiento para que sea mas eficiente
    int cant_primos = 2; // ya cuento al 2 y 3
    while (cant_primos < N) {
        num += 2; // paso al siguiente impar
        if (es_primo(num))
            cant_primos++;
    }
    return num;
}

int main() {
    int n = -1;
    // solicito al usuario n
    // se pide hasta que el valor sea no negativo
    while(n<0) {
        printf("Ingrese un valor no negativo: ");
        scanf("%d", &n);   
    }

    printf("El %d-esimo numero primo: %d", n, nesimo_primo(n));
    
    return 0;
}