hl.monitor({
    output   = "HDMI-A-5",
    mode     = "1920x1080@100.00Hz",
    position = "0x0",
    scale    = "1"
})

hl.monitor({
    output   = "DP-3",
    mode     = "1920x1080@100.00Hz",
    position = "1920x0",
    scale    = "1"
})

hl.monitor({
    output    = "HDMI-A-1",
    mode      = "480x800@62.29Hz",
    position  = "2880x1080",
    scale     = "1",
    transform = 1
})

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
