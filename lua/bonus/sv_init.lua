include('sh_init.lua')

function BONUS:InitializeGamemode()
    return engine.ActiveGamemode() == 'darkrp'
end

function BONUS:CurrentGamemode()
    return engine.ActiveGamemode()
end

function BONUS:Initialize()
    for _, file in pairs(file.Find('bonus/server/*', 'LUA')) do
		include('bonus/server/' .. file)
	end
end