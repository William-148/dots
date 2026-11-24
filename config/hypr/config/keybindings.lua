-- ########################################################
-- ░█░█░█▀▀░█░█░█▀▄░▀█▀░█▀█░█▀▄░▀█▀░█▀█░█▀▀░█▀▀
-- ░█▀▄░█▀▀░░█░░█▀▄░░█░░█░█░█░█░░█░░█░█░█░█░▀▀█
-- ░▀░▀░▀▀▀░░▀░░▀▀░░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░▀▀▀░▀▀▀
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
-- ########################################################
local programs = require("config.default-programs")
local workspaces = require("utils.workspaces")
local windows = require("utils.windows")
local screenshot = require("utils.screenshot")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local movement_keys = {
	{ key = "UP", direction = "up" },
	{ key = "DOWN", direction = "down" },
	{ key = "LEFT", direction = "left" },
	{ key = "RIGHT", direction = "right" },
}

-- G E N E R A L   B I N D S ###############################
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("uwsm stop"), { locked = true })
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(programs.terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(programs.menu))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(programs.browser))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("Scroll_Lock", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd(programs.logout))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprpicker -a")) -- Open color picker

-- W A L L P A P E R #######################################
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("waypaper"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("waypaper --random"))

-- W I N D O W S ###########################################
hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + C", hl.dsp.window.center())
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen())

-- Move, resize and drag
for _, bind in ipairs(movement_keys) do
	hl.bind(mainMod .. " + " .. bind.key, hl.dsp.focus({ direction = bind.direction }))
	hl.bind(mainMod .. " + SHIFT + " .. bind.key, hl.dsp.window.move({ direction = bind.direction }))
end

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- To switch between windows in a floating workspace:
hl.bind(mainMod .. " + TAB", hl.dsp.window.cycle_next()) -- Change focus to another window
hl.bind(mainMod .. " + TAB", hl.dsp.window.bring_to_top()) -- Bring it to the top

-- Window split ratio (change windows area size)
hl.bind(mainMod .. " + SEMICOLON", function() -- [;]
	windows.adjustSize("-0.1")
end)
hl.bind(mainMod .. " + APOSTROPHE", function() -- [']
	windows.adjustSize("+0.1")
end)

-- Hide desktop windows
hl.bind(mainMod .. " + D", workspaces.toggle_active)
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.workspace.toggle_special("desktop"))

-- W O R K S P A C E S #####################################
for i = 1, 5 do
	local key = i % 10
	-- Switch with: maindMod + [0 - 9]
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))

	-- Move active windows to workspace with: maindMod + SHIFT + [0 - 9]
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))

	-- Move active windows to workspace, in silent mode; with: maindMod + CONTROL + [0 - 9]
	hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + CONTROL + S", hl.dsp.window.move({ workspace = "special:magic", silent = true }))

-- M U L T I   M E D I A   K E Y S #########################
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.local/bin/volume 2%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.local/bin/volume 2%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.local/bin/audio-mute"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("~/.local/bin/play-pause"), { locked = true })

-- Brightness binds
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.local/bin/brightness +1%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.local/bin/brightness 1%-"), { locked = true, repeating = true })

-- S C R E E N S H O T #####################################
hl.bind("PRINT", screenshot.desktop)
hl.bind("SHIFT + PRINT", screenshot.window)
hl.bind("CONTROL + PRINT", screenshot.region)
