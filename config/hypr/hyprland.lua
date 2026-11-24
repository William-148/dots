----------------------------------------------------------
-- ░█░█░█░█░█▀█░█▀▄░█░░░█▀█░█▀█░█▀▄░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░█░█░█▀▄░█▀█░▀█▀░▀█▀░█▀█░█▀█
-- ░█▀█░░█░░█▀▀░█▀▄░█░░░█▀█░█░█░█░█░░░█░░░█░█░█░█░█▀▀░░█░░█░█░█░█░█▀▄░█▀█░░█░░░█░░█░█░█░█
-- ░▀░▀░░▀░░▀░░░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀░░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀
----------------------------------------------------------

-- D E F A U L T   P R O G R A M S
-- Default programs are set in "config/default-programs.lua"

-- E N V I R O N M E N T   V A R I A B L E S
-- If the environment variables are managed by uwsm, you can find them
-- in the "env" and "env-hyprland" files inside the "~/.config/uwsm/" directory,
-- and you can comment the source line below.
-- require("config.env-variables")

-- C O N F I G U R A T I O N
require("config.monitors")
require("config.autostart")
require("config.layout")
require("config.appearance")
require("config.animations")
require("config.misc")
require("config.input")
require("config.keybindings")
require("config.rules")
require("config.permissions")
