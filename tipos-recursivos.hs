data Persona = Mujer | Hombre
    deriving (Show, Eq, Ord)

data Cola = VaciaC | Encolada Persona Cola
    deriving (Show, Eq, Ord)

colaSupermercado :: Cola
 
-- Quiero hacer una cola de colaSupermercado usando el tipo de dato Cola recursivo --
colaSupermercado = Encolada (Hombre) (Encolada (Mujer) (Encolada (Hombre) (Encolada (Mujer) (Encolada (Hombre) (Encolada (Mujer) (Encolada (Hombre) VaciaC))))))

sacarPrimero :: Cola -> Cola
sacarPrimero VaciaC = VaciaC
sacarPrimero (Encolada _ c) = c


sacarUltimo :: Cola -> Cola
sacarUltimo VaciaC = VaciaC
sacarUltimo (Encolada _ (Encolada _ c )) = c
sacarUltimo (Encolada _ VaciaC) = VaciaC


