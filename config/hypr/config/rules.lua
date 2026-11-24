-- ########################################################
-- ░█░█░▀█▀░█▀█░█▀▄░█▀█░█░█░░░█▀█░█▀█░█▀▄
-- ░█▄█░░█░░█░█░█░█░█░█░█▄█░░░█▀█░█░█░█░█
-- ░▀░▀░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░░░▀░▀░▀░▀░▀▀░
-- ░█░█░█▀█░█▀▄░█░█░█▀▀░█▀█░█▀█░█▀▀░█▀▀░░░█▀▄░█░█░█░░░█▀▀░█▀▀
-- ░█▄█░█░█░█▀▄░█▀▄░▀▀█░█▀▀░█▀█░█░░░█▀▀░░░█▀▄░█░█░█░░░█▀▀░▀▀█
-- ░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░░░▀░▀░▀▀▀░▀▀▀░░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- ########################################################

-- G E N E R A L   R U L E S
hl.window_rule({ match = { class = ".*" }, center = true })
hl.window_rule({ match = { float = true }, min_size = { 200, 100 } })

-- local suppressMaximizeRule =
hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- S P E C I F I C   R U L E S
hl.window_rule({ match = { class = "^(dev\\.zed\\.Zed)$" }, opacity = "0.9 0.9" })
hl.window_rule({ match = { class = "^(mpv)$" }, float = true })
hl.window_rule({ match = { class = "^(org\\.gnome\\.Loupe)$" }, float = true })
hl.window_rule({ match = { class = "^(waypaper)$" }, float = true, size = { "monitor_w * 0.55", "monitor_h * 0.7" } })
hl.window_rule({ match = { class = "^(org\\.kde\\.dolphin)$" }, float = true, size = { 800, 560 } })
hl.window_rule({ match = { class = "^[Ww]aydroid.*" }, fullscreen = true })
hl.window_rule({ match = { class = "^(com\\.saivert\\.pwvucontrol)$" }, float = true })
hl.window_rule({ match = { class = "^(nwg-look|qt[56]ct|kvantummanager)$" }, float = true })
hl.window_rule({ name = "zen_starting_width", match = { class = "zen" }, scrolling_width = 1.0 })

hl.window_rule({
	match = { class = "^(com\\.github\\.wwmm\\.easyeffects)$" },
	float = true,
	size = { 1300, 800 },
})
hl.window_rule({
	match = { class = "^com\\.github\\.th-ch\\.youtube-music*" },
	float = true,
	size = { 1500, 800 },
})

-- D I A L O G S
hl.window_rule({
	match = { class = "^(org\\.freedesktop\\.impl\\.portal\\.desktop\\.kde)$" },
	float = true,
	center = true,
	size = { "monitor_w * 0.55", "monitor_h * 0.5" },
})
hl.window_rule({
	match = { initial_title = "^(Open|Save|Select)\\s(As|File|folder).*" },
	float = true,
	center = true,
	size = { "monitor_w * 0.55", "monitor_h * 0.5" },
})

hl.window_rule({
	name = "picture_in_picture",
	match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
	float = true,
	move = { "monitor_w*.73", "monitor_h*.72" },
	size = { "monitor_w*.3", "monitor_h*.3" },
})

-- W O R K S P A C E S   R U L E S
hl.workspace_rule({
	workspace = "1",
	layout = "scrolling",
	layout_opts = { direction = "right" },
})

-- L A Y E R   R U L E S
hl.layer_rule({
	name = "rofi_layer",
	match = { namespace = "rofi" },
	blur = true,
	ignore_alpha = 0,
	animation = "slide left",
})

hl.layer_rule({
	name = "wlogout_layer",
	match = { namespace = "logout_dialog" },
	blur = false,
	animation = "fadeLayers",
})

hl.layer_rule({
	name = "notification_layer",
	match = { namespace = "notifications" },
	blur = true,
	animation = "slide right",
})
