from libqtile import bar, widget
from libqtile.config import Screen
from colors import colors

screens = [
    Screen(
        top=bar.Bar(
            widgets=[
                widget.GroupBox(
                    active=colors["fg_1"],
                    highlight_method="text",
                ),
                widget.Spacer(),
                widget.Chord(
                    chords_colors={
                        "launch": (colors["bg_0"], colors["fg_3"]),
                        "config": (colors["bg_0"], colors["fg_3"]),
                        "open": (colors["bg_0"], colors["fg_3"]),
                        "emacs": (colors["bg_0"], colors["fg_3"]),
                    },
                    name_transform=lambda name: name.lower() + "  ",
                ),
                # NB Systray is incompatible with Wayland,
                # consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(
                    format="%I:%M %p",
                    foreground=colors["fg_3"],
                ),
                widget.Spacer(),
                widget.CurrentLayout(
                    foreground=colors["fg_1"],
                ),
                widget.Spacer(10),
                widget.Battery(
                    foreground=colors["fg_1"], format="{char} {percent:2.0%}"
                ),
                widget.Spacer(length=10),
                widget.PulseVolume(
                    update_interval=0.1,
                    foreground=colors["fg_2"],
                ),
                widget.Memory(
                    foreground=colors["fg_1"],
                    format="{MemUsed: .0f}{mm}",
                ),
                widget.Spacer(length=10),
            ],
            size=35,
            background=colors["bg_0"],
        ),
    ),
]
