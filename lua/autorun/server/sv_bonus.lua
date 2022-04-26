util.AddNetworkString('GiveBonus')
util.AddNetworkString('OpenMenu')

local function bonusMenu(ply, text)
    if (string.Trim(string.lower(text)) == '!bonus') then
        net.Start('OpenMenu')
        net.Send(ply)
    end
end

net.Receive('GiveBonus', function(len, ply)
    local steamid = ply:SteamID()

    math.randomseed(os.time() + os.clock())
    local amount = math.random(bonus.moneyAmount.minAmount, bonus.moneyAmount.maxAmount)
    local existPlayer = sql.QueryValue('SELECT * FROM bonusPlayers WHERE steamID = "' .. steamid .. '"')

    if (!existPlayer) then
        sql.Query('INSERT INTO bonusPlayers VALUES("' .. steamid .. '", "' .. amount .. '")')
        ply:addMoney(amount)
        ply:ChatPrint(bonus.localization.fromServerNotification .. bonus.localization[bonus.language]['messageServer']['youRecieve'] .. amount .. GAMEMODE.Config.currency)
    else
        ply:ChatPrint(bonus.localization.fromServerNotification .. bonus.localization[bonus.language]['messageServer']['alreadyHaveBonus'])
    end
end)

hook.Add('PlayerSay', 'bonusMenu', bonusMenu)