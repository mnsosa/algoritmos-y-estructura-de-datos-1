#include <stdio.h>
#include <stdbool.h>


void ejercicio_1() {
    int x, y, z;
    // solicito ingreso
    printf("Ingresar los valores de x, y, z\n");
    scanf("%d%d%d", &x, &y, &z);
    // expresiones a evaluar
    int salida_1 = x + y + 1;
    int salida_2 = z * z + y * 45 - 15 * x;
    bool salida_3 = y - 2 == (x * 3 + 1) % 5;
    int salida_4 = y / 2 * x;
    bool salida_5 = y < x * z;
    //prints
    printf("Resultados\n");
    printf("-----------\n");
    printf("Expresion 1: %d\n", salida_1);
    printf("Expresion 2: %d\n", salida_2);
    printf("Expresion 3: %d\n", salida_3);
    printf("Expresion 4: %d\n", salida_4);
    printf("Expresion 5: %d\n\n", salida_5);

    // Para x, y, z = 7, 3, 5
    // Expresion 1: 11
    // Expresion 2: 55
    // Expresion 3: 0
    // Expresion 4: 7
    // Expresion 5: 1
    // Para x, y, z = 1, 10, 8
    // Expresion 1: 12
    // Expresion 2: 499
    // Expresion 3: 0
    // Expresion 4: 5
    // Expresion 5: 0
}

void ejercicio_2() {
    // probamos con los valores x=16, y=-16, z=0, b=true, w=false
    int x=0, y=-0, z=0, b=true, w=true;
    printf("Debería ser true: %d\n", x % 4 == 0);
    printf("Debería ser true: %d\n", x + y == 0 && y - x == (-1) * z);
    printf("Debería ser false: %d\n", !(b && w));
}

void ejercicio_3() {
    // a
    int x;
    printf("a\n");
    printf("Ingrese valor de x: ");
    scanf("%d", &x);
    x = 5;
    printf("x=%d\n", x);
    // Ingrese valor de x: 9
    // x=5
    // Ingrese valor de x: 10
    // x=5
    // Ingrese valor de x: 4
    // x=5

    // b 
    int y;
    printf("b\n");
    printf("Ingrese valor de x: ");
    scanf("%d", &x);
    printf("Ingrese el valor de y: ");
    scanf("%d", &y);
    x = x + y;
    y =  y + y;
    printf("x=%d,  y=%d\n", x, y);
    // Ingrese valor de x: 16 
    // Ingrese el valor de y: 3 
    // x=19, y=6
    // Ingrese valor de x: 55 
    // Ingrese el valor de y: 100 
    // x=155, y=200
    // Ingrese valor de x: 2 
    // Ingrese el valor de y: 98 
    // x=100, y=196

    // c 
    printf("c\n");
    printf("Ingrese valor de x: ");
    scanf("%d", &x);
    printf("Ingrese el valor de y: ");
    scanf("%d", &y);
    y =  y + y;
    x = x + y;
    printf("x=%d,  y=%d\n", x, y);
    // Ingrese valor de x: 20 
    // Ingrese el valor de y: 8 
    // x=36, y=16
    // Ingrese valor de x: 30 
    // Ingrese el valor de y: 10 
    // x=50, y=20
    // Ingrese valor de x: 12 
    // Ingrese el valor de y: 36 
    // x=84, y=72
}

