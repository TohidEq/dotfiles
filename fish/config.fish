if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim="nvim"
alias vin="emacs"
alias vem="emacs -nw"
alias ttmux="tmuxinator"
alias ls="lsd"
#alias cat="bat"
alias gitl="clear && echo -e '---- GIT STATUS ----\n' && git status && echo -e '\n----  GIT  LOG  ----\n' && git log --oneline -10 --graph --decorate"

alias ffch="clear && fastfetch --config hypr2.jsonc"

#set -x QT_QPA_PLATFORMTHEME qt5ct
#set -x QT_QPA_PLATFORMTHEME qt6ct
set -x QT_QPA_PLATFORMTHEME kvantum
set -x GTK_THEME Nordic-darker-standard-buttons-v40
set -x XDG_CURRENT_DESKTOP hyprland
#set -x XDG_DESKTOP_PORTAL kde

set -x QT_QUICK_CONTROLS_STYLE kvantum

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    function starship_transient_prompt_func
        echo " "
    end
    starship init fish | source
    enable_transience
end
