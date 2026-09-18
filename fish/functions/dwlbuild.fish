function dwlbuild --wraps='cd ~/.config/dotfiles/dwl/;rm -rf config.h;sudo make clean install'
    # generate config:
    echo "going to dwl_config_maker"
    cd ~/.config/window_manager/dwl_config_maker/
    echo "running config-maker.py"
    python config-maker.py
    
    # apply config:
    echo "going to dwl"
    cd ~/.config/window_manager/dwl/
    # backup current configs
    echo "getting backup"
    mv ~/.config/window_manager/dwl/config.def.h "backup/config.def.h_$(date '+%Y-%m-%d_%H-%M-%S')"
    mv ~/.config/window_manager/dwl/config.h "backup/config.h_$(date '+%Y-%m-%d_%H-%M-%S')"
    # no need this
    rm -rf ~/.config/window_manager/dwl/config.h
    # 
    echo "apply new cfg"
    cp ~/.config/window_manager/dwl_config_maker/o_config.def.h ~/.config/window_manager/dwl/config.def.h
    # 
    echo "install new cfg... (need pswd)"
    sudo make clean install
    #
end
