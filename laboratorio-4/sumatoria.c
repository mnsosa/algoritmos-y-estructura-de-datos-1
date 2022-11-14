// sumatoria
#include <stdio.h>

int sumatoria(int a[], int tam) {
    int i = 0;
    int sum = 0;
    while (i < tam) {
        sum += a[i];
        i++;
    }
    return sum;
}

int main() {
    const int N = 4; // pongo un valor como ejemplo
    int a[N];
    
    printf("CALCULO DE SUMATORIA\n");
    printf("--------------------\n\n");
    
    // carga del arreglo
    int i = 0;
    while (i < N) {
        printf("Ingrese el %d° valor: ", i+1);
        scanf("%d", &a[i]);
        i++;
    }
    
    printf("La sumatoria es: %d", sumatoria(a, N));
    
    return 0;
}




