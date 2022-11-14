-- Ejercicios
-- @mnsosa


-- ###############################################################################
-- 1. Tipos enumerados

-- 1.a Implementar el tipo carrera

data Carrera = Matematica | Fisica | Computacion | Astronomia
    deriving (Show, Eq)


-- 1.b Definí la siguiente función, usando pattern matching: titulo :: Carrera -> String 
-- que devuelve el nombre completo de la carrera en forma de string. Por ejemplo:
-- Para el constructor Matematica, debe devolver "Licenciatura en Matemática".

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia = "Licenciatura en Astronomia"


-- 1.c Para escribir música se utiliza denominada notación musical, la cual consta de notas (do, re, ...). 
-- Además, estas notas pueden representar algún modificador (sostenido, bemoledo). Por ahora, solo
-- representaremos las notas básicas.
-- Definir el tipo NotaBasica con constructores Do, Re, Mi, Fa, Sol, La y Si.

-- data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si 


-- 1.d El sistema de notación anglosajón relaciona las notas básicas con letras de la A a la G. 
-- Este sistema se usa por ejemplo para las tabulaciones de guitarra. Programar usando pattern matching,
-- que relaciona las notas Do, Re, Mi, Fa, Sol, La y Si con los caracteres ’C’ , ’D’, ’E’,
-- ’F’, ’G’, ’A’ y ’B’ respectivamente.

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

-- ###############################################################################

-- 2. Clases de tipos. 

-- 2.a Completar la definicion de NotaBasica para que sea instancia de la clase Eq.

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si 
                deriving (Eq, Ord, Show)
-- show para que pueda printear el 3.c

-- ###############################################################################

-- 3. Polimorfismo ad hoc.

-- 3.a Definir usando polimorfismo ad hoc la función minimoElemento que calcula cuál es el menor valor
-- de una lista de tipo [a]. Asegurarse que solo esté definida para listas no vacías.

minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:xs) = min x (minimoElemento xs)

-- 3.b Definir la función minimoElemento' de manera tal que el caso base para la lista vacía
-- esté definido. Para ello revisar la clase Bounded.

minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = maxBound -- porque el +infinito es el neutro de min. 
minimoElemento' [x] = x
minimoElemento' (x:xs) = min x (minimoElemento' xs)


-- 3.c Usar la función minimoElemento para determinar la nota más grave de la melodía:
-- [Fa, La, Sol, Re, Fa]

melodia = [Fa, La, Sol, Re, Fa]

nota_mas_grave = minimoElemento melodia

-- ###############################################################################

-- 4. Sinónimos de tipos; constructores con parámetros.
-- Se introducen los sinónimos de tipo y tipos algebraicos cuyos constructores llevan 
-- argumentos.  

-- 4.a Implementar los tipos Ingreso, Cargo, Area y Persona

type Ingreso = Int -- Es un sinónimo de tipo.


-- de tipo enumerados
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar
            deriving (Eq, Show)
data Area = Administrativa | Ensenanza | Economica | Postgrado
            deriving (Eq, Show)

-- de tipo algebraico 
data Persona = Decane                       -- constr sin args
            | Docente Cargo                 -- constr con 1 arg
            | NoDocente Area                -- constr con 1 arg
            | Estudiante Carrera Ingreso    -- constr con 2 args
            deriving (Eq, Show)


-- 4.b ¿Cuál es el tipo de constructor Docente?

-- Docente :: Cargo -> Persona


-- 4.c Programá la función cuantos_doc :: [Persona] -> Cargo -> Int que dada 
-- una lista de personas xs y un cargo c, devuelve la cantidad de docentes 
-- incluidos en xs que poseen el cargo c.

cuantos_doc :: [Persona] -> Cargo -> Int
cuantos_doc [] _ = 0
cuantos_doc ((Docente k):xs) c
        | c == k = 1 + cuantos_doc xs c
        | otherwise = cuantos_doc xs c
cuantos_doc (_:xs) c = cuantos_doc xs c

-- 4.d Usando filter
cuantos_doc' :: [Persona] -> Cargo -> Int
cuantos_doc' xs c = length (filter (\x -> x == Docente c) xs)

-- ###############################################################################

-- 5. Definición de clases.

-- 5.a Implementar NotaMusical, Alteracion y la función de sonidos

data Alteracion = Bemol | Sostenido | Natural

data NotaMusical = Nota  NotaBasica Alteracion

sonido :: NotaBasica -> Int
sonido Do = 1
sonido Re = 3
sonido Mi = 5
sonido Fa = 6
sonido Sol = 8
sonido La = 10
sonido Si = 12


