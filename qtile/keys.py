'''
    Keybinds and mouse-directives
'''
from itertools import chain

from libqtile.config import Key, Drag, Click
from libqtile.lazy import lazy

from groups import GROUPS

MOD = 'mod4'
TERMINAL = 'alacritty'
BROWSER = 'firefox'
LAUNCHER = 'rofi -show combi -combi-modes "window,drun" -modes combi'

_group_keys = list(chain.from_iterable(
    (
        Key(
            [MOD], g.name,
            lazy.group[g.name].toscreen(),
            desc=f'Switch to group {g.name}'
        ),
        Key(
            [MOD, 'shift'], g.name,
            lazy.window.togroup(g.name, switch_group=True),
            desc=f'Switch to & move focused window to group {g.name}'
        )
    ) for g in GROUPS
))

KEYS = [
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

    *_group_keys,
]

MOUSE = [
    Drag([MOD], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]
