# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess

from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

MOD = "mod4"
TERMINAL = 'alacritty'
BROWSER = 'firefox'
LAUNCHER = 'rofi -show drun'

@hook.subscribe.startup_once
def autostart():
    autostart_sh = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([autostart_sh])

keys = [
    Key([MOD], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([MOD], "j", lazy.layout.down(), desc="Move focus down"),
    Key([MOD], "k", lazy.layout.up(), desc="Move focus up"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([MOD, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([MOD, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([MOD, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([MOD, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([MOD, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([MOD, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([MOD, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([MOD, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),

    Key([MOD], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [MOD, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    Key([MOD], "Return", lazy.spawn(TERMINAL), desc="Launch terminal"),
    Key([MOD], "w", lazy.spawn(BROWSER), desc="Launch web browser"),
    Key([MOD], "space", lazy.spawn(LAUNCHER), desc="Launch application launcher"),

    # Toggle between different layouts as defined below
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    Key([MOD], "q", lazy.window.kill(), desc="Kill focused window"),

    Key(
        [MOD],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),

    Key([MOD], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([MOD, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([MOD, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([MOD], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


GROUP_HOTKEYS = "123456789"
GROUPS = [Group(i) for i in GROUP_HOTKEYS]

for i in GROUPS:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [MOD],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),

            # MOD1 + shift + group number = switch to & move focused window to group
            Key(
                [MOD, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
        ]
    )

# Specifically, Mocha
CATPPUCCIN = {
    'crust': '#11111b',
    'base': '#1e1e2e',
    'mantle': '#181825',
    'surface': [
        '#313244',
        '#45475a',
        '#585b70',
    ],
    'overlay': [
        '#6c7086',
        '#7f849c',
        '#9399b2',
    ],
    'subtext': [
        '#a6adc8',
        '#bac2de',
    ],
    'text': '#cdd6f4',

    'rosewater': '#f5e0dc',
    'lavender': '#b4befe',
    'red': '#f38ba8',
    'green': '#a6e3a1',
    'yellow': '#f9e2af',
    'blue': '#89b4fa',
    'pink': '#f5c2e7',
    'teal': '#94e2d5',
    'sky': '#89dceb',
}

TRANSPARENT = '#00000000'

layout_theme = {
    'border_width': 2,
    'margin': 10,
    'border_focus': CATPPUCCIN['subtext'][0],
    'border_normal': CATPPUCCIN['surface'][0],
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.TreeTab(**layout_theme),
]

widget_defaults = {
    'font': 'CaskaydiaCove Nerd Font Mono',
    'fontsize': 16,
    'padding': 2,
}
extension_defaults = widget_defaults.copy()

def get_widgets():
    return [
        widget.Spacer(
            length=10,
            background=TRANSPARENT,
        ),
        widget.TextBox(
            text='',
            padding=0,
            fontsize=30,
            foreground=CATPPUCCIN['lavender'],
            background=TRANSPARENT,
            font='JetBrainsMono Nerd Font',
        ),
        widget.GroupBox(
            highlight_method='line',
            background=CATPPUCCIN['lavender'],
            highlight_color=[CATPPUCCIN['lavender'], CATPPUCCIN['lavender']],
            inactive=CATPPUCCIN['lavender'],
            active=CATPPUCCIN['base'],
            margin=0,
            margin_x=5,
            margin_y=5,
            borderwidth=2,
        ),
        widget.TextBox(
            text='',
            padding=0,
            fontsize=30,
            foreground=CATPPUCCIN['lavender'],
            background=TRANSPARENT,
            font='JetBrainsMono Nerd Font',
        ),
        widget.WindowName(
            foreground=CATPPUCCIN['text'],
            fontsize=14,
            padding=5,
        ),
        widget.Systray(),
        widget.TextBox(
            text='',
            padding=0,
            fontsize=30,
            foreground=CATPPUCCIN['lavender'],
            background=TRANSPARENT,
            font='JetBrainsMono Nerd Font',
        ),
        widget.Clock(
            background=CATPPUCCIN['lavender'],
            foreground=CATPPUCCIN['base'],
            format='%a  %Y-%m-%d  %H:%M',
        ),
        widget.TextBox(
            text='',
            padding=0,
            fontsize=30,
            foreground=CATPPUCCIN['lavender'],
            background=TRANSPARENT,
            font='JetBrainsMono Nerd Font',
        ),
        widget.Spacer(
            length=10,
            background=TRANSPARENT,
        ),
    ]

screens = [
    Screen(
        top=bar.Bar(
            widgets=get_widgets(),
#            widgets=[
#                widget.GroupBox(highlight_method='line'),
#                widget.Prompt(),
#                widget.WindowName(),
#                widget.Systray(),
#                widget.Clock(format="%a %Y-%m-%d %I:%M %p"),
#            ],

            size=20,
            background=CATPPUCCIN['base'],
        ),

        # Set static wallpaper
        wallpaper='/home/rachel/.wallpaper/twilight_cityscape.png',
        wallpaper_mode='fill',
    ),
]

# Drag floating layouts.
mouse = [
    Drag([MOD], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
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

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
