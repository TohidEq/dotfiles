if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim="nvim"
alias ttmux="tmuxinator"
alias ls="lsd"
#alias cat="bat"
alias gitl="clear && echo -e '---- GIT STATUS ----\n' && git status && echo -e '\n----  GIT  LOG  ----\n' && git log --oneline -10 --graph --decorate"

alias ffch="clear && fastfetch --config hypr2.jsonc"

#alias ttlauncher="java -jar ~/myworld/Applications/games/tlauncher/TLauncher-2.885.jar"

#set -gx PATH /home/tohid-eq/.local/bin $PATH
#set -gx PATH /home/tohid-eq/.local/share/nvm/v22.9.0/bin $PATH
#set -gx PATH /home/tohid-eq/myScripts/ $PATH
#set -gx PATH /home/tohid-eq/myScripts/py-chat-ai-cli/ $PATH
#set -gx PATH /home/tohid-eq/myScripts/i3blocks $PATH
#set -gx PATH /home/tohid-eq/.cargo/bin $PATH

#set -gx PATH /usr/local/maven/bin/ $PATH
#set -gx PATH /home/tohid-eq/.local/share/gem/ruby/3.3.0/bin $PATH
#set -gx PATH /root/.local/share/gem/ruby/3.3.0/bin $PATH

set -x QT_QPA_PLATFORMTHEME qt5ct
set -x GTK_THEME Nordic-darker-standard-buttons-v40
set -x XDG_CURRENT_DESKTOP hyprland
#set -x XDG_DESKTOP_PORTAL kde

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
