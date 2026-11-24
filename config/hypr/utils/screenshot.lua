local M = {}

function M.desktop()
  hl.dispatch(hl.dsp.exec_cmd(
    'grim - | wl-copy && notify-send -u low "Screenshot" "Screenshot copied to the clipboard"'
  ))
end

function M.window()
  local active_workspace = hl.get_active_workspace()
  if not active_workspace then return end

  local windows = hl.get_workspace_windows(active_workspace.name)
  if #windows == 0 then
    hl.dispatch(hl.dsp.exec_cmd('notify-send -u low "Window Screenshot" "No windows found"'))
    return
  end

  local regions = {}
  for _, win in ipairs(windows) do
    table.insert(regions, string.format(
      "%d,%d %dx%d",
      win.at.x,
      win.at.y,
      win.size.x,
      win.size.y
    ))
  end

  hl.dispatch(hl.dsp.exec_cmd(string.format([[
    sh -c '
      region=$(printf "%%b" "%s" | slurp -w 0 )

      [ -z "$region" ] && exit 0

      grim -g "$region" - | wl-copy &&
      notify-send -u low "Window Screenshot" "Screenshot copied to the clipboard"
    '
    ]],
    table.concat(regions, "\\n")
  )))
end

function M.region()
  hl.dispatch(hl.dsp.exec_cmd([[
    sh -c '
      region=$(slurp)

      [ -z "$region" ] && exit 0

      grim -g "$region" - | wl-copy &&
      notify-send -u low "Region Screenshot" "Screenshot copied to the clipboard"
    '
  ]]))
end

return M
