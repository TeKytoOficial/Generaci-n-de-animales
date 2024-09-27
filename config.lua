Config = {}

-- Intervalo de generación (en milisegundos). 30 minutos = 1800000 ms.
Config.AnimalSpawnInterval = 1800000 

-- Lista de animales que se generarán.
Config.Animals = {
    { model = 'a_c_cow', name = 'Vaca' },
    { model = 'a_c_boar', name = 'Jabalí' },
    { model = 'a_c_deer', name = 'Ciervo' },
    { model = 'a_c_hen', name = 'Gallina' },
    { model = 'a_c_coyote', name = 'Coyote' },
    { model = 'a_c_cat_01', name = 'Gato' },
    { model = 'a_c_chickenhawk', name = 'Halcón' },
    { model = 'a_c_pig', name = 'Cerdo' },
    { model = 'a_c_pug', name = 'Perro (Pug)' },
    { model = 'a_c_rabbit_01', name = 'Conejo' }
}

-- Lista de posibles ubicaciones donde se generarán los animales (coordenadas aleatorias).
Config.SpawnLocations = {
    {x = -2000.0, y = 3000.0, z = 32.0},
    {x = 1200.0, y = 6500.0, z = 40.0},
    {x = 2500.0, y = 5000.0, z = 45.0},
    {x = -1000.0, y = 4000.0, z = 35.0},
    {x = -3000.0, y = 5500.0, z = 50.0}
}