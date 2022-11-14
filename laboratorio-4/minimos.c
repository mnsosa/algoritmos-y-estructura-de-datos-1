// 9. minimos.c
#include <stdio.h>
#include <limits.h>

int minimo_pares(int a[], int tam) {
    int min = INT_MAX; // infinito positivo
    int i = 0;
    while (i < tam) {
        if (a[i]%2 == 0 && a[i] < min) {
            min = a[i];
        }
        i++;
    }
    return min;
}

int minimo_impares(int a[], int tam) {
    int min = INT_MAX; // infinito positivo
    int i = 0;
    while (i < tam) {
        if (a[i]%2 == 1 && a[i] < min) {
            min = a[i];
        }
        i++;
    }
    return min;
}

int main() {
    int const N = 4;
    int arr[N]; 
    // carga del arreglo
    int i = 0;
    while (i < N) {
        printf("Ingrese el elemento a[%d]: ", i);
        scanf("%d", &arr[i]);
        i++;
    }
    printf("El minimo impar: %d", minimo_pares(arr, N));
    printf("\nEl minimo impar: %d", minimo_impares(arr, N));
}








