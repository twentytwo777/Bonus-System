-- Created by twenty two

// Если вы хотите заменить кол-во денег, то смотрите файл bonus_cfg.lua
// Если вам не нужно/вы не используете EPOE, то строчки с print вы можете удалить или закомментировать.

// Network for give bonus
util.AddNetworkString('GiveBonus')

net.Receive('GiveBonus', function(len, ply)
    if(!file.IsDir("bonus/"..ply:SteamID64(), "DATA")) then
        file.CreateDir("bonus/"..ply:SteamID64())
        ply:addMoney(bonus.moneygive)
        ply:ChatPrint('[Bonus] Вы получили '..bonus.moneygive..'$')
        print('[Bonus] '..ply:Nick()..' только что получил '..bonus.moneygive..'$')
    else
        ply:ChatPrint('[Bonus] Вы уже получили свой бонус!')
    end
end)