-- 5.b Definir la función sonidoCromatico :: NotaMusical -> Int que devuelve el sonido
-- de una nota, incrementando en uno su valor si tiene la alteracion Sostenido, decrementando
-- en uno si tiene la alteracion Bemol y dejando su valor intacto si la alteración es Natural

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nb Natural) = sonido nb
sonidoCromatico (Nota nb Sostenido) = sonido nb + 1
sonidoCromatico (Nota nb Bemol) = sonido nb - 1


-- 5.c Inlcuir el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el mismo
-- valor de sonidoCromatico sean consideradas iguales.

instance Eq NotaMusical where
    (Nota nb1 a1) == (Nota nb2 a2) = sonidoCromatico (Nota nb1 a1) == sonidoCromatico (Nota nb2 a2)

-- 5.d Inlcuir el tipo NotaMusical a la clase Ord de manera tal que dos notas se ordenen. 
-- Una nota es menor que otra si y solo si el valor de sonidoCromatico para la primera
-- es menor o igual al valor de sonidoCromatico para la segunda.

instance Ord NotaMusical where
    (Nota nb1 a1) <= (Nota nb2 a2) = sonidoCromatico (Nota nb1 a1) <= sonidoCromatico (Nota nb2 a2)


-- 6. Tipos enumerados con polimorfismo.

-- 6.a Definir la función primerElemento que devuelve el primer elemento de una lista no
-- vacía, o Nothing si la lista es vacía

primerElemento :: [a] -> Maybe a 
primerElemento [] = Nothing
primerElemento (x:xs) = Just x


-- 7. Tipos recursivos. 

data Cola = VaciaC | Encolada Persona Cola

-- 7.a.1 atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que está en la primera
-- posición de una cola. 

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada p c) = Just c


-- 7.a.2

encolar :: Persona -> Cola -> Cola
encolar p VaciaC = Encolada p VaciaC
encolar p (Encolada p' c) = Encolada p' (encolar p c)


-- Ejercicio 7 2 c) --

busca :: Cola -> Cargo -> Maybe Persona
busca VaciaC cargo = Nothing
busca (Encolada persona cola) cargo | persona == Docente cargo = Just persona
                                    | otherwise = busca cola cargo


-- Ejercicio 7 b) --

--El tipo Sting es similar al tipo Cola--

-- Ejercicio 8 a) --

data ListaAsoc a b = Vacia 
                   | Nodo a b ( ListaAsoc a b )

-- Para representar la informacion contenida en una guia telefonica 
-- se debe instanciar de la siguiente manera: type Guia = ListaAsoc String Int

-- Ejercicio 8 b) 1 --

la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo a b l) = 1 + la_long l

--Ejercicio b) 2 --

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia Vacia = Vacia 
la_concat (Nodo a b l1) Vacia = (Nodo a b l1)
la_concat Vacia (Nodo c d l2) = (Nodo c d l2)
la_concat (Nodo a b l1) (Nodo c d l2) =  (Nodo a b (Nodo c d (la_concat (l1) (l2))))

--Ejercicio b) 3 --

la_agregar :: ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia a2 b2 = Vacia
la_agregar la a b = Nodo a b la


--Ejercicio b) 4 --

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b l) = (a, b): la_pares l

--Ejercicio b) 5 --

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b 
la_busca Vacia a = Nothing
la_busca (Nodo a b l) a' | (a == a') = Just b
                         | otherwise = la_busca l a'


--Ejercicio b) 6 --

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b 
la_borrar a Vacia = Vacia
la_borrar a' (Nodo a b l) | (a == a') = l     
                          | otherwise = Nodo a b (la_borrar a' l)


--Ejercicio 9 --

data Arbol a = Hoja 
             | Rama ( Arbol a ) a ( Arbol a )

type Prefijos = Arbol String

can, cana, canario, canas, cant, cantar, canto :: Prefijos
can     = Rama cana     "can"     cant
cana    = Rama canario  "a"       canas
canario = Rama Hoja     "rio"     Hoja
canas   = Rama Hoja     "s"       Hoja
cant    = Rama cantar   "t"       canto
cantar  = Rama Hoja     "ar"      Hoja
canto   = Rama Hoja     "o"       Hoja

-- Ejercicio 9 a) --

a_long :: Arbol a -> Int 
a_long Hoja = 0
a_long (Rama a1 a2 a3) = 1 + a_long a1 + a_long a3

-- Ejercicio 9 b) --
a_hojas :: Arbol a -> Int
a_hojas Hoja = 1
a_hojas (Rama a1 a2 a3) = a_hojas a1 + a_hojas a3

-- Ejercicio 9 c) --
-- dado un arbol que contiene numeros, los incrementa en uno
a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama a1 a2 a3) = Rama (a_inc a1) (a2 + 1) (a_inc a3)

-- Ejercicio 9 d) -- 
a_map :: (a -> b) -> Arbol a -> Arbol b
a_map f Hoja = Hoja
a_map f (Rama a1 a2 a3) = Rama (a_map f a1) (f a2) (a_map f a3)