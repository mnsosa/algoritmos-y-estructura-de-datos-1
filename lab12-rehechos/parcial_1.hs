-- a) Definir el tipo Palo que consta de los constructores Treboles, Corazones, Picas,
-- Diamantes. Los constructores no toman parámetros. El tipo Palo no debe estar en la
-- clase Eq. Luego programa la función usando pattern matching:
-- mismo_palo :: Palo -> Palo -> Bool
-- que dados dos valores p1 y p2 del tipo Palo debe devolver True cuando p1 y p2
-- son el mismo palo (se construyen con el mismo constructor) y False en caso contrario.
-- Si se usan más de cinco casos, este apartado sumará menos puntaje.

data Palo = Treboles | Corazones | Picas | Diamantes 
            deriving Show

mismo_palo :: Palo -> Palo -> Bool
mismo_palo Treboles Treboles = True
mismo_palo Corazones Corazones = True
mismo_palo Picas Picas = True
mismo_palo Diamantes Diamantes = True
mismo_palo _ _ = False


-- b) Definir el tipo Naipe que representa una carta de poker. Tiene constructores:
-- ● Constructor Numerada: Toma dos parámetros, el primero de tipo Numero y el
-- segundo de tipo Palo
-- ● Constructores Rey, Reina, Jota, As: Todos son constructores con un sólo
-- parámetro de tipo Palo
-- El tipo Numero debe ser un sinónimo del tipo Int.

type Numero = Int

data Naipe = Numerada Numero Palo | Rey Palo | Reina Palo | Jota Palo | As Palo deriving Show

-- c) Programar la función
-- valor_naipe :: Naipe -> Int
-- teniendo en cuenta que el valor de una carta será:
-- ● Si es una carta numerada : Su valor es el número de la carta.
-- ● Si es el naipe Jota : Su valor es 11
-- ● Si es el naipe Reina : Su valor es 12
-- ● Si es el naipe Rey : Su valor es 13
-- ● Si es el naipe As : Su valor es 14

valor_naipe :: Naipe -> Int
valor_naipe (Numerada n p) = n
valor_naipe (Jota _) = 11
valor_naipe (Reina _) = 12
valor_naipe (Rey _) = 13
valor_naipe (As _) = 14

-- d) Incluir el tipo Naipe en la clase Ord de manera tal que un naipe se considere mayor
-- que otro si su valor según la función valor_naipe es más grande.

-- primero se lo debe incluir al tipo eq
instance Eq Naipe where
    naipe_1 == naipe_2 = valor_naipe naipe_1 == valor_naipe naipe_2

-- ahora vemos el ord
instance Ord Naipe where
    naipe_1 <= naipe_2 = valor_naipe naipe_1 <= valor_naipe naipe_2


-- Ejercicio 2
-- a) Programar de manera recursiva la función
-- solo_numeradas :: [Naipe] -> Palo -> [Numero]
-- que dada una lista de cartas ns y un palo p devuelve una lista con los números de las
-- cartas numeradas (las que no son ases, jotas, reyes ni reinas) de ns que son del palo p.

solo_numeradas :: [Naipe] -> Palo -> [Numero]
solo_numeradas [] _ = []
solo_numeradas ((Numerada n p):ns) p'
                | mismo_palo p p' = n : (solo_numeradas ns p')
                | otherwise = solo_numeradas ns p'
solo_numeradas (_:ns) p' = solo_numeradas ns p'

-- b) Escribir una lista de naipes con al menos tres elementos, donde uno de ellos debe ser
-- una figura, y otro debe ser una carta numerada.

naipes_prueba = [Rey Treboles, Numerada 8 Diamantes, Numerada 4 Treboles, Reina Diamantes, As Picas, 
                Numerada 9 Treboles, Numerada 5 Treboles]

-- *Main> solo_numeradas naipes_prueba Treboles 
-- [4,9,5]

-- Ejercicio 3
-- Basados en el tipo ListaAsoc del Proyecto 2, programar la función:
-- la_menores :: ListaAsoc a b -> b -> ListaAsoc a b
-- que dada una lista de asociaciones la y un dato x devuelve una nueva lista de
-- asociaciones con las asociaciones de la cuyos valores son menores que x. Completar el
-- tipado de la función para incluir los type classes necesarios para programarla.

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) -- Nodo necesita a b y una lista de asoc anterior
                    deriving Show

la_menores :: Ord b => ListaAsoc a b -> b -> ListaAsoc a b -- b tiene que ser si o si ordenable
la_menores Vacia _ = Vacia
la_menores (Nodo x1 x2 la) x
    | x2 < x = Nodo x1 x2 (la_menores la x)
    | otherwise = la_menores la x

-- a) Programar la función
-- a_esCota_sup :: a -> Arbol a -> Bool
-- que dado un valor e de tipo a y un árbol as indica si e es una cota superior de todos
-- los elementos dentro del árbol as. Es decir indica si e es mayor o igual a todos los
-- elementos del árbol as. Completar el tipado de la función para incluir los type classes
-- necesarios para programarla
-- b) Inventar un ejemplo de uso de la función creando un árbol con al menos 3 elementos
-- c) Escribir el resultado de la función aplicada al ejemplo del inciso b

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) 
            deriving Show

a_esCota_sup :: Ord a => a -> Arbol a -> Bool
-- ver si e es mayor a todos los elem de as
a_esCota_sup e Hoja = True
a_esCota_sup e (Rama arb_izq x arb_der) = e >= x && True && (a_esCota_sup e arb_izq) && (a_esCota_sup e arb_der)

-- *Main> a_esCota_sup 1 (Rama Hoja 0 (Rama Hoja 0 Hoja))
-- True

-- *Main> a_esCota_sup 1 (Rama Hoja 4 (Rama Hoja 3 Hoja))
-- False

-- *Main> a_esCota_sup 10 (Rama Hoja 4 (Rama Hoja 3 Hoja))
-- True