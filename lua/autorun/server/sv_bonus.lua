util.AddNetworkString('GiveBonus')
util.AddNetworkString('OpenMenu')

local function bonusMenu(ply, text)
    if (string.lower(text) == '!bonus') then
        net.Start('OpenMenu')
        net.Send(ply)
    end
end

net.Receive('GiveBonus', function(len, ply)
    if(!file.IsDir('bonus/'..ply:SteamID64(), 'DATA')) then
        local amount = math.random(bonus.moneyAmount.minAmount, bonus.moneyAmount.maxAmount)
        file.CreateDir('bonus/'..ply:SteamID64())
        ply:addMoney(amount)
        ply:ChatPrint('[Bonus] Вы получили '..amount..'$')
        print('[Bonus] '..ply:Nick()..' только что получил '..amount..'$')
    else
        ply:ChatPrint('[Bonus] Вы уже получили свой бонус!')
    end
end)

hook.Add('PlayerSay', 'bonusMenu', bonusMenu)