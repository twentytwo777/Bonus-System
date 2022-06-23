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

BONUS.Pallete = {
    bonusBackground = Color(0, 0, 0, 200),
    bonusMenuBackground = Color(87, 88, 187, 210),
    bonusMenuTop = Color(65, 66, 144, 200),
    bonusSquares = Color(65, 66, 144, 200),

    bonusColorText = Color(255, 255, 255),
    bonusButton = Color(65, 66, 144),
    bonusButtonHover = Color(65, 66, 144, 200),

    bonusButtonClose = Color(142, 76, 118),
    bonusButtonCloseHover = Color(159, 68, 111)
}