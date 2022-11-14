// 1
#include <stdio.h>

struct datos_t {
    float maximo;
    float minimo;
    float promedio;
};

struct datos_t stats(float a[], int tam) {
    struct datos_t d;
    d.maximo = a[0]; // supongo el primero. a es no vacio
    d.minimo = a[0]; // idem anterior
    d.promedio = a[0]/tam; // inicializo con esa primera fraccion
    
    int i = 1;
    while (i < tam) {
        if (a[i] > d.maximo)    
            d.maximo = a[i];
        if (a[i] < d.minimo)    
            d.minimo = a[i];
        d.promedio += a[i]/tam;
        i++;
    }
    return d;
}

int main() {
    const int N = 4; // 4 como ejemplo
    struct datos_t estadisticas;
    float a[N];
    // solicito datos
    int i = 0;
    while (i < N) {
        printf("Ingrese a[%d]: ", i);
        scanf("%f", &a[i]);
        i++;
    }
    // hago las estadisticas
    estadisticas = stats(a, N);
    printf("El minimo es: %f\n", estadisticas.minimo);
    printf("El maximo es: %f\n", estadisticas.maximo);
    printf("El promedio es: %f", estadisticas.promedio);
}






