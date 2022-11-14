// 10
#include <stdio.h>

struct comp_t {
    int menores;
    int iguales;
    int mayores;
};

struct comp_t cuantos(int a[], int tam, int elem) {
    struct comp_t cuenta;
    // inicializo valores
    cuenta.menores = 0;
    cuenta.iguales = 0;
    cuenta.mayores = 0;
    
    int i = 0;
    while (i < tam) {
        if (a[i] > elem)
            cuenta.mayores++;
        else if (a[i] == 0) 
            cuenta.iguales++;
        else
            cuenta.menores++;
        i++;
    }
    return cuenta;
}

int main() {
    struct comp_t cuenta;
    const int N = 4;
    int A[N];
    // pido valores
    int i = 0;
    while (i<N) {
        printf("Ingrese el valor A[%d]: ", i);
        scanf("%d", &A[i]);
        i++;
    }
    // hago la cuenta para elem := 3
    cuenta = cuantos(A, N, 3);
    
    printf("Cantidad iguales a 3 es de: %d\n", cuenta.iguales);
    printf("Cantidad menores a 3 es de: %d\n", cuenta.menores);
    printf("Cantidad mayores a 3 es de: %d\n", cuenta.mayores);
    
    
    return 0;
}


