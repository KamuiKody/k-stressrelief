Config = {}

-- To chang the notify go to the top of the client file find 'change notify here', i tried to set it up so you could use different notify systems easily

-- Config for install file --
Config.Inventory = 'qb-inventory' -- inventory folder name
Config.ImagePath = '/html/images/' -- path from within the inventory folder
-- ----------------------- --

Config.Items = {
    cigarette = {
        name = 'cigarette', -- item name
        label = 'Cigarette', -- item label
        weight = 1, -- item weight
        type = 'item', -- item type
        image = 'cigarette.png', --item image
        useable = true, -- item can be used
        unique = true, -- item can be stacked
        shouldClose = true, -- should close inventory on use
        combinable = nil, -- can be combined with another item
        description = '', -- item description
        stress = math.random(1, 10) * -1, -- the amount of stress added from using the item (make negative to subtract stress like I have it in the example)
        emoteName = 'smoke3', -- name of the emote used (this is made for dp or rpemotes any other emote menu you will have to find the 'change emote event here' on the client and change to your event/export)
        canCancel = false, -- can cancel the action, won't remove the item or effect stress
        canWalk = true, -- can walk while using emote, don't think this works with all scenarios
        timeLength = math.random(1, 10), -- in seconds for how long the progressbar runs
        amountUsed = 100, -- percentage of the item used each time the emote is ran
        progressLabel = 'Smoking a cigarette' -- label of the progressbar that is seen on uses
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
        timeLength = math.random(1, 2), -- in seconds
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
        timeLength = math.random(10, 30), -- in seconds
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
