bonus = bonus or {}
bonus.language = 'en'

bonus.moneyAmount = {
    minAmount = 5000,
    maxAmount = 60000
}

bonus.localization = {
    fromServerNotification = '[Bonus] ',

    ['ru'] = {
        menuMainTitle = 'Бонус',
        menuSubTitle = 'Получи свой бонус!',
        menuDescription = 'Рандомное количество денег',
        menuButton = 'Получить бонус',
        ['messageServer'] = {
            alreadyHaveBonus = 'Вы уже получили свой бонус!',
            youRecieve = 'Вы получили '
        }
    },
    
    ['en'] = {
        menuMainTitle = 'Bonus',
        menuSubTitle = 'Get your bonus!',
        menuDescription = 'Random amount of money',
        menuButton = 'Get bonus',
        ['messageServer'] = {
            alreadyHaveBonus = 'You already have your bonus!',
            youRecieve = 'You recieve '
        }
    }
}