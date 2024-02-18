'''
    Widget configuration
'''
from libqtile import widget

from colors import CATPPUCCIN

def left_arrow(bg_color, fg_color):
    '''
        Define a left-arrow widget
    '''
    return widget.TextBox(
        text='\ue0b2',
        padding=0,
        fontsize=26,
        background=bg_color,
        foreground=fg_color,
    )

def right_arrow(bg_color, fg_color):
    '''
        Define a right-arrow widget
    '''
    return widget.TextBox(
        text='\ue0b0',
        padding=0,
        fontsize=26,
        background=bg_color,
        foreground=fg_color,
    )

DEFAULTS = {
    'font': 'CaskaydiaCove Nerd Font Mono',
    'fontsize': 16,
    'padding': 5,
}

TOP_WIDGETS = [
    widget.Spacer(
        length=10,
        background=CATPPUCCIN['base'],
    ),
    widget.TextBox(
        text='󰣇',
        padding=0,
        fontsize=30,
        background=CATPPUCCIN['base'],
        foreground=CATPPUCCIN['text'],
    ),
    widget.Spacer(
        length=5,
        background=CATPPUCCIN['base'],
    ),

    right_arrow(CATPPUCCIN['sapphire'], CATPPUCCIN['base']),
    widget.GroupBox(
        highlight_method='line',
        background=CATPPUCCIN['sapphire'],
        highlight_color=[CATPPUCCIN['sapphire'], CATPPUCCIN['sapphire']],
        inactive=CATPPUCCIN['base'],
        active=CATPPUCCIN['base'],
        margin=0,
        margin_x=5,
        margin_y=5,
        borderwidth=2,
        fontsize=25,
    ),

    right_arrow(CATPPUCCIN['base'], CATPPUCCIN['sapphire']),
    widget.Spacer(
        length=5,
        background=CATPPUCCIN['base'],
    ),
    widget.WindowName(
        background=CATPPUCCIN['base'],
        foreground=CATPPUCCIN['text'],
        fontsize=14,
    ),

    left_arrow(CATPPUCCIN['base'], CATPPUCCIN['yellow']),
    widget.CPU(
        background=CATPPUCCIN['yellow'],
        foreground=CATPPUCCIN['base'],
        format=' {freq_current}GHz @ {load_percent:3.0f}%'
    ),

    left_arrow(CATPPUCCIN['yellow'], CATPPUCCIN['green']),
    widget.Memory(
        background=CATPPUCCIN['green'],
        foreground=CATPPUCCIN['base'],
        measure_mem='G',
        format=' {MemUsed:2.2f}{mm} / {MemTotal:2.2f}{mm}',
    ),

    left_arrow(CATPPUCCIN['green'], CATPPUCCIN['sapphire']),
    widget.Net(
        background=CATPPUCCIN['sapphire'],
        foreground=CATPPUCCIN['base'],
        format=' {down:3.0f}{down_suffix:<1}  {up:3.0f}{up_suffix:<1}',
    ),

    left_arrow(CATPPUCCIN['sapphire'], CATPPUCCIN['lavender']),
    widget.Clock(
        background=CATPPUCCIN['lavender'],
        foreground=CATPPUCCIN['base'],
        format='%a  %Y-%m-%d  %H:%M',
    ),

    left_arrow(CATPPUCCIN['lavender'], CATPPUCCIN['base']),
    widget.Spacer(
        length=10,
        background=CATPPUCCIN['base'],
    ),
    widget.Systray(
        background=CATPPUCCIN['base'],
        icon_size=25,
    ),
    widget.Spacer(
        length=15,
        background=CATPPUCCIN['base'],
    ),
]
