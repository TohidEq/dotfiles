static const char *termcmd[]                    = { "kitty", NULL },
             ///  *run_cool_retro_termm[]       = { "cool-retro-term", NULL },
             ///  Audio commands :
                  *vol_up[]   									= { "pamixer", "-i", "5", NULL },   // Increase by 5%
                  *vol_down[] 									= { "pamixer", "-d", "5", NULL },   // Decrease by 5%
                  *vol_mute[]		 								= { "pamixer", "-t", NULL },        // Toggle mute
             ///  Screen Brightness commands :
                  *bright_up[]   								= { "brightnessctl", "set", "5%+", NULL },
                  *bright_down[] 								= { "brightnessctl", "set", "5%-", NULL },
             /////////////////////////////////////////////////////////////////////////////
                  *menucmd[]                    = { "run_wmenu", NULL },
                  *run_powermenu[]              = { "run_powermenu", NULL },
                  *run_wlogout[]                = { "run_wlogout", NULL },
                  *run_rofi[]                   = { "run_rofi", NULL },
                  *run_selectable_screenshot[]  = { "run_selectable_screenshot", NULL },
                  *run_fullscreen_screenshot[]  = { "run_fullscreen_screenshot", NULL },
                  *run_wikiarch[]  		          = { "run_wikiarch", NULL },
                  *run_toggle_eww[]  	          = { "run_toggle_eww", NULL },
                  *run_btop[]  				          = { "run_btop", NULL },
                  *run_nvtop[]  			          = { "run_nvtop", NULL },
                  *run_color_picker[]           = { "run_color_picker", NULL },
                  *run_obsidian[]  		          = { "obsidian", NULL },
                  *run_firefox[]  		          = { "firefox", NULL },
                  *run_tor[]  				          = { "tor-browser", NULL },
                  *run_qutebrowser[]            = { "qutebrowser", NULL },
                  *run_thunar[]                 = { "thunar", NULL },
                  *run_spf[]                    = { "run_spf", NULL },
                  *run_ranger[]  			          = { "run_ranger", NULL },
                  *run_code[]  				          = { "code", NULL },
                  *run_code_toggle_theme[]      = { "code_toggle_theme", NULL };

