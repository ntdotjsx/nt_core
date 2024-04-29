fx_version 'cerulean'

game 'gta5'

author 'NT DEVELOPER'

description 'NT BASE by Nutto.jsx'
version '1.0.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'core/server.lua',
	'modules/**/server/**/*.lua'
}

client_scripts {
	'core/client.lua',
	'core/export.lua',
	'modules/**/config.lua*',
	'modules/**/client/**/*.lua'
}

-- shared_scripts{
-- 	'config.lua'
-- }

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