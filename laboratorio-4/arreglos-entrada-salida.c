// 5
# include <stdio.h>

void pedirArreglo(int a[], int n_max) {
    int i = 0;
    while (i < n_max) {
        printf("Ingrese a[%d]: ", i);
        scanf("%d", &a[i]);
        i++;
    }
}

void imprimeArreglo(int a[], int n_max) {
    printf("EL ARREGLO ES: \n");
    printf("--------------\n");

    // yo quiero que sea por ej asi
    // [1, 2, 4, 10, 4, 1]

    int i = 0;
    printf("[");
    while (i < n_max-1) {
        printf("%d, ", a[i]);
        i++;   
    }
    printf("%d]", a[n_max-1]);
}

int main() {
    const int largo = 4; // pongo larg = 4 como ejemplo
    int X[largo];
    
    pedirArreglo(X, largo);
    imprimeArreglo(X, largo);
    
    return 0;
}