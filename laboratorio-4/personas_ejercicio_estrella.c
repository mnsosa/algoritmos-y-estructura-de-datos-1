// 14 
#include <stdio.h>

typedef struct _persona {
    char *nombre;
    int edad;
    float altura;
    float peso;
} persona_t;

float peso_promedio(persona_t arr[], unsigned int longitud) {
    float suma_pesos = 0;
    int i = 0;
    while (i < longitud) {
        suma_pesos += arr[i].peso;
        i++;
    }
    return suma_pesos/longitud;
}
persona_t persona_de_mayor_edad(persona_t arr[], unsigned int longitud) {
    // supongo que es la primera
    // luego evaluo cual es mayor al mayor supuesto
    persona_t p_de_mayor_edad = arr[0]; 
    int i = 0; 
    // habra una primera iteracion de mas, pero es por si la longitud es de 1
    while (i < longitud) {
        if (arr[i].edad > p_de_mayor_edad.edad)
            p_de_mayor_edad = arr[i];
        i++;
    }
    return p_de_mayor_edad;
}

persona_t persona_de_menor_altura(persona_t arr[], unsigned int longitud) {
    // supongo que la de menor altura es la primera
    persona_t p_de_menor_altura = arr[0];
    int i = 0;
    while (i < longitud) {
        if (arr[i].altura < p_de_menor_altura.altura)
            p_de_menor_altura = arr[i];
        i++;
    }
    return p_de_menor_altura;
}

int main(void) {
    persona_t p1 = {"Paola", 21, 1.85, 75};
    persona_t p2 = {"Luis", 54, 1.75, 69};
    persona_t p3 = {"Julio", 40, 1.70, 80};
    unsigned int longitud = 3;
    persona_t arr[] = {p1, p2, p3};
    printf("El peso promedio es %f\n", peso_promedio(arr, longitud));
    persona_t p = persona_de_mayor_edad(arr, longitud);
    printf("El nombre de la persona con mayor edad es %s\n", p.nombre);
    p = persona_de_menor_altura(arr, longitud);
    printf("El nombre de la persona con menor altura es %s\n", p.nombre);
    return 0;
}


