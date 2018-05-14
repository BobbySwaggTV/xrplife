--[[
    Scripted By: Xander1998 (X. Cross)
    Version: 1.0
--]]

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
resource_type 'gametype' { name = 'XRPLife' }

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----[[ DEPENDENCIES ]]-----
--------------------------------------------------------------------------------------------------------------------------------------------------------
dependencies {
    "externalsql"
}
--------------------------------------------------------------------------------------------------------------------------------------------------------
-----[[ NUI FILES ]]-----
--------------------------------------------------------------------------------------------------------------------------------------------------------
ui_page "ui/index.html"
files {
    -- UI Page
    "ui/index.html",

    -- Libraries
    "ui/libraries/js/axios.min.js",
    "ui/libraries/js/vue.min.js",
    "ui/libraries/js/vuetify.js",
    "ui/libraries/css/vuetify.css",

    -- Javascript
    "ui/scripts/js/helpers.js",
    "ui/scripts/js/listener.js",
    "ui/scripts/js/charactermenu.js",
    "ui/scripts/js/atmmenu.js",

    -- CSS
    "ui/css/charactermenu.css",
    "ui/css/atmmenu.css"
}

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----[[ HELPER FILES ]]-----
--------------------------------------------------------------------------------------------------------------------------------------------------------
server_script "helpers/server.lua"
client_script "helpers/client.lua"

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----[[ CONFIG FILES ]]-----
--------------------------------------------------------------------------------------------------------------------------------------------------------
server_script "config/base.lua"
server_script "config/server.lua"
server_script "config/admin.lua"
server_script "config/character.lua"
server_script "config/database.lua"

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----[[ TABLE FILES ]]-----
--------------------------------------------------------------------------------------------------------------------------------------------------------
server_script "tables/base.lua"
server_script "tables/players.lua"
server_script "tables/characters.lua"

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----[[ DATABASE FILES ]]-----
--------------------------------------------------------------------------------------------------------------------------------------------------------
server_script "database/base.lua"
server_script "database/player.lua"
server_script "database/character.lua"
server_script "database/clothing.lua"

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----[[ SERVER SCRIPTS ]]-----
--------------------------------------------------------------------------------------------------------------------------------------------------------

--[[ Framework Scripts ]]--
server_script "start.lua"

--[[ Chat ]]--
server_script "scripts/chat/server.lua"
server_script "scripts/chat/commands.lua"

--[[ UI Scripts ]]--
server_script "ui/scripts/lua/character_menu/server.lua"
server_script "ui/scripts/lua/atm_menu/server.lua"

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----[[ CLIENT SCRIPTS ]]-----
--------------------------------------------------------------------------------------------------------------------------------------------------------

--[[ Framework Scripts ]]--
client_script "fivem.lua"

--[[ Chat ]]--
client_script "scripts/chat/client.lua"

--[[ UI Scripts ]]--
client_script "ui/scripts/lua/character_menu/client.lua"
client_script "ui/scripts/lua/character_menu/skycam.lua"
client_script "ui/scripts/lua/atm_menu/client.lua"