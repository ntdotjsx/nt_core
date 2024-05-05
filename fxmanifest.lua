fx_version 'cerulean'

game 'gta5'

author 'NT DEVELOPER'

description 'NT BASE by Nutto.jsx'
version '1.1.3'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'core/server.lua',
	'modules/**/config.lua*',
	'modules/**/server/**/*.lua'
}

client_scripts {
	'core/client.lua',
	'core/export.lua',
	'modules/**/config.lua*',
	'modules/**/client/**/*.lua'
}

export {
	'CheckPolice',
	'Checkems',
	'Checkemsx',
	'CheckPolicetoscoreboard',
	'Checkambulancetoscoreboard',
	'Checkmechanictoscoreboard',
	'Checkcheftoscoreboard',
	'Checkplayerstoscoreboard'
}

-- shared_scripts{
-- 	'config.lua'
-- }