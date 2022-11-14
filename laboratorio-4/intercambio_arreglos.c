// 8
#include <stdio.h>
#include <assert.h>

void intercambiar(int a[], int tam, int i, int j) {
    int aux = a[i];
    a[i] = a[j];
    a[j] = aux;
}

int main() {
    const int N = 4; // pongo valor como ejemplo
    int a[N];
    
    // carga del arreglo
    int i = 0;
    while (i < N) {
        printf("Ingrese el elemento %d°: ", i+1);
        scanf("%d", &a[i]);
        i++;
    }
    // solicito i, j
    int j;
    printf("Ingrese primera posicion para intercambiar: ");
    scanf("%d", &i);
    
    assert(i >= 0 && i < N);
    
    printf("Ingrese segunda posicion para intercambiar: ");
    scanf("%d", &j);
    
    assert(j >= 0 && j < N);
    
    intercambiar(a, N, i, j);
    
    // mostrar arreglo
    i = 0;
    printf("[");
    while (i < N-1) {
        printf("%d, ", a[i]);
        i++;
    }
    printf("%d]\n", a[N-1]);

    return 0;
}
