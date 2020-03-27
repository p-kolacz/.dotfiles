# http://docs.qtile.org/en/latest/index.html
from libqtile.config import Key, Screen, Group, Match, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget
from typing import List  # noqa: F401
from libqtile import hook
import os
import subprocess

mod = "mod4"

class Commands(object):
    dmenu = "dmenu_run -i -b -h 32 -p '>' -fn 'Ubuntu-14'"

keys = [
    # Switch between windows in current stack pane
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),

    # Move windows up or down in current stack
    Key([mod, "control"], "j", lazy.layout.shuffle_down()),
    Key([mod, "control"], "k", lazy.layout.shuffle_up()),

    # Switch window focus to other pane(s) of stack
    # Key([mod], "space", lazy.layout.next()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Key([mod, "shift"], "Return", lazy.layout.toggle_split()),

    Key([mod], "Return", lazy.spawn("alacritty")),
    Key([mod], "space", lazy.spawn(Commands.dmenu)),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),

    Key([mod], "q", lazy.window.kill()),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "q", lazy.shutdown()),
    # Key([mod], "c", lazy.spawncmd()),
    Key([mod, "control"], "f", lazy.window.toggle_floating()),

    Key([mod], "b", lazy.to_screen(1)),
    Key([mod], "equal", lazy.to_screen(0)),
    Key([mod], "n", lazy.to_screen(2)),
]

groups = [
    Group("FST"),
    Group("DEV"),
    Group("WWW", layout="max", spawn=["opera"]),
    Group("GOD", layout="max"),
    Group("IMG", layout="max"),
    Group("SND"),
    Group("ALT"),
    Group("COM", layout="max", spawn=["thunderbird, slack"]),
    Group("UTL", spawn=["keepassxc"]),
]

for i in groups:
    key = i.name[0].lower()
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], key, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], key, lazy.window.togroup(i.name)),
    ])

layouts = [
    layout.MonadTall(margin=16, border_width=1, single_border_width=0, border_focus="#333333"),
    layout.Max(),
    # layout.Stack(num_stacks=2)
]

widget_defaults = dict(
    font='Ubuntu',
    fontsize=16,
    padding=5,
    active="#dddddd",
    foreground="#dddddd",
)
extension_defaults = widget_defaults.copy()

def group_box():
    return widget.GroupBox(
        highlight_method="block",
        rounded=False,
        margin=0,
        padding=7,
        inactive="#777777",
        # this_current_screen_border="#1834b9",
        this_screen_border="#122f43",
        # other_screen_border="#000000",
    )

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentScreen(),
                group_box(),
                # widget.Spacer(length=32),
                widget.Sep(padding=16),
                widget.Prompt(),
                widget.WindowName(),
                # widget.TextBox("default config", name="default"),
                # widget.Notify(),
                widget.ThermalSensor(tag_sensor="Package id 0"),
                widget.Battery(charge_char="↑", discharge_char="↓", format='{percent:2.0%} {char}'),
                widget.Systray(),
                widget.Clock(format='%a, %d %b, %H:%M'),
            ], 32,
        ),
    ),
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentScreen(),
                group_box(),
                widget.Prompt(),
                widget.WindowName(),
            ], 32,
        ),
    ),
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentScreen(),
                group_box(),
                widget.Prompt(),
                widget.WindowName(),
            ], 32,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass

    # {'wmclass': 'keepassxc'},
    {'wmclass': 'nitrogen'},
    {'wmclass': 'qalculate-gtk'},
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

