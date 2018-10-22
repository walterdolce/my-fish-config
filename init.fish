function output
    echo "[my-omf-config] $argv"
end

function commit-with
    git commit -m "$argv[1..-1]"
end

function commit-with-and-push-to
    commit-with $argv[1..-2]
    git push origin $argv[-1]
end

set -x SVN_EDITOR vi
set -xg EDITOR vi
set -xg GPG_TTY (tty)

set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_git_worktree_support yes
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_display_cmd_duration yes
set -g theme_display_date no
set -g theme_display_docker_machine yes
set -g theme_display_hg yes
set -g theme_display_ruby yes
set -g theme_display_user yes
set -g theme_display_vagrant yes
set -g theme_display_vi yes
set -g theme_display_virtualenv yes
set -g theme_title_display_process yes
set -g theme_title_use_abbreviated_path yes
set -g theme_nerd_fonts yes
set -g theme_display_k8s_context yes
set -g theme_display_hostname yes

set ADDITIONAL_PATHS '/usr/local/sbin' "$HOME/.goenv/shims" "$HOME/.rbenv/shims" "$HOME/.local/bin"

for additional_path in $ADDITIONAL_PATHS
    output "Checking whether '$additional_path' exists..."

    if not test -d $additional_path
        output "'$additional_path' does not exist. It won't be added to the PATH variable."
        continue
    else
        output "'$additional_path' exists. Will add to PATH."
    end

    if not contains $additional_path $PATH
        output "Adding '$additional_path' to PATH ($PATH)."
        set PATH $i $PATH
   end
end

rbenv rehash >/dev/null ^&1
status --is-interactive; and source (pyenv init -|psub)
