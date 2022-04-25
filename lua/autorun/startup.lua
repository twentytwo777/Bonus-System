if SERVER then 
    print('[SERVER] Loading server startup')
    
    if (!sql.TableExists('bonusPlayers')) then
        sql.Query("CREATE TABLE bonusPlayers(steamID VARCHAR(255), bonusAmount VARCHAR(255))")
    end

    -- Load files
    AddCSLuaFile('server/sv_bonus.lua')
end

if CLIENT then 
    print('[CLIENT] Loading client startup')

    -- Load files
    AddCSLuaFile('client/cl_menu.lua')
    AddCSLuaFile('client/cl_fonts.lua')
end