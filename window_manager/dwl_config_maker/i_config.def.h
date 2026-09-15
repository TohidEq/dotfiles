/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

/* If you want to use the windows key for MODKEY, use WLR_MODIFIER_LOGO */
#define MODKEY WLR_MODIFIER_LOGO

#define TAGKEYS(KEY,SKEY,TAG) \
	{ MODKEY,                    KEY,            view,            {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL,  KEY,            toggleview,      {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_SHIFT, SKEY,           tag,             {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL|WLR_MODIFIER_SHIFT,SKEY,toggletag, {.ui = 1 << TAG} }

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }


/* logging */
static int log_level = WLR_ERROR;



/* *****         IMPORTS HERE         ****** */
//----------------------------------------------------------------------------------//
// import: "./config/appearance.h"
//----------------------------------------------------------------------------------//
// import: "./config/patches/windowresizing.h"
//----------------------------------------------------------------------------------//
// import: "./config/autostart.h"
//----------------------------------------------------------------------------------//
// import: "./config/rules.h"
//----------------------------------------------------------------------------------//
// import: "./config/layouts.h"
//----------------------------------------------------------------------------------//
// import: "./config/monitors.h"
//----------------------------------------------------------------------------------//
// import: "./config/keyboard.h"
//----------------------------------------------------------------------------------//
// import: "./config/mouse.h"
//----------------------------------------------------------------------------------//
// import: "./config/commands.h"
//----------------------------------------------------------------------------------//
// import: "./config/keybinds.h"
//----------------------------------------------------------------------------------//

