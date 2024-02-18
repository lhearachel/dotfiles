'''
    Qtile configuration
'''

import os
import subprocess

from libqtile import layout, hook

from colors import CATPPUCCIN
from groups import GROUPS
from keys import KEYS, MOUSE
from screens import SCREENS
from widgets import DEFAULTS as WIDGET_DEFAULTS

@hook.subscribe.startup_once
def autostart():
    '''
        Load the autostart script and invoke it async
    '''
    autostart_sh = os.path.expanduser('~/.config/qtile/autostart.sh')
    with subprocess.Popen([autostart_sh]) as _:
        pass

widget_defaults = WIDGET_DEFAULTS
extension_defaults = widget_defaults.copy()

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

groups = GROUPS
keys = KEYS
screens = SCREENS
mouse = MOUSE

# pylint: disable=locally-disabled, invalid-name
follow_mouse_focus = False
bring_front_click = 'floating_only'
floats_kept_above = True
focus_on_window_activation = 'smart'
reconfigure_screens = True

# Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
