Config = {}

-- Config for install file --
Config.Inventory = 'qb-inventory'
Config.ImagePath = '/html/images/'
-- ----------------------- --

Config.Items = {
    cigarette = {
        name = 'cigarette',
        label = 'Cigarette',
        weight = 1,
        type = 'item',
        image = 'cigarette.png',
        useable = true,
        unique = true,
        shouldClose = true,
        combinable = nil,
        description = '',
        stress = math.random(1, 10) * -1,
        emoteName = 'smoke3',
        canCancel = false,
        canWalk = true,
        timeLength = Config.Items.cigarette.stress * -1, -- in seconds
        amountUsed = 100,
        progressLabel = 'Smoking a cigarette'
    },
    vape = {
        name = 'vape',
        label = 'Disposable Vape',
        weight = 1,
        type = 'item',
        image = 'vape.png',
        useable = true,
        unique = true,
        shouldClose = true,
        combinable = nil,
        description = '',
        stress = math.random(1, 2) * -1,
        emoteName = '',
        canCancel = false,
        canWalk = true,
        timeLength = Config.Items.vape.stress * -1, -- in seconds
        amountUsed = 1,
        progressLabel = 'Hitting a Vape'
    },
    diary = {
        name = 'diary',
        label = 'Blank Diary',
        weight = 1,
        type = 'item',
        image = 'diary.png',
        useable = true,
        unique = true,
        shouldClose = true,
        combinable = nil,
        description = '',
        stress = math.random(10, 30) * -1,
        emoteName = 'notepad',
        canCancel = true,
        canWalk = true,
        timeLength = Config.Items.diary.stress * -1, -- in seconds
        amountUsed = 50,
        progressLabel = 'Writing in Diary'
    },
    book = {
        name = 'book',
        label = 'Novel',
        weight = 1,
        type = 'item',
        image = 'novel.png',
        useable = true,
        unique = true,
        shouldClose = true,
        combinable = nil,
        description = '',
        stress = -10,
        emoteName = 'book',
        canCancel = true,
        canWalk = true,
        timeLength = 10, -- in seconds
        amountUsed = 10,
        progressLabel = 'Reading a Chapter'
    },
}