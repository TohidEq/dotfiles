function crmdpatchdwl
    if test (count $argv) -eq 0
        lsd ~/.config/window_manager/all-dwl-patches/patches/
    else
        crmd ~/.config/window_manager/all-dwl-patches/patches/$argv[1]/README.md
    end
end
