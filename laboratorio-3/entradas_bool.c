#include <stdio.h>
#include <stdbool.h>


bool pedirBooleano(void) {
    int val;
    printf("Ingrese un valor booleano: ");
    scanf("%d", &val);
    bool b = val;
    return b;
}

void imprimirBooleano(bool x) {
    if (x) 
        printf("verdadero\n");
    else 
        printf("falso\n");
}

int main(void) {
    bool b = pedirBooleano();
    imprimirBooleano(b);

    return 0;   
}