-- EJERCICIOS

-- Alumno: Matías Nicolás Sosa
-- DNI: 41002572
-- 2 cuatrimestre 2022
-- Comisión: 2


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
-- 4. Programá las siguientes funciones que implementan los cuantificadores generales. Notá que
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
-- 5. Definí nuevamente la función paratodo, pero esta vez usando la función paratodo’ (sin
-- recursión ni análisis por casos!).
-- ################################################################### --
        paratodo'' :: [Bool] -> Bool
        paratodo'' xs = paratodo' xs (\x -> x)
        -- \x -> x es la función identidad (id)


-- ################################################################### --
-- 6. Utilizando las funciones del ejercicio 4, programá las siguientes funciones por composición,
-- sin usar recursión ni análisis por casos.
-- ################################################################### --

-- a) todosPares :: [Int] -> Bool verifica que todos los números de una lista sean
-- pares.
        todosPares :: [Int] -> Bool
        todosPares xs = paratodo' xs even
        -- la función `even` es parte del prelude y devuelve True si el número es par

-- b) hayMultiplo :: Int -> [Int] -> Bool verifica si existe algún número dentro del
-- segundo parámetro que sea múltiplo del primer parámetro.
        hayMultiplo :: Int -> [Int] -> Bool
        hayMultiplo n xs = existe' xs even

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
        multiplicaPares xs = productoria' xs (\x -> if even x then x else 1)


-- ################################################################### --
-- 7. Indagá en Hoogle (no es un typo!) sobre las funciones map y filter. También podés
-- consultar su tipo en ghci con el comando :t.
-- ¿Qué hacen estas funciones?
-- ¿A qué equivale la expresión map succ [1, -4, 6, 2, -8], donde succ n = n+1?
-- ¿Y la expresión filter esPositivo [1, -4, 6, 2, -8]?
-- ################################################################### --

-- ¿Qué hacen estas funciones?
        -- map :: (a -> b) -> [a] -> [b]
        -- La función map aplica una función a cada elemento de una lista.
        
        -- filter :: (a -> Bool) -> [a] -> [a]
        -- La función filter filtra una lista, devolviendo una lista con los elementos.

-- ¿A qué equivale la expresión map succ [1, -4, 6, 2, -8], donde succ n = n+1?
        -- map succ [1, -4, 6, 2, -8]
        -- <=> 
        -- map (\x -> x + 1) [1, -4, 6, 2, -8]
        -- <=> 
        -- [2, -3, 7, 3, -7]

-- ¿Y la expresión filter esPositivo [1, -4, 6, 2, -8]?
        -- filter esPositivo [1, -4, 6, 2, -8]
        -- <=>
        -- filter (\x -> x > 0) [1, -4, 6, 2, -8]
        -- <=>
        -- [1, 6, 2]


-- ################################################################### --
-- 8. Programá una función que dada una lista de números xs, devuelve la lista que resulta de
-- duplicar cada valor de xs.
-- ################################################################### --
-- a) Definila usando recursión.
        duplicaRec :: [Int] -> [Int]
        duplicaRec [] = []
        duplicaRec (x:xs) = x*2 : duplicaRec xs

-- b) Definila utilizando la función map.
        duplicaMap :: [Int] -> [Int]
        duplicaMap xs = map (*2) xs


-- ################################################################### --
-- 9. Programá una función que dada una lista de números xs, calcula una lista que tiene como
-- elementos aquellos números de xs que son pares.
-- ################################################################### --

-- a) Definila usando recursión.
        paresRec :: [Int] -> [Int]
        paresRec [] = []
        paresRec (x:xs) = if even x then x : paresRec xs else paresRec xs

-- b) Definila utilizando la función filter.
        paresFilter :: [Int] -> [Int]
        paresFilter xs = filter even xs

-- c) Revisá tu definición del ejercicio 6e. ¿Cómo podés mejorarla?
        multiplicaPares' :: [Int] -> Int
        multiplicaPares' xs = productoria' (filter even xs) id


-- ################################################################### --
-- 10. La función primIgualesA toma un valor y una lista, y calcula el tramo inicial más largo de
-- la lista cuyos elementos son iguales a ese valor.

-- Por ejemplo:
-- primIgualesA 3 [3,3,4,1] = [3,3]
-- primIgualesA 3 [4,3,3,4,1] = []
-- primIgualesA 3 [] = []
-- primIgualesA ’a’ "aaadaa" = "aaa"
-- ################################################################### --

-- a) Programá primIgualesA por recursión.
        primIgualesA :: Eq a => a -> [a] -> [a]
        primIgualesA _ [] = []
        primIgualesA n (x:xs) | n == x = x : primIgualesA n xs
                              | otherwise = []

-- b) Programá nuevamente la función utilizando takeWhile.
        primIgualesA' :: Eq a => a -> [a] -> [a]
        primIgualesA' n xs = takeWhile (==n) xs


-- ################################################################### --
-- 11. La función primIguales toma una lista y calcula el tramo inicial más largo de la lista
-- cuyos elementos son todos iguales entre sí.

-- Por ejemplo:
-- primIguales [3,3,4,1] = [3,3]
-- primIguales [4,3,3,4,1] = [4]
-- primIguales [] = []
-- primIguales "aaadaa" = "aaa"
-- ################################################################### --

