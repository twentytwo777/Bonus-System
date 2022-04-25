util.AddNetworkString('GiveBonus')
util.AddNetworkString('OpenMenu')

local function bonusMenu(ply, text)
    if (string.Trim(string.lower(text)) == '!bonus') then
        net.Start('OpenMenu')
        net.Send(ply)
    end
end

net.Receive('GiveBonus', function(len, ply)
    local data = net.ReadString()
    local amount = math.random(bonus.moneyAmount.minAmount, bonus.moneyAmount.maxAmount)

    if (!file.IsDir('bonus/'..ply:SteamID64(), 'DATA')) then
        file.CreateDir('bonus/'..ply:SteamID64())
        ply:addMoney(amount)
        ply:ChatPrint(bonus.localization.fromServerNotification .. bonus.localization[bonus.language]['messageServer']['youRecieve'] .. amount .. GAMEMODE.Config.currency)
    else
        ply:ChatPrint(bonus.localization.fromServerNotification .. bonus.localization[bonus.language]['messageServer']['alreadyHaveBonus'])
    end
end)

hook.Add('PlayerSay', 'bonusMenu', bonusMenu)