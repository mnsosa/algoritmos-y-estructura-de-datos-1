// 12
#include <stdio.h>
#include <stdbool.h>

typedef char clave_t;
typedef int valor_t;

struct asoc {
    clave_t clave;
    valor_t valor;
};

bool asoc_existe(struct asoc a[], int tam, clave_t c) {
    int i = 0;
    while (i < tam) {
        if (a[i].clave == c)
            return true;
        i++;
    }
    return false;
}

int main() {
    const int N = 4; // 4 como ejemplo
    clave_t c;
    struct asoc a[N];
    // solicito a
    int i = 0;
    while (i < N) {
        printf("Ingrese la clave numero %d: ", i+1);
        scanf(" %c", &a[i].clave);
        printf("Ingrese el valor numero %d: ", i+1);
        scanf("%d", &a[i].valor);
        i++;
    }
    // solicito clave
    printf("Ingrese una clave: ");
    scanf(" %c", &c);
    
    if (asoc_existe(a, N, c))
        printf("La clave esta en el arreglo");
    else
        printf("La clave NO esta en el arreglo");
}








