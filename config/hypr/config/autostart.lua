-- ########################################################
-- ░█▀█░█░█░▀█▀░█▀█░█▀▀░▀█▀░█▀█░█▀▄░▀█▀
-- ░█▀█░█░█░░█░░█░█░▀▀█░░█░░█▀█░█▀▄░░█░
-- ░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░░▀░░▀░▀░▀░▀░░▀░
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- ########################################################

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm app -- awww-daemon")
	hl.exec_cmd("uwsm app -- easyeffects --gapplication-service")
	hl.exec_cmd("uwsm app -- ~/.local/bin/battery-level")
	hl.exec_cmd("~/.local/bin/bluetooth-startup --wait")
	hl.exec_cmd("dunst &")
end)
