/* The third element is used by the 'spawnorfocus' function to match a title/app_id.
+ * If the third element is 'NULL', match on the first element instead */

static const char *termcmd[]                    = { "kitty", NULL },
             ///  *run_cool_retro_termm[]       = { "cool-retro-term", NULL },
             ///  Audio commands :
                  *vol_up[]                     = { "run_sound_up", NULL },   // Increase by 5%
                  *vol_down[]                   = { "run_sound_down", NULL },   // Decrease by 5%
                  *vol_mute[]                   = { "run_sound_mute", NULL },        // Toggle mute
             ///  Screen Brightness commands :
                  *bright_up[]                  = { "run_brightness_up", NULL },
                  *bright_down[]                = { "run_brightness_down", NULL },
             /////////////////////////////////////////////////////////////////////////////
                  *menucmd[]                    = { "run_wmenu", NULL },
                  *run_powermenu[]              = { "run_powermenu", NULL },
                  *run_wlogout[]                = { "run_wlogout", NULL },
                  *run_rofi[]                   = { "run_rofi", NULL },
                  *run_selectable_screenshot[]  = { "run_selectable_screenshot", NULL },
                  *run_fullscreen_screenshot[]  = { "run_fullscreen_screenshot", NULL },
                  *run_wikiarch[]               = { "run_wikiarch", NULL },
                  *run_toggle_eww[]             = { "run_toggle_eww", NULL },
                  *run_btop[]                   = { "run_btop", NULL },
                  *run_nvtop[]                  = { "run_nvtop", NULL },
                  *run_color_picker[]           = { "run_color_picker", NULL },
                  *run_obsidian[]               = { "obsidian", NULL, NULL },
                  // OR : *run_obsidian[]               = { "obsidian", NULL, "Obsidian" },
                  *run_firefox[]                = { "firefox", NULL },
                  *run_tor[]                    = { "tor-browser", NULL },
                  *run_qutebrowser[]            = { "qutebrowser", NULL },
                  *run_thunar[]                 = { "thunar", NULL },
                  *run_spf[]                    = { "run_spf", NULL },
                  *run_ranger[]                 = { "run_ranger", NULL },
                  *run_zed[]                    = { "zeditor", NULL },
                  *run_code[]                   = { "code", NULL },
                  *run_editors_toggle_theme[]   = { "editors_toggle_theme", NULL },
                  *run_emacs[]                  = { "emacs", NULL },
                  *run_toggle_dwlb[]            = { "run_toggle_dwlb", NULL },
                  *run_restart_dwlb_eww[]       = { "run_restart_dwlb_eww", NULL },
                  *run_clipboard[]              = { "clapboard", NULL },
                  *run_reset_clipboard_history[]= { "run_reset_clipboard_history", NULL },
                  *run_emoji_picker[]           = { "wmoji", NULL };
