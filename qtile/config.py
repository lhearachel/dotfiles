'''
    Qtile configuration
'''

import os
import subprocess

from libqtile import layout, hook
from libqtile.config import Match

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

groups = GROUPS
keys = KEYS

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

widget_defaults = WIDGET_DEFAULTS
extension_defaults = widget_defaults.copy()

screens = SCREENS

# Drag floating layouts.
mouse = MOUSE

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
