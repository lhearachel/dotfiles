'''
    Screen configuration
'''
from libqtile import bar
from libqtile.config import Screen

from colors import CATPPUCCIN
from widgets import TOP_WIDGETS

WALLPAPER = '/home/rachel/.wallpaper/twilight_cityscape.png'

SCREENS = [
    Screen(
        top=bar.Bar(
            widgets=TOP_WIDGETS,
            size=24,
            background=CATPPUCCIN['base'],
        ),

        wallpaper=WALLPAPER,
        wallpaper_mode='fill',
    ),
]
