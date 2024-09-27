local function setAnimalBehavior(animal)
    -- Función que alterna entre caminar y correr
    Citizen.CreateThread(function()
        while DoesEntityExist(animal) do  -- Asegurarse de que el animal aún existe
            -- Generar un valor aleatorio para elegir si el animal caminará o correrá
            local action = math.random(1, 2)

            if action == 1 then
                -- Caminar: Wander around
                TaskWanderStandard(animal, 10.0, 10)
            else
                -- Correr: Se mueve más rápido por un intervalo corto
                TaskSmartFleePed(animal, GetPlayerPed(-1), 100.0, 10, false, false)
            end

            -- Esperar un intervalo aleatorio entre 5 y 10 segundos antes de cambiar el comportamiento
            Wait(math.random(5000, 10000))  
        end
    end)
end

local function spawnAnimal(model, location)
    -- Carga el modelo del animal
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end

    -- Crea el animal en las coordenadas especificadas
    local animal = CreatePed(28, model, location.x, location.y, location.z, 0.0, true, false)
    SetPedRandomComponentVariation(animal, true)  -- Hace que el animal tenga variaciones de apariencia
    SetEntityAsMissionEntity(animal, true, true)  -- Marca al animal como entidad de misión para que no desaparezca

    -- Libera el modelo después de crear el animal
    SetModelAsNoLongerNeeded(model)

    -- Iniciar el comportamiento del animal
    setAnimalBehavior(animal)
end

-- Función para generar animales aleatoriamente por el mapa
local function spawnRandomAnimals()
    for i = 1, #Config.Animals do
        -- Selecciona un animal y una ubicación aleatoria
        local animalData = Config.Animals[math.random(#Config.Animals)]
        local spawnLocation = Config.SpawnLocations[math.random(#Config.SpawnLocations)]

        -- Genera el animal
        spawnAnimal(animalData.model, spawnLocation)
    end
end

-- Bucle que genera animales cada 30 minutos
Citizen.CreateThread(function()
    while true do
        spawnRandomAnimals()
        Wait(Config.AnimalSpawnInterval)  -- Espera 30 minutos para volver a generar animales
    end
end)
