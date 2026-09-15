/* Autostart */
static const char *const autostart[] = {
        //"wbg", "/path/to/your/image", NULL,
        "waypaper", "--restore", NULL,
        "sdwlb",NULL, // start dwlb top and bottom, + their blocks
        "lxqt-policykit-agent", NULL,
        "wl-gammarelay-rs", NULL,
        "run_toggle_eww", NULL,
        NULL /* terminate */
};
