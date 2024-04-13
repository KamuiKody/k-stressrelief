fx_version 'cerulean'
game 'gta5'

name 'k-stressrelief'
author 'kamui kody'
description 'fivem resource for removing stress   "Created Using Kamui Kody\'s Boilerplate"'


shared_scripts {
   '@qb-core/shared/locale.lua',
   'locales/en.lua',
   'locales/*.lua',
   'shared/*.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'install_file.lua',
    'server/*.lua'
}

lua54 'yes'
