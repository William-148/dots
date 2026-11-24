local M = {}

-- Layout dispatcher mapping
local LAYOUT_DISPATCHERS = {
	dwindle = "splitratio",
	master = "mfact",
	scrolling = "colresize",
}

--- Adjusts the size of the active window according to the current layout.
---
--- Supported layouts:
---   - dwindle: Adjusts the split ratio.
---   - master: Adjusts the master area factor.
---   - scrolling: Adjusts the active column width.
---
--- @param delta string Resize amount (e.g. "+0.1" or "-0.1").
--- @return nil
function M.adjustSize(delta)
	local workspace = hl.get_active_workspace()
	if not workspace then
		return
	end

	local dispatcher = LAYOUT_DISPATCHERS[workspace.tiled_layout]
	if not dispatcher then
		return
	end

	hl.dispatch(hl.dsp.layout(dispatcher .. " " .. delta))
end

return M
