if SERVER then 
    print('[SERVER] Loading server startup')

    -- Load files
    AddCSLuaFile('server/sv_bonus.lua')
end

if CLIENT then
    print('[CLIENT] Loading client startup')

    -- Load files
    AddCSLuaFile('client/cl_menu.lua')
    AddCSLuaFile('client/cl_fonts.lua')
end

hook.Add('Initialize', 'table_init', function()
    sql.Query("CREATE TABLE IF NOT EXISTS bonusPlayers(steamID TEXT(255), bonusAmount TEXT(255))")
end)