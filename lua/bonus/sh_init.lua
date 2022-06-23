BONUS = {}

BONUS.language = 'en'
BONUS.SystemName = '[Bonus] '

BONUS.money = {
    min = 5000,
    max = 60000
}

local SystemName = BONUS.SystemName
BONUS.localization = {
    ['ru'] = {
        Title = 'Бонус',
        SubTitle = 'Получи свой бонус!',
        Description = 'Рандомное количество денег',
        Button = 'Получить бонус',
        ChatMessage = {
            alreadyHaveBonus = SystemName .. 'Вы уже получили свой бонус!',
            youRecieve = SystemName .. 'Вы получили %s.',
            errorGamemode = SystemName .. 'Bonus-System работает только на DarkRP, но не на %s.'
        }
    },
    ['en'] = {
        Title = 'Bonus',
        SubTitle = 'Get your bonus!',
        Description = 'Random amount of money',
        Button = 'Get bonus',
        ChatMessage = {
            alreadyHaveBonus = SystemName .. 'You already have your bonus!',
            youRecieve = SystemName .. 'You recieve %s.',
            errorGamemode = SystemName .. 'Bonus-System only works on DarkRP, not %s.'
        }
    }
}