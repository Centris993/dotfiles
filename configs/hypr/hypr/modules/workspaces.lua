--binds the workspaces to the monitor
local workspace_monitors = {
    { first = 1, last = 5, monitor = "DP-4" },
    { first = 6, last = 10, monitor = "HDMI-A-2" },
}

for _, group in ipairs(workspace_monitors) do
    for i = group.first, group.last do
        hl.workspace_rule({
            workspace = tostring(i),
            monitor = group.monitor,
        })
    end
end