fx_version   'cerulean'
use_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'
name         'groups'
author 		 'morti#0685'
description  'Groups system.'
ui_page 'web/build/index.html'
client_scripts {
  'client/main.lua',
  'client/client.lua',
  'client/events.lua',
  'client/utils.lua'
}
server_scripts {
  '@oxmysql/lib/MySQL.lua',
	'@es_extended/imports.lua',
  'server/main.lua',
  'server/server.lua',
  'server/commands.lua'
}
shared_script 'config.lua'
files {
  'web/build/index.html',
  'web/build/**/*'
}