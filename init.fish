
set -x SVN_EDITOR vi

set -g theme_display_virtualenv yes
set -g theme_display_ruby yes
set -g theme_display_user yes

set PATH /usr/local/sbin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