void ejercicio_4() {
    // 1.e
    printf("4a\n");
    int x, y;
    printf("Ingrese valor de x: ");
    scanf("%d", &x);
    printf("Ingrese valor de y: ");
    scanf("%d", &y);
    if (x >= y) 
        x = 0;
    else 
        x = 2;
    printf("x=%d, y=%d\n", x, y);
    // 1.e
    // Ingrese valor de x: 3
    // Ingrese valor de y: 1
    // x=0, y=1

    // 1.f es lo mismo pero con otro estado inicial
    // Ingrese valor de x: -100
    // Ingrese valor de y: 1
    // x=2, y=1

    // b
    // int x, y; 
    printf("4b\n");
    int m, z; 
    printf("Ingrese valor de x: ");
    scanf("%d", &x);
    printf("Ingrese valor de y: ");
    scanf("%d", &y);
    printf("Ingrese valor de m: ");
    scanf("%d", &m);
    printf("Ingrese valor de z: ");
    scanf("%d", &z);
    if (x < y) 
        m = x;
    else
        m = y;
    printf("x=%d, y=%d, z=%d, m=%d\n", x, y, z, m); 
    if (m >= z)
        m = z;
    printf("x=%d, y=%d, z=%d, m=%d\n", x, y, z, m); 
    // ejecucion 1:
    // Ingrese valor de x: 5
    // Ingrese valor de y: 4
    // Ingrese valor de m: 8
    // Ingrese valor de z: 0
    // x=5, y=4, z=0, m=4
    // x=5, y=4, z=0, m=0
    // ejecucion 2:
    // Ingrese valor de x: 9
    // Ingrese valor de y: 100
    // Ingrese valor de m: 2
    // Ingrese valor de z: 3
    // x=9, y=100, z=3, m=9
    // x=9, y=100, z=3, m=3
    // ejecucion 3:
    // Ingrese valor de x: 8
    // Ingrese valor de y: 10
    // Ingrese valor de m: 5
    // Ingrese valor de z: 9
    // x=8, y=10, z=9, m=8
    // x=8, y=10, z=9, m=8

    // en el estado final, m vale el valor menor de 
    // las cuatro variables
}

void ejercicio_5() {
    // 1.h
    int i;
    printf("Ingresar valor de i: ");
    scanf("%d", &i);
    while (i != 0) {
        printf("i=%d\n", i);
        i--;
        printf("i=%d\n", i);
    }

    // 1.i
    printf("Ingresar valor de i: ");
    scanf("%d", &i);
    while (i != 0) {
        printf("i=%d\n", i);
        i = 0;
        printf("i=%d\n", i);
    }

    // b-1
    // int i;
    int x, y;
    printf("Ingresar valor de x: ");
    scanf("%d", &x);
    printf("Ingresar valor de y: ");
    scanf("%d", &y);
    printf("Ingresar valor de i: ");
    scanf("%d", &i);
    i = 0;
    while (x >= y) {
        x = x - y;
        i++;
        printf("Interación %d: x=%d, y=%d, i=%d\n", i, x, y, i);
    }
    // Ingresar valor de x: 13 
    // Ingresar valor de y: 3
    // Ingresar valor de i: 0
    // Interación 1: x=10, y=3, i=1
    // Interación 2: x=7, y=3, i=2
    // Interación 3: x=4, y=3, i=3
    // Interación 4: x=1, y=3, i=4

    // b-2
    // int i, x;
    int res; // con bool no me dejaba hacer el scanf
    printf("Ingresar valor de x: ");
    scanf("%d", &x);
    printf("Ingresar valor de i: ");
    scanf("%d", &i);
    printf("Ingresar valor de res: ");
    scanf("%d", &res);
    i = 2;
    res = true;
    while (i < x && res) {
        res &= x%i != 0;
        i++;
        printf("Interación %d: x=%d, res=%d, i=%d\n", i-2, x, res, i);
    }
    // Ingresar valor de x: 5
    // Ingresar valor de i: 0
    // Ingresar valor de res: 0
    // Interación 1: x=5, res=1, i=3
    // Interación 2: x=5, res=1, i=4
    // Interación 3: x=5, res=1, i=5

}

void elegir_ejercicio() {
    int ejercicio;
    printf("Elegir el ejercicio: ");
    scanf("%d", &ejercicio);

    // printeo el nombre del ejercicio
    printf("\nEJERCICIO NUMERO %d\n", ejercicio);
    printf("---------------------\n");

    switch (ejercicio)
    {
    case 1:
        ejercicio_1();
        break;

    case 2:
        ejercicio_2();
        break;
    
    case 3:
        ejercicio_3();
        break;

    case 4:
        ejercicio_4();
        break;

    case 5:
        ejercicio_5();
        break;

    default:
        break;
    }
}

int main() {
    // elegir ejercicio
    elegir_ejercicio();
    return 0;
}