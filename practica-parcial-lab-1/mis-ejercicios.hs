-- ##########################################################
-- ejercicios creados por mí para practicar para el primer 
-- parcial del laboratorio
-- ##########################################################

-- digamos que quiero modelar un sistema de gestión de partidos
-- de fútbol.

data Equipo = PSG | BAR | BOC | RIV
            deriving (Eq, Show)

nombre_equipo :: Equipo -> String
nombre_equipo PSG = "Paris Saint Germain"
nombre_equipo BAR = "Barcelona"
nombre_equipo BOC = "Boca"
nombre_equipo RIV = "River"

type Partido = (Equipo, Equipo)

-- proximas fechas
data ProxFechas = Nada | Agregar Partido ProxFechas
            deriving Show

-- ver proximas fechas
prox_partido :: ProxFechas -> Maybe Partido
prox_partido Nada = Nothing
prox_partido Agregar p pf = Just p