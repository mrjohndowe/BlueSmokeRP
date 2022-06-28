Config = {}

Config.PawnLocation = {
    coords = vector3(36.37, -1769.57, 30.91),
    length = 1.5,
    width = 1.8,
    heading = 43.63,
    debugPoly = false,
    minZ = 28.00,
    maxZ = 32.00,
    distance = 2.0
}

Config.BankMoney = false -- Set to true if you want the money to go into the players bank
Config.UseTimes = false -- Set to false if you want the pawnshop open 24/7
Config.TimeOpen = 7 -- Opening Time
Config.TimeClosed = 17 -- Closing Time
Config.SendMeltingEmail = true

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.PawnItems = {
    [1] = {
        item = 'apple_juice',
        price = math.random(1,5)
    }
}

-- Config.MeltingItems = { -- meltTime is amount of time in minutes per item
    -- [1] = {
        -- item = 'goldchain',
        -- rewards = {
            -- [1] = {
                -- item = 'goldbar',
                -- amount = 2
            -- }
        -- },
        -- meltTime = 0.15
    -- },
    -- [2] = {
        -- item = 'diamond_ring',
        -- rewards = {
            -- [1] = {
                -- item = 'diamond',
                -- amount = 1
            -- },
            -- [2] = {
                -- item = 'goldbar',
                -- amount = 1
            -- }
        -- },
        -- meltTime = 0.15
    -- },
    -- [3] = {
        -- item = 'rolex',
        -- rewards = {
            -- [1] = {
                -- item = 'diamond',
                -- amount = 1
            -- },
            -- [2] = {
                -- item = 'goldbar',
                -- amount = 1
            -- },
            -- [3] = {
                -- item = 'electronickit',
                -- amount = 1
            -- }
        -- },
        -- meltTime = 0.15
    -- },
    -- [4] = {
        -- item = '10kgoldchain',
        -- rewards = {
            -- [1] = {
                -- item = 'diamond',
                -- amount = 5
            -- },
            -- [2] = {
                -- item = 'goldbar',
                -- amount = 1
            -- }
        -- },
        -- meltTime = 0.15
    -- },
-- }
