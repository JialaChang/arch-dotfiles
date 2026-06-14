-- open wofi
hl.bind("SUPER + space", hl.dsp.exec_cmd("wofi --show drun"))
-- open firefox
hl.bind("SUPER + B", hl.dsp.exec_cmd("firefox"))
-- full-screen screenshot
hl.bind("SUPER + S", hl.dsp.exec_cmd("grim ~/Pictures/$(date +%Y%m%d_%H%M%S).png"))
-- select area screeshot
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/$(date +%Y%m%d_%H%M%S).png"))
