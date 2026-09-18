if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim="nvim"
alias vin="emacs"
alias vem="emacs -nw"
alias ttmux="tmuxinator"
# alias ls="lsd"
alias atree="atree++"
alias ptree="tree++"
#alias cat="bat"
alias gitl="clear && echo -e '---- GIT STATUS ----\n' && git status && echo -e '\n----  GIT  LOG  ----\n' && git log --oneline -10 --graph --decorate"
alias gitc="git clone"
alias gitc1="git clone --depth 1"

alias ffch="clear && fastfetch --config dwl.jsonc"

#alias dwlbuild="cd ~/.config/dotfiles/dwl/;rm -rf config.h;sudo make clean install"

#set -x QT_QPA_PLATFORMTHEME qt5ct
#set -x QT_QPA_PLATFORMTHEME qt6ct
###set -Ux QT_QPA_PLATFORMTHEME kvantum
###set -Ux GTK_THEME Nordic-darker-standard-buttons-v40

# HYPRLAND: set -Ux XDG_CURRENT_DESKTOP hyprland
###set -Ux XDG_CURRENT_DESKTOP dwl

#set -x XDG_DESKTOP_PORTAL kde

#set -Ux QT_QUICK_CONTROLS_STYLE kvantum

###set -Ux STARSHIP_LOG off

###set -Ux DOOMDIR "/home/arc/.config/doom"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#starship init fish | source

## if status is-interactive
##     # Commands to run in interactive sessions can go here
##     set -U fish_greeting
##     function starship_transient_prompt_func
##         echo " "
##     end
##     starship init fish | source
##     enable_transience
## end
