AddCSLuaFile('bonus/cl_init.lua')
AddCSLuaFile('bonus/sh_init.lua')

if CLIENT then 
    include('bonus/cl_init.lua')
else
    AddCSLuaFile('bonus/panel/menu.lua')
    AddCSLuaFile('bonus/fonts/fonts.lua')

    include('bonus/sv_init.lua')

    BONUS:Initialize()

    resource.AddFile('resource/fonts/montserrat_regular.ttf')
    resource.AddFile('resource/fonts/montserrat_semibold.ttf')
    resource.AddFile('resource/fonts/montserrat_extrabold.ttf')

    resource.AddFile('resource/bonus-templates/present.png')
end

hook.Add('Initialize', 'InitializeBonusDatabase', function()
    sql.Query('CREATE TABLE IF NOT EXISTS bPl(steamID TEXT, bonusAmount TEXT)')
end)