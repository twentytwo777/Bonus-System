util.AddNetworkString('GiveBonus')
util.AddNetworkString('OpenMenu')

local localization = bonus.localization
local language = bonus.language

local function bonusMenu(ply, text)
    if (string.Trim(string.lower(text)) == '!bonus') then
        net.Start('OpenMenu')
        net.Send(ply)
    end
end

net.Receive('GiveBonus', function(len, ply)
    local player = ply:SteamID64()
    local amount = math.random(bonus.moneyAmount.minAmount, bonus.moneyAmount.maxAmount)
    local existPlayer = sql.QueryValue('SELECT * FROM bonusPlayers WHERE steamID = "' .. player .. '"')

    if (!existPlayer) then
        sql.Query('INSERT INTO bonusPlayers VALUES("' .. player .. '", "' .. amount .. '")')
        ply:addMoney(amount)
        ply:ChatPrint(localization.fromServerNotification .. localization[language]['messageServer']['youRecieve'] .. amount .. GAMEMODE.Config.currency)
    else
        ply:ChatPrint(localization.fromServerNotification .. localization[language]['messageServer']['alreadyHaveBonus'])
    end
end)

hook.Add('PlayerSay', 'bonusMenu', bonusMenu)