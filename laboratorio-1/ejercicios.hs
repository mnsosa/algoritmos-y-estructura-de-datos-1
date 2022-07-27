-- EJERCICIOS

-- ################################################################### --
-- 1. Programar las siguientes funciones:
-- ################################################################### --
-- a) esCero :: Int -> Bool
        esCero :: Int -> Bool
        esCero n = n == 0

-- b) esPositivo :: Int -> Bool
        esPositivo :: Int -> Bool
        esPositivo n = n > 0

-- c) esVocal :: Char -> Bool
        esVocal :: Char -> Bool
        esVocal c = c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u'


-- ################################################################### --
-- 2. Programar usando recursión o composición
-- ################################################################### --
-- a) paratodo :: [Bool] -> Bool
        paratodo :: [Bool] -> Bool
        paratodo [] = True
        paratodo (x:xs) = x && paratodo xs

-- b) sumatoria :: [Int] -> Int
        sumatoria :: [Int] -> Int
        sumatoria [] = 0
        sumatoria (x:xs) = x + sumatoria xs

-- c) productoria :: [Int] -> Int
        productoria :: [Int] -> Int
        productoria [] = 1
        productoria (x:xs) = x * productoria xs

-- d) factorial :: Int -> Int
        factorial :: Int -> Int
        factorial 0 = 1
        factorial n = n * factorial (n-1)

-- e) promedio :: [Int] -> Int
        promedio :: [Int] -> Int
        promedio xs = sumatoria xs `div` length xs


-- ################################################################### --
-- 3. Programar la función pertenece :: Int -> [Int] -> Bool, que verifica 
-- si un número se encuentra en una lista.
-- ################################################################### --
        pertenece :: Int -> [Int] -> Bool
        pertenece n [] = False
        pertenece n (x:xs) = n == x || pertenece n xs


-- ################################################################### --
-- 4. Programá la función encuentra que dado un valor n de tipo Int y una lista de pares de
-- tipo [(Int, String)] que asocia números a palabras, devuelve la palabra correspondiente
-- a n, es decir, el segundo componente del par cuyo primer componente es igual a n. En caso
-- que exista mas de una palabra asociada al mismo número, devuelve la primera de ellas. En
-- caso que no exista palabra asociada al número, devuelve la palabra vacía ("").
-- ################################################################### --
        encuentra :: Int -> [(Int, String)] -> String
        encuentra n [] = ""
        encuentra n ((x,y):xs) = if n == x then y else encuentra n xs


-- ################################################################### --
-- 5. Programá las siguientes funciones que implementan los cuantificadores generales. Notá que
-- el segundo parámetro de cada función, es otra función!
-- ################################################################### --
-- a) paratodo’ :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un
-- predicado t :: a -> Bool, determina si todos los elementos de xs satisfacen el
-- predicado t.
        paratodo' :: [a] -> (a -> Bool) -> Bool
        paratodo' [] t = True
        paratodo' (x:xs) t = t x && paratodo' xs t
        
-- b) existe’ :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un
-- predicado t :: a -> Bool, determina si alg´un elemento de xs satisface el predicado
-- t.
        existe' :: [a] -> (a -> Bool) -> Bool
        existe' [] t = False
        existe' (x:xs) t = t x || existe' xs t

-- c) sumatoria’ :: [a] -> (a -> Int) -> Int, dada una lista xs de tipo [a] y una
-- función t :: a -> Int (toma elementos de tipo a y devuelve enteros), calcula la
-- suma de los valores que resultan de la aplicación de t a los elementos de xs.
        sumatoria' :: [a] -> (a -> Int) -> Int
        sumatoria' [] t = 0
        sumatoria' (x:xs) t = t x + sumatoria' xs t

-- d) productoria’ :: [a] -> (a -> Int) -> Int, dada una lista de xs de tipo [a]
-- y una función t :: a -> Int, calcula el producto de los valores que resultan de la
-- aplicación de ta los elementos de xs.
        productoria' :: [a] -> (a -> Int) -> Int
        productoria' [] t = 1
        productoria' (x:xs) t = t x * productoria' xs t


-- ################################################################### --
-- 6. Definí nuevamente la función paratodo, pero esta vez usando la función paratodo’ (sin
-- recursión ni análisis por casos!).
-- ################################################################### --
        paratodo'' :: [Bool] -> Bool
        paratodo'' xs = paratodo' xs (\x -> x)


-- ################################################################### --
-- 7. Utilizando las funciones del ejercicio 5, programá las siguientes funciones por composición,
-- sin usar recursión ni análisis por casos.
-- ################################################################### --

-- a) todosPares :: [Int] -> Bool verifica que todos los números de una lista sean
-- pares.
        todosPares :: [Int] -> Bool
        todosPares xs = paratodo' xs (\x -> mod x 2 == 0)

-- b) hayMultiplo :: Int -> [Int] -> Bool verifica si existe algún número dentro del
-- segundo parámetro que sea múltiplo del primer parámetro.
        hayMultiplo :: Int -> [Int] -> Bool
        hayMultiplo n xs = existe' xs (\x -> mod x n == 0)

-- c) sumaCuadrados :: Int -> Int, dado un número no negativo n, calcula la suma de
-- los primeros n cuadrados.
-- Ayuda: En Haskell se puede escribir la lista que contiene el rango de números entre n
-- y m como [n..m].
        sumaCuadrados :: Int -> Int
        sumaCuadrados n = sumatoria' [0..n] (^2)

-- d) ¿Se te ocurre como redefinir factorial (ej. 2d) para evitar usar recursión?
        factorial' :: Int -> Int
        factorial' n = productoria' [1..n] id

        -- o usando la productoria normal
        factorial'' :: Int -> Int
        factorial'' n = productoria [1..n]

-- e) multiplicaPares :: [Int] -> Int que calcula el producto de todos los números
-- pares de una lista.
        multiplicaPares :: [Int] -> Int
        multiplicaPares xs = productoria' xs (\x -> if mod x 2 == 0 then x else 1)


-- ################################################################### --
-- 8. Indagá en Hoogle (no es un typo!) sobre las funciones map y filter. También podés
-- consultar su tipo en ghci con el comando :t.
-- ¿Qué hacen estas funciones?
-- ¿A qué equivale la expresión map succ [1, -4, 6, 2, -8], donde succ n = n+1?
-- ¿Y la expresión filter esPositivo [1, -4, 6, 2, -8]?
-- ################################################################### --
        -- map :: (a -> b) -> [a] -> [b]
        -- La función map aplica una función a cada elemento de una lista.
        
        -- filter :: (a -> Bool) -> [a] -> [a]
        -- La función filter filtra una lista, devolviendo una lista con los elementos.

        -- map succ [1, -4, 6, 2, -8]
        -- [2, -3, 7, 3, -7]

        -- filter esPositivo [1, -4, 6, 2, -8]
        -- [6, 2]


-- ################################################################### --
-- 9. Programá una función que dada una lista de números xs, devuelve la lista que resulta de
-- duplicar cada valor de xs.
-- ################################################################### --
-- a) Definila usando recursión.
        duplicaRec :: [Int] -> [Int]
        duplicaRec [] = []
        duplicaRec (x:xs) = x*2 : duplicaRec xs

-- b) Definila utilizando la función map.
        duplicaMap :: [Int] -> [Int]
        duplicaMap xs = map (*2) xs



        