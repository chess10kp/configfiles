from libqtile import  layout, widget, hook, extension
from libqtile.config import ScratchPad, DropDown
from libqtile.config import Click, Drag, Group, Key, Match, Screen, KeyChord
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal



from info import HOME
import subprocess


mod = "mod4"
super = "mod4"
terminal = guess_terminal()
terminal = "xfce4-terminal"
file_browser = "kitty -1 -e 'ranger'"
editor = "nvim"

keys = [
        # at https://docs.qtile.org/en/latest/manual/config/lazy.html
        # Switch between windows
        Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
        # Key([mod], "space", lazy.layout.next(),
        #       desc="Move window focus to other window"),
        Key([mod, "control"], "h", lazy.layout.grow_left(),
            desc="Grow window to the left"),
        Key([mod, "control"], "l", lazy.layout.grow_right(),
            desc="Grow window to the right"),
        Key([mod, "control"], "j", lazy.layout.grow_down(),
            desc="Grow window down"),
        Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([super, "control"], "h", lazy.layout.shuffle_left()),
        Key([super, "control"], "l", lazy.layout.shuffle_right()),
        Key([super, "control"], "j", lazy.layout.shuffle_down()),
        Key([super, "control"], "k", lazy.layout.shuffle_up()),
        Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
        Key([mod], "d", 
            lazy.spawn(
                "dmenu_run -h 35 "
                ), desc="Run launcher"),
            Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
            Key([mod], "w", lazy.spawn("brave"), desc="Launch brave"),
            Key([mod], "e", lazy.spawn(file_browser), desc="Launch file_browser"),
            # Toggle between different layouts as defined below
            Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
            Key([mod], "f", 
                lazy.window.toggle_fullscreen(), desc="Toggle fullscreen", ),
            Key([mod], "v", lazy.window.toggle_floating(), desc="Toggle floating"),
            Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
            Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),

            Key([], "XF86AudioLowerVolume",
                lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
            Key([], "XF86AudioRaiseVolume",
                lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
            Key([], "XF86AudioMute", lazy.spawn("amixer set Master toggle")),


            # Screenshot
            Key([], "Print", 
                lazy.spawn("flameshot gui")
                ),

            # Wallpaper
            # Key([mod, "shift"], "p", 
            #     lazy.spawn("nitrogen")
            #     ),
            

            # Brightness
            Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
            Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),

            # MPD control
            Key([], "XF86AudioPlay", lazy.spawn("mpc toggle")),
            Key([], "XF86AudioPrev", lazy.spawn("mpc prev")),
            Key([], "XF86AudioNext", lazy.spawn("mpc next")),

        Key([super, "shift"], "x", lazy.spawn("shutdown now")),
    # SCRIPTS
    KeyChord([mod], "s", [
Key([], "b", lazy.spawn(f"{HOME}/.config/scripts/bookman.sh")),
Key([], "a", lazy.spawn(f"{HOME}/.config/scripts/todo")),
Key([], "v", lazy.spawn(f"{HOME}/.config/scripts/mpv.sh")),
Key([], "0", lazy.spawn(f"{HOME}/.config/scripts/dim.sh 0")),
Key([], "1", lazy.spawn(f"{HOME}/.config/scripts/dim.sh 100")),
Key([], "p", lazy.spawn(f"{HOME}/.config/scripts/passmenu.sh")),
Key([], "t", lazy.spawn(f"{HOME}/.config/scripts/timer.sh")),
Key([], "r", lazy.spawn(f"{HOME}/.config/scripts/view_reference.sh")),
Key([], "n", lazy.spawn(
    [f"{HOME}/.config/scripts/editconfig.sh", f"{HOME}/projects/notes"]
    )),
Key([], "q", lazy.spawn(f"{HOME}/.config/scripts/power.sh")),
Key([], "w", lazy.spawn(f"{HOME}/.config/scripts/web.sh")),
        ],
             mode = False, 
             name = "scripts",),
    # EDIT CONFIG
    KeyChord([mod], "c", [
        Key([], "q", lazy.spawn(
            f"{terminal} -e '{editor} {HOME}/.config/qtile/config.py'")),
        Key([], "p", lazy.spawn
            (f"{terminal} -e '{editor} {HOME}/.config/picom/picom.conf'")),
         Key([], "n", lazy.spawn
            (f"{terminal} -e '{editor} {HOME}/.config/nvim/init.lua'")),
        ],
             mode = False,
             name = "config"),

]

groups = [
        Group(i) for i in "123456789"
        ]


for i in groups:
    keys.extend(
            [
                Key(
                    [mod],
                    i.name,
                    lazy.group[i.name].toscreen(),
                    desc="Switch to group {}".format(i.name),
                    ),
                Key(
                    [mod, "shift"],
                    i.name,
                    lazy.window.togroup(i.name, switch_group=True),
                    desc="Switch to & move focused window to group {}"
                    .format(i.name),
                    ),
                ]
            )

layouts = [
        layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=2),
        layout.Max(),
        # layout.Floating(),
        # layout.Stack(num_stacks=2),
        # layout.Bsp(),
        # layout.Matrix(),
        # layout.MonadTall(),
        # layout.MonadWide(),
        # layout.RatioTile(),
        # layout.Tile(
        #     border_focus = "#ff0000"
        #     ),
        # layout.TreeTab(),
        # layout.VerticalTile(),
        # layout.Zoomy(),
        ]

widget_defaults = dict(
        font="Terminess Nerd Font Mono",
        fontsize=14,
        padding=3,
        )
extension_defaults = widget_defaults.copy()

from bar import screens
# Drag floating layouts.
mouse = [
        Drag([mod], "Button3", lazy.window.set_position_floating(), 
             start=lazy.window.get_position()),
        Drag([mod], "Button1", lazy.window.set_size_floating(), 
             start=lazy.window.get_size()),
        Click([mod], "Button2", lazy.window.bring_to_front()),
        ]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(border_width = 0,
                                  float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(wm_class="pavucontrol"),  # ssh-askpass
        Match(title="branchdialog"),
        Match(title="Open File"),
        Match(title="Save File"),
        Match(wm_class="nitrogen"),
        Match(title="Picture in picture"),
        Match(title="blueman-mananger"),
        Match(title="xdg-desktop-portal-gtk"),
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

wmname = "LG3D"

# SCRATCHPAD
groups.append(
    ScratchPad("scratchpad",
                    dropdowns = [
                        # Drop down terminal with tmux session
                        DropDown("term",
                            ["kitty"],
                            opacity = 1,
                                 x = 0.2,
                            y = 0.1,
                            height = 0.8,
                                 width = 0.6,
                            on_focus_lost_hide = True,
                            warp_pointer = False),
                        DropDown("daily",
                            ["kitty" ],
                            opacity = 1,
                                 x = 0.2,
                            y = 0.1,
                            height = 0.8,
                                 width = 0.6,
                            on_focus_lost_hide = True,
                            warp_pointer = False),
                        ]))


keys.extend([
    Key([mod , "shift"], "i", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key([mod , "shift"], "m", lazy.group['scratchpad'].dropdown_toggle('daily')),
    ])

subprocess.run(["notify-send", "config-reloaded"])
@hook.subscribe.startup_once
def autostart():
    processes = [
        ['/usr/bin/xmodmap',  '/home/nitin/.Xmodmap'],
        ["/usr/bin/xset", "r", "rate", "250", "30"],
        ["picom"],
        ["nitrogen", "--restore"],
        ["tmux", "new", "-s", "init", "-d"],
    ]
    for p in processes:
        subprocess.Popen(p)

