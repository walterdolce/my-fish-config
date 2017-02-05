
set -x SVN_EDITOR vi
set -xg EDITOR vi

set -g theme_avoid_ambiguous_glyphs yes
set -g theme_display_cmd_duration yes
set -g theme_display_date no
set -g theme_display_docker_machine yes
set -g theme_display_hg yes
set -g theme_display_ruby yes
set -g theme_display_user yes
set -g theme_display_vi yes
set -g theme_display_virtualenv yes
set -g theme_title_display_process yes
set -g theme_title_use_abbreviated_path yes

for i in /usr/local/sbin $HOME/.rbenv/shims
    if not contains $i $PATH
        echo "Adding $i to PATH ($PATH)"
        set PATH $i $PATH
   end
end

rbenv rehash >/dev/null ^&1

