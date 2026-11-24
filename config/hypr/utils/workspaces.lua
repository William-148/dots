local M = {}

---@class HiddenWorkspace
---@field name string
---@field active_window string|nil
---@field windows string[]

---@type table<string, HiddenWorkspace|nil>
local HIDDEN_WORKSPACES = {}

local function log(content)
	hl.notification.create({
		text = content,
		color = "rgb(ff1ea3)",
		timeout = 2000,
	})
end

--- Hide all windows in a workspace
---@param name string
local function hide_workspace(name)
	local windows = hl.get_workspace_windows(name)
	if #windows == 0 then
		return
	end

	---@type string|nil
	local active_window_address = nil
	local current_active = hl.get_active_window()
	if current_active then
		active_window_address = current_active.address
	end

	---@type string[]
	local windows_address = {}
	for _, win in ipairs(windows) do
		table.insert(windows_address, win.address)

		hl.dispatch(hl.dsp.window.move({
			workspace = "special:desktop",
			window = "address:" .. win.address,
			follow = false,
		}))
	end

	HIDDEN_WORKSPACES[name] = {
		name = name,
		active_window = active_window_address,
		windows = windows_address,
	}
end

--- Show all hidden windows in a workspace
---@param hidden_workspace HiddenWorkspace
local function show_hidden_workspace(hidden_workspace)
	for _, address in ipairs(hidden_workspace.windows) do
		hl.dispatch(hl.dsp.window.move({
			workspace = hidden_workspace.name,
			window = "address:" .. address,
			follow = false,
		}))
	end

	local active_window = hidden_workspace.active_window
	if active_window then
		hl.dispatch(hl.dsp.focus({ window = "address:" .. active_window }))
	end

	log("Workspace " .. hidden_workspace.name .. ": Windows restored")
	HIDDEN_WORKSPACES[hidden_workspace.name] = nil
end

-- Hide or show all windows in the active workspace
function M.toggle_active()
	local active_workspace = hl.get_active_workspace()
	if not active_workspace then
		return
	end
	local hidden_workspace = HIDDEN_WORKSPACES[active_workspace.name]

	if not hidden_workspace then
		hide_workspace(active_workspace.name)
	else
		show_hidden_workspace(hidden_workspace)
	end
end

return M
