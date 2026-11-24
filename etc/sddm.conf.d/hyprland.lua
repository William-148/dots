hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = "1.25",
})

hl.config({
	input = {
		kb_layout = "us,latam",
		kb_variant = "altgr-intl,",
		kb_model = "pc105",
		kb_options = "grp:alt_shift_toggle,caps:escape,shift:both_capslock",
		kb_rules = "",

		follow_mouse = 1,
		off_window_axis_events = 2,

		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
			clickfinger_behavior = true,
		},
	},
	decoration = {
		blur = {
			enabled = false,
		},
		shadow = {
			enabled = false,
		},
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},
})
