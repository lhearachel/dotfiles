# ~ .bash_profile
#
# From Jeight and deepthought-64 on StackExchange
# https://unix.stackexchange.com/a/94492

# .bash_profile exists -> don't read .profile
if [[ -f ~/.profile ]]; then
    . ~/.profile
fi

# source ~/.bashrc, if it exists
[ -r ~/.bashrc ] && source ~/.bashrc

