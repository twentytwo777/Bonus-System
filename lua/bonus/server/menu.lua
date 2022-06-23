util.AddNetworkString('bonus.openMenu')

local function bonusMenu(ply, text)
    if (string.Trim(string.lower(text)) == '!bonus') then
        net.Start('bonus.openMenu')
        net.Send(ply)
    end
end

hook.Add('PlayerSay', 'bonusMenu', bonusMenu)