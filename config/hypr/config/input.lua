-- ########################################################
-- ░▀█▀░█▀█░█▀█░█░█░▀█▀░░░█▀▄░█▀▀░█░█░▀█▀░█▀▀░█▀▀░█▀▀
-- ░░█░░█░█░█▀▀░█░█░░█░░░░█░█░█▀▀░▀▄▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀▀░▀░▀░▀░░░▀▀▀░░▀░░░░▀▀░░▀▀▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
-- ########################################################

-- https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
	input = {
		kb_layout = "us,latam",
		kb_variant = "altgr-intl,",
		kb_model = "pc105",
		kb_options = "grp:alt_shift_toggle,caps:escape,shift:both_capslock",
		kb_rules = "",

		follow_mouse = 1,
		off_window_axis_events = 2,

		-- sensitivity = 0,

		touchpad = {
			natural_scroll = true,
			clickfinger_behavior = true,
		},
		-- I added this for games
		sensitivity = 1.0,
		accel_profile = "flat",
		force_no_accel = true,
	},
})

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
hl.gesture({
	fingers = 4,
	direction = "horizontal",
	action = "workspace",
})
hl.gesture({
	fingers = 4,
	direction = "vertical",
	action = "special",
	workspace_name = "magic",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
