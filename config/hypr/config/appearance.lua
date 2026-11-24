-- ######################################################
-- ░█░░░█▀█░█▀█░█░█░░░█▀█░█▀█░█▀▄░░░█▀▀░█▀▀░█▀▀░█░░
-- ░█░░░█░█░█░█░█▀▄░░░█▀█░█░█░█░█░░░█▀▀░█▀▀░█▀▀░█░░
-- ░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░▀░▀░▀░▀░▀▀░░░░▀░░░▀▀▀░▀▀▀░▀▀▀
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
-- ######################################################

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
	general = {
		gaps_in = 6,
		gaps_out = 13,

		border_size = 2,

		-- https://wiki.hypr.land/Configuring/Basics/Variables/#variable-types
		-- for info about colors
		col = {
			-- active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			-- active_border = { colors = { "rgb(E82750)", "rgb(6A0B20)", "rgb(E82750)" }, angle = 30 },
			active_border = { colors = { "rgb(FF0055)", "rgb(C80044)", "rgb(780022)" }, angle = 30 },
			-- active_border = { colors = { "rgb(FF0055)", "rgb(E82B52)" }, angle = 30 },
			-- active_border = { colors = { "rgb(F861FF)", "rgb(7F5EDF)", "rgb(1FCDE7)" }, angle = 30 },
			-- active_border = { colors = { "rgb(C4FF3C)", "rgb(5E8D14)", "rgb(A6F900)" }, angle = 30 },

			-- # col.inactive_border = rgba(595959aa),
			inactive_border = "rgba(00000000)",
		},

		-- Set to true enable resizing windows by clicking and dragging on
		-- borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,
	},

	-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
	decoration = {
		-- 2 = circle, higher = squircle, 4 = very obvious squircle
		-- Fuck clearly visible squircles. 100% Apple brainrot.
		rounding_power = 2.5,
		rounding = 18,

		blur = {
			enabled = true,

			-- xray = true,
			size = 6,
			passes = 2,
			brightness = 1,
			noise = 0.0,
			contrast = 1.0,
			vibrancy = 0.16,
			vibrancy_darkness = 0.16,
			popups = true,
			popups_ignorealpha = 0.6,
			input_methods = true,
			input_methods_ignorealpha = 0.8,

			variant = "haze",
			haze = {
				intensity = 0.6,
				iridescence = 0.8,
			},
		},
		shadow = {
			enabled = true,
			range = 20,
			offset = { 0, 2 },
			render_power = 4,
			color = "rgba(00000020)",
		},
		-- Dim
		dim_inactive = true,
		dim_strength = 0.05,
		dim_special = 0.2,
	},
})
