--[[
    Scripted By: Xander1998 (X. Cross)
    Version: 1.0
--]]

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
resource_type 'gametype' { name = 'XRPLife' }

---------------------------------------------------------------------------
-- DEPENDENCIES
---------------------------------------------------------------------------
dependencies {
    "externalsql"
}

---------------------------------------------------------------------------
-- NUI
---------------------------------------------------------------------------
ui_page "ui/index.html"
files {
    ---------------------------------------------------------------------------
    -- Main UI Page
    ---------------------------------------------------------------------------
    "ui/index.html",

    ---------------------------------------------------------------------------
    -- JS LIBRARIES
    ---------------------------------------------------------------------------

    -- Axios HTTP Library
    "ui/libraries/js/axios.min.js",

    -- VueJS Library
    "ui/libraries/js/vue.min.js",

    -- Vuetify Library
    "ui/libraries/js/vuetify.js",

    -- Notification Library
    "ui/libraries/js/vue-snotify.min.js",

    ---------------------------------------------------------------------------
    -- CSS LIBRARIES
    ---------------------------------------------------------------------------

    -- Vuetify Library
    "ui/libraries/css/vuetify.css",

    -- Notification Library
    "ui/libraries/css/material.css",

    ---------------------------------------------------------------------------
    -- SOUND FILES
    ---------------------------------------------------------------------------

    -- Admin Menu Sounds
    "ui/sounds/stairs.ogg",

    ---------------------------------------------------------------------------
    -- IMAGE FILES
    ---------------------------------------------------------------------------

    ---------------------------------------------------------------------------
    -- JS SCRIPTS
    ---------------------------------------------------------------------------

    -- NUI JS Helpers
    "ui/scripts/js/helpers.js",

    -- NUI Listener
    "ui/scripts/js/listener.js",

    -- NUI Notifications
    "ui/scripts/js/notification.js",

    -- NUI Character Menu
    "ui/scripts/js/charactermenu.js",

    -- NUI ATM Menu
    "ui/scripts/js/atmmenu.js",

    -- NUI Admin Menu
    "ui/scripts/js/adminmenu.js",

    ---------------------------------------------------------------------------
    -- CSS SCRIPTS
    ---------------------------------------------------------------------------

    -- NUI Notifications
    "ui/css/notification.css",

    -- NUI Character Menu
    "ui/css/charactermenu.css",

    -- NUI ATM Menu
    "ui/css/atmmenu.css",

    -- NUI Admin Menu
    "ui/css/adminmenu.css",
}

---------------------------------------------------------------------------
-- HELPERS
---------------------------------------------------------------------------

-- Server Helper Functions
server_script "helpers/server.lua"

-- Client Helper Functions
client_script "helpers/client.lua"

---------------------------------------------------------------------------
-- CONFIG
---------------------------------------------------------------------------

-- Base Script
server_script "config/base.lua"

-- Server Config
server_script "config/server.lua"

-- Admin Config
server_script "config/admin.lua"

-- Character Config
server_script "config/character.lua"

-- Database Config
server_script "config/database.lua"

-- Weather Config
server_script "config/weather.lua"

-- Time Config
server_script "config/time.lua"

-- Inventory Config
server_script "config/inventory.lua"

---------------------------------------------------------------------------
-- TABLES
---------------------------------------------------------------------------

-- Base Script
server_script "tables/base.lua"

-- Player Data Table
server_script "tables/players.lua"

-- Character Data Table
server_script "tables/characters.lua"

-- Inventory Data Table
server_script "tables/inventory.lua"

---------------------------------------------------------------------------
-- DATABASE
---------------------------------------------------------------------------

-- Base Script
server_script "database/base.lua"

-- Player Database
server_script "database/player.lua"

-- Character Database
server_script "database/character.lua"

-- Character Clothing Database
server_script "database/clothing.lua"

-- Inventory Database
server_script "database/inventory.lua"

---------------------------------------------------------------------------
-- SERVER SCRIPTS
---------------------------------------------------------------------------

-- Server Starter Script
server_script "start.lua"

-- Server Chat Handler
server_script "scripts/chat/server.lua"
server_script "scripts/chat/commands.lua"

-- Server Weather Handler
server_script "scripts/weathersync/server.lua"

-- Server Time Handler
server_script "scripts/timesync/server.lua"

---------------------------------------------------------------------------
-- SERVER UI SCRIPTS
---------------------------------------------------------------------------

-- Server Character Scripts
server_script "ui/scripts/lua/character_menu/server.lua"

-- Server ATM Scripts
server_script "ui/scripts/lua/atm_menu/server.lua"

-- Server Admin Scripts
server_script "ui/scripts/lua/admin_menu/server.lua"

-- Server Inventory Scripts
server_script "ui/scripts/lua/inventory/server.lua"

---------------------------------------------------------------------------
-- CLIENT SCRIPTS
---------------------------------------------------------------------------

-- Client Starter Script
client_script "fivem.lua"

-- Client Chat Handler
client_script "scripts/chat/client.lua"

-- Client Weather Handler
client_script "scripts/weathersync/client.lua"

-- Client Time Handler
client_script "scripts/timesync/client.lua"

-- Client Debug Handler
client_script "scripts/debug/client.lua"

---------------------------------------------------------------------------
-- CLIENT UI SCRIPTS
---------------------------------------------------------------------------

-- Client Notification Scripts
client_script "ui/scripts/lua/notification/client.lua"

-- Client Character Scripts
client_script "ui/scripts/lua/character_menu/client.lua"
client_script "ui/scripts/lua/character_menu/skycam.lua"

-- Client ATM Scripts
client_script "ui/scripts/lua/atm_menu/client.lua"

-- Client Admin Scripts
client_script "ui/scripts/lua/admin_menu/client.lua"

-- Client Inventory Scripts
client_script "ui/scripts/lua/inventory/client.lua"
client_script "ui/scripts/lua/inventory/weapons.lua"