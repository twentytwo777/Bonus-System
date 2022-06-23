util.AddNetworkString('bonus.giveBonus')

local localization = BONUS.localization
local language = BONUS.language
local translation = localization[language]
local ChatMessage = translation.ChatMessage

local money = BONUS.money

local function bonusGive(len, ply)
    if not BONUS:InitializeGamemode() then
        return ply:ChatPrint(string.format(ChatMessage.errorGamemode, BONUS:CurrentGamemode()))
    end

    local player = ply:SteamID64()
    local amount = math.random(money.min, money.max)
    local currency = GAMEMODE.Config.currency
    local amcurr = amount .. currency
    local existPlayer = sql.QueryValue('SELECT * FROM bPl WHERE steamID = "' .. player .. '"')

    if not existPlayer then
        sql.Query('INSERT INTO bPl VALUES("' .. player .. '", "' .. amount .. '")')
        ply:addMoney(amount)

        return ply:ChatPrint(string.format(ChatMessage.youRecieve, amcurr))
    end

    return ply:ChatPrint(ChatMessage.alreadyHaveBonus)
end

net.Receive('bonus.giveBonus', bonusGive)