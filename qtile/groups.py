'''
    Window-group definitions
'''

from libqtile.config import Group

_labels = [
    '',
    '',
    '',
    '󰍡',
    '',
    '󰕧',
    '',
    '',
    '󰒓',
]

GROUPS = [Group(str(i), label=label) for i, label in enumerate(_labels, start=1)]
