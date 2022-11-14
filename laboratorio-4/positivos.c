// 7
#include <stdio.h>
#include <stdbool.h>

bool existe_positivo(int a[], int tam) {
    int i = 0;
    while (i < tam) {
        if (a[i] > 0)
            return true;
        i++;
    }
    return false;
}

bool todos_positivos(int a[], int tam) {
    int i = 0;
    while (i < tam) {
        if (a[i] < 0)
            return false;
        i++;
    }
    return true;
}

int main() {
    const int N = 4; // pongo un valor de ejemplo
    int a[N];
    
    // solicito al usuario los valores de a[]
    int i = 0;
    while (i<N) {
        printf("Ingrese el valor de a[%d]: ", i);
        scanf("%d", &a[i]);
        i++;
    }
    
    // el usuario elige la funcion a ejecutar
    int eleccion;
    printf("Presione 1 para ejecutar <existe positivos>, o presione la tecla 2 para ejecutar <todos positivos>: " );
    scanf("%d", &eleccion);
    
    if (eleccion == 1) {
        printf("Existe positivo: %d", existe_positivo(a, N));
    } else if (eleccion == 2) {
        printf("Todos positivos: %d", todos_positivos(a, N));
    } else {
        printf("Tecla incorrecta.");
    }
    
}
















