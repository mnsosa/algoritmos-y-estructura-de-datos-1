-- DESCRIBIENDO EL LOL EN HASKELL

data Rol = Tirador | Mago | Asesino | Tanque | Soporte  deriving (Eq, Show)

type Daño = Int -- cantidad de daño que hace un jugador
type Nombre = String -- nombre de los champs

data FormaDeDaño = AP | AD | Fisico | Letalidad deriving (Eq, Show)

-- ej docentes: si docente k tiene el cargo c, devuelve la cantidad de docentes con ese cargo


data Campeon = Champ Nombre Rol Daño FormaDeDaño deriving (Eq)

instance Show Campeon where
    show (Champ nombre _ _ _) = show nombre

campeones :: [Campeon]

campeones = [Champ "Miss Fortune" Tirador 500 AD, 
            Champ "Blitz" Soporte 30 AP,
            Champ "Ahri" Mago 600 AP,
            Champ "Akali" Asesino 1000 AP,
            Champ "Zed"Asesino 6000 Letalidad,
            Champ "Kayle"Tirador 400 AD,
            Champ "Ashe" Tirador 1200 AD,
            Champ "Nami" Soporte 600 AP,
            Champ "Pyke" Soporte 3000 Letalidad,
            Champ "Braum" Soporte 50 AP,
            Champ "Nautilius" Soporte 63 AD]

-- analizar campeones

es_ap :: Campeon -> Bool
es_ap (Champ _ _ _ fdaño) = fdaño == AP

-- ¿Cuántos son AP?

cuantos_ap :: [Campeon] -> Int
cuantos_ap camps = length $ filter es_ap camps


-- ¿Cuántos son AD?

cuantos_ad :: [Campeon] -> Int
cuantos_ad camps = length $ filter (\(Champ _ _ _ fdaño) -> fdaño == AD) camps


-- ¿Cuántos son Tirador?

cuantos_tirador :: [Campeon] -> Int
cuantos_tirador camps = length $ filter es_tirador camps

es_tirador :: Campeon -> Bool
es_tirador (Champ _ rol _ _) = rol == Tirador


--------------------------------------------------------------------------
-- Una partida de LOL tiene dos equipos compuestos por 5 jugadores
-- Cada jugador juega una línea distinta
-- Además, cada jugador tiene asignada una división de liga
--------------------------------------------------------------------------

data Linea = Mid | Top | Jg | ADC | Supp
            deriving (Eq, Show)
data Division = Hierro | Bronce | Plata | Oro | Platino | Diamante | Maestro
            deriving (Eq, Show, Ord, Bounded)

data Jugador = Jugador Nombre Division Linea Campeon
            deriving (Eq, Show)


-- Ahri de la lista de campeones
ahri :: Campeon
ahri = filter (\(Champ n _ _ _) -> n == "Ahri") campeones !! 0

melina = Jugador "ANILEMSOX" Platino Mid ahri

