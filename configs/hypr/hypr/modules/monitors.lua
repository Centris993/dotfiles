------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "DP-4",
    mode     = "preferred",
    position = "auto",
    scale    = "1.25",
})

hl.monitor({
    output   = "HDMI-A-2",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

hl.config({
  xwayland = {
    force_zero_scaling = true
  }
})