-- a) Programá primIguales por recursión.
        primIguales' :: Eq a => [a] -> [a]
        primIguales' [] = []
        primIguales' (x:xs) = x : primIguales' (takeWhile (==x) xs)

-- b) Usá cualquier versión de primIgualesA para programar primIguales. Está permitido
-- dividir en casos, pero no usar recursión.
        primIguales :: Eq a => [a] -> [a]
        primIguales xs = primIgualesA (head xs) xs


-- ################################################################### --
-- 12.(*) Todas las funciones del ejercicio 4 son similares entre sí: cada una aplica la función
-- término t a todos los elementos de una lista, y luego aplica algún operador entre todos ellos,
-- obteniéndose así el resultado final. Para el caso de la lista vacía, se devuelve el elemento
-- neutro. De esa manera cada una de ellas computa una cuantificación sobre los elementos de
-- la lista transformados por t:

-- paratodo’.xs.t = < ∀ i : 0 ≤ i < #xs : t.xs!i >
-- existe’.xs.t = < ∃ i : 0 ≤ i < #xs : t.xs!i >
-- sumatoria’.xs.t = < Σ i : 0 ≤ i < #xs : t.xs!i >
-- productoria’.xs.t = < Π i : 0 ≤ i < #xs : t.xs!i >

-- Por ejemplo, para sumatoria’ el operador asociado al cuantificador Σ es la suma (+), por
-- lo que

-- sumatoria’ [1,2,3] t = (t 1) + (t 2) + (t 3) + 0

-- donde el cálculo consistió en aplicar t a cada elemento, combinándolos con el operador
-- (+) hasta llegar a la lista vacía donde se devuelve el neutro de la suma (0). Guiándote por
-- las observaciones anteriores, definí de manera recursiva la función cuantGen (denota la
-- cuantificación generalizada):

-- cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
-- cuantGen op z xs t = ...

-- Reescribir todas las funciones del punto 4 utilizando el cuantificador generalizado (sin usar
-- inducción y en una línea por función).
-- ################################################################### --

-- cuantGen
        cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
        cuantGen op z xs t = foldr op z (map t xs)

-- a) paratodo’ con cuantGen
        paratodo''' :: [Bool] -> Bool
        paratodo''' xs = cuantGen (&&) True xs id

-- b) existe’ con cuantGen
        existe''' :: [Bool] -> Bool
        existe''' xs = cuantGen (||) False xs id

-- c) sumatoria’ con cuantGen
        sumatoria''' :: [Int] -> Int
        sumatoria''' xs = cuantGen (+) 0 xs id

-- d) productoria’ con cuantGen
        productoria''' :: [Int] -> Int
        productoria''' xs = cuantGen (*) 1 xs id


-- ################################################################### --
--13.(*) Para cada uno de los siguientes patrones, decidí si están bien tipados, y en tal caso da los
-- tipos de cada subexpresión. En caso de estar bien tipado, ¿el patrón cubre todos los casos
-- de definición?
-- ################################################################### --

-- a) f :: (a, b) -> ... -- Bien tipado
--    f (x , y) = ... -- Cubre todos los casos de definición

-- b) f :: [(a, b)] -> ... 
-- f (a , b) = ...     -- No está bien tipado   

-- c) f :: [(a, b)] -> ...
-- f (x:xs) = ... -- Bien tipado. Cubre todos los casos de definición

-- d) f :: [(a, b)] -> ...
-- f ((x, y) : ((a, b) : xs)) = ... -- Bien tipado. Cubre todos los casos de definición

-- e) f :: [(Int, a)] -> ...
-- f [(0, a)] = ... -- Bien tipado. No cubre todos los casos de definición. 
                    -- Por ejemplo, f [(1, a)] no está cubierto.

-- f ) f :: [(Int, a)] -> ...
-- f ((x, 1) : xs) = ... -- No está bien tipado. El tipo a no puede equivalecerse.

-- g) f :: (Int -> Int) -> Int -> ...
-- f a b = ...           -- Bien tipado. Cubre todos los casos de definición

-- h) f :: (Int -> Int) -> Int -> ...
-- f a 3 = ...           -- Bien tipado. No cubre todos los casos de definición. 
                         -- Por ejemplo, f a 4 no está cubierto.

-- i) f :: (Int -> Int) -> Int -> ...
-- f 0 1 2 = ...         -- No está bien tipado. La función f espera dos argumentos.


-- ################################################################### --
-- 14. (*) Para las siguientes declaraciones de funciones, da al menos una definción cuando sea
-- posible. ¿Podés dar alguna otra definición alternativa a la que diste en cada caso?
-- Por ejemplo, si la declaración es f :: (a, b) -> a,
-- la respuesta es: f (x,y) = x
-- ################################################################### --

-- a) f :: (a, b) -> b
-- f (x, y) = y -- Solo puede darse esta definición

-- b) f :: (a, b) -> c
-- No se puede porque no se conoce nada sobre a y b como para generar un tipo c,
-- que también es desconocido.

-- c) f :: (a -> b) -> a -> b
-- f g x = g x -- Solo puede darse esta definición

-- d) f :: (a -> b) -> [a] -> [b]
-- f g x = map g x

-- ó también puede ser

-- f _ [] = []
-- f g (x:xs) = [g x] -- solo aplica la función g al primer elemento de la lista, si no es vacía.

-- e) f :: (a -> b) -> (b -> c) -> a -> c
-- f g h x = h (g x) -- Solo puede darse esta definición