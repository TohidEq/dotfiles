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
// __.---==/ import start \==---.__ //


/* appearance */
static const int sloppyfocus               = 1;  /* focus follows mouse */
static const int bypass_surface_visibility = 0;  /* 1 means idle inhibitors will disable idle tracking even if it's surface isn't visible  */

static const int enablegaps                = 1;  /* 1 means gaps are enabled */
static const int smartgaps                 = 0;  /* 1 means no outer gap when there is only one window */
static const int monoclegaps               = 1;  /* 1 means outer gaps in monocle layout */
static const unsigned int borderpx         = 2;  /* border pixel of windows */
static const unsigned int gappih           = 4; /* horiz inner gap between windows  INNER */
static const unsigned int gappiv           = 4; /* vert inner gap between windows INNER */
static const unsigned int gappoh           = 18; /* horiz outer gap between windows and screen edge OUTER */
static const unsigned int gappov           = 0; /* vert outer gap between windows and screen edge OUTER */

static const float rootcolor[]             = COLOR(0x22222200); // #22222200
static const float bordercolor[]           = COLOR(0x44444400); // #44444400
static const float focuscolor[]            = COLOR(0xffffffff); // #f3f3f3ff
static const float urgentcolor[]           = COLOR(0xff3333ff); // #ff0000ff

/* This conforms to the xdg-protocol. Set the alpha to zero to restore the old behavior */
static const float fullscreen_bg[]         = {0.0f, 0.0f, 0.0f, 1.0f}; /* You can also use glsl colors */


/* Cursor Theme */
//static const char *cursor_theme            = "Adwaita";
static const char *cursor_theme            = "volantes_cursors";
static const char cursor_size[]            = "16"; /* Make sure it's a valid integer, otherwise things will break */

static const int cursor_timeout = 5; // 5 sec and then invis

// ====--__\  import end  /__--==== //

//----------------------------------------------------------------------------------//
// import: "./config/patches/windowresizing.h"
// __.---==/ import start \==---.__ //



/* window resizing */
/* resize_corner:
 * 0: top-left
 * 1: top-right
 * 2: bottom-left
 * 3: bottom-right
 * 4: closest to the cursor
 */
static const int resize_corner = 4;
static const int warp_cursor = 0;	/* 1: warp to corner, 0: don’t warp */
static const int lock_cursor = 0;	/* 1: lock cursor, 0: don't lock */

// ====--__\  import end  /__--==== //

//----------------------------------------------------------------------------------//
// import: "./config/autostart.h"
// __.---==/ import start \==---.__ //

/* Autostart */
static const char *const autostart[] = {
        //"wbg", "/path/to/your/image", NULL,
        "waypaper", "--restore", NULL,
        "sdwlb",NULL, // start dwlb top and bottom, + their blocks
        "smako",NULL, // start notif service
        "lxqt-policykit-agent", NULL,
        "wl-gammarelay-rs", NULL,
        "run_toggle_eww", NULL,
        "clapboard", "--record", NULL,
        NULL /* terminate */
};

// ====--__\  import end  /__--==== //

//----------------------------------------------------------------------------------//
// import: "./config/rules.h"
// __.---==/ import start \==---.__ //


static const Rule rules[] = {
	/* app_id             title       tags mask     isfloating   monitor */
	{ "Gimp_EXAMPLE",     NULL,       0,            1,           -1 }, /* Start on currently visible tags floating, not tiled */
	{ "firefox_EXAMPLE",  NULL,       1 << 8,       0,           -1 }, /* Start on ONLY tag "9" */
    /* default/example rule: can be changed but cannot be eliminated; at least one rule must exist */
};

// ====--__\  import end  /__--==== //

//----------------------------------------------------------------------------------//
// import: "./config/layouts.h"
// __.---==/ import start \==---.__ //


/* tagging - TAGCOUNT must be no greater than 31 */
#define TAGCOUNT (9)
/* layout(s) */
static const Layout layouts[] = {
	/* symbol     arrange function */
  { " 󰕰 ",      tile },
	{ "  ",      NULL },    /* no layout function means floating behavior */
	{ "  ",      monocle },
	//{ " 󰋑 ",     dwindle },
	{ "  ",     dwindle },

};

// ====--__\  import end  /__--==== //

//----------------------------------------------------------------------------------//
// import: "./config/monitors.h"
// __.---==/ import start \==---.__ //

/* monitors */
/* (x=-1, y=-1) is reserved as an "autoconfigure" monitor position indicator
 * WARNING: negative values other than (-1, -1) cause problems with Xwayland clients due to
 * https://gitlab.freedesktop.org/xorg/xserver/-/issues/899 */
static const MonitorRule monrules[] = {
   /* name        mfact  nmaster scale layout       rotate/reflect                x    y
    * example of a HiDPI laptop monitor:
    { "eDP-1",    0.5f,  1,      2,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  -1 }, */
	{ NULL,       0.55f, 1,      1,    &layouts[3], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  -1 },
	/* default monitor rule: can be changed but cannot be eliminated; at least one monitor rule must exist */
};

// ====--__\  import end  /__--==== //

//----------------------------------------------------------------------------------//
// import: "./config/keyboard.h"
// __.---==/ import start \==---.__ //

/* keyboard */
static const struct xkb_rule_names xkb_rules = {
	/* can specify fields: rules, model, layout, variant, options */
	/* example:
	.options = "ctrl:nocaps",
	*/
	.options = NULL,
};



// mouse

static const Button buttons[] = {
	{ MODKEY, BTN_LEFT,   moveresize,     {.ui = CurMove} },
	{ MODKEY, BTN_MIDDLE, togglefloating, {0} },
	{ MODKEY, BTN_RIGHT,  moveresize,     {.ui = CurResize} },
};


// ====--__\  import end  /__--==== //

//----------------------------------------------------------------------------------//
// import: "./config/mouse.h"
// __.---==/ import start \==---.__ //


static const int repeat_rate = 35;
static const int repeat_delay = 200;

/* Trackpad */
static const int tap_to_click = 1;
static const int tap_and_drag = 1;
static const int drag_lock = 1;
static const int natural_scrolling = 0;
static const int disable_while_typing = 1;
static const int left_handed = 0;
static const int middle_button_emulation = 0;
/* You can choose between:
LIBINPUT_CONFIG_SCROLL_NO_SCROLL
LIBINPUT_CONFIG_SCROLL_2FG
LIBINPUT_CONFIG_SCROLL_EDGE
LIBINPUT_CONFIG_SCROLL_ON_BUTTON_DOWN
*/
static const enum libinput_config_scroll_method scroll_method = LIBINPUT_CONFIG_SCROLL_2FG;

/* You can choose between:
LIBINPUT_CONFIG_CLICK_METHOD_NONE
LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS
LIBINPUT_CONFIG_CLICK_METHOD_CLICKFINGER
*/
static const enum libinput_config_click_method click_method = LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS;

/* You can choose between:
LIBINPUT_CONFIG_TAP_MAP_LRM -- 1/2/3 finger tap maps to left/right/middle
LIBINPUT_CONFIG_TAP_MAP_LMR -- 1/2/3 finger tap maps to left/middle/right
*/
static const enum libinput_config_tap_button_map button_map = LIBINPUT_CONFIG_TAP_MAP_LRM;



/* You can choose between:
LIBINPUT_CONFIG_SEND_EVENTS_ENABLED
LIBINPUT_CONFIG_SEND_EVENTS_DISABLED
LIBINPUT_CONFIG_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE
*/
static const uint32_t send_events_mode = LIBINPUT_CONFIG_SEND_EVENTS_ENABLED;

/* You can choose between:
LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT
LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE
*/
static const enum libinput_config_accel_profile accel_profile = LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE;
static const double accel_speed = 0.0;






// ====--__\  import end  /__--==== //

//----------------------------------------------------------------------------------//
// import: "./config/commands.h"
// __.---==/ import start \==---.__ //

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
                  *run_code_toggle_theme[]      = { "code_toggle_theme", NULL },
                  *run_toggle_dwlb[]            = { "run_toggle_dwlb", NULL },
                  *run_clipboard[]            = { "clapboard", NULL };

// ====--__\  import end  /__--==== //

//----------------------------------------------------------------------------------//
// import: "./config/keybinds.h"
// __.---==/ import start \==---.__ //


static const Key keys[] = {
	/* Note that Shift changes certain key codes: 2 -> at, etc. */
	/* modifier                  key                  function          argument */
	{ MODKEY,                    XKB_KEY_d,                     spawn,            {.v = menucmd} },
	{ MODKEY|WLR_MODIFIER_CTRL,  XKB_KEY_d,                     spawn,            {.v = run_rofi} },
	{ MODKEY,                    XKB_KEY_Return,                spawn,            {.v = termcmd} },
	{ MODKEY,                    XKB_KEY_0,                     spawn,            {.v = run_powermenu} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_0,                     spawn,            {.v = run_wlogout} },
  { MODKEY,                    XKB_KEY_s,                     spawn,            {.v = run_selectable_screenshot} },
  { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_s,                     spawn,            {.v = run_fullscreen_screenshot} },
  { MODKEY,                    XKB_KEY_w,                     spawn,            {.v = run_wikiarch} },
  { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_w,                     spawn,            {.v = run_toggle_eww} },
  { MODKEY,                    XKB_KEY_c,                     spawn,            {.v = run_color_picker} },

  { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Escape,                spawn,            {.v = run_btop} },
  { MODKEY|WLR_MODIFIER_CTRL,  XKB_KEY_Escape,                spawn,            {.v = run_nvtop} },

  { MODKEY,                    XKB_KEY_F1,                    spawn,            {.v = run_obsidian} },

  { MODKEY,                    XKB_KEY_F2,                    spawn,            {.v = run_firefox} },
  { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_F2,                    spawn,            {.v = run_tor} },
  { MODKEY|WLR_MODIFIER_ALT,   XKB_KEY_F2,                    spawn,            {.v = run_qutebrowser} },

  { MODKEY,                    XKB_KEY_F3,                    spawn,            {.v = run_thunar} },
  { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_F3,                    spawn,            {.v = run_spf} },
  { MODKEY|WLR_MODIFIER_ALT,   XKB_KEY_F3,                    spawn,            {.v = run_ranger} },

  { MODKEY,                    XKB_KEY_F4,                    spawn,            {.v = run_code} },
  { MODKEY|WLR_MODIFIER_ALT,   XKB_KEY_F4,                    spawn,            {.v = run_code_toggle_theme} },

  { MODKEY,                    XKB_KEY_v,                     spawn,            {.v = run_clipboard} },


	//{ MODKEY|WLR_MODIFIER_CTRL,  XKB_KEY_j,                     focusstack,       {.i = +1} },
	//{ MODKEY|WLR_MODIFIER_CTRL,  XKB_KEY_k,                     focusstack,       {.i = -1} },
	{ MODKEY,                    XKB_KEY_i,                     incnmaster,       {.i = +1} },
	{ MODKEY,                    XKB_KEY_p,                     incnmaster,       {.i = -1} },
	//{ MODKEY|WLR_MODIFIER_CTRL,  XKB_KEY_h,                     setmfact,         {.f = -0.05f} },
	//{ MODKEY|WLR_MODIFIER_CTRL,  XKB_KEY_l,                     setmfact,         {.f = +0.05f} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Return,                zoom,             {0} },
	{ MODKEY,                    XKB_KEY_Tab,                   view,             {0} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_q,                     killclient,       {0} },
	{ MODKEY,                    XKB_KEY_t,                     setlayout,        {.v = &layouts[0]} }, // tile
	//{ MODKEY,                    XKB_KEY_f,                     setlayout,        {.v = &layouts[1]} }, // float
	{ MODKEY,                    XKB_KEY_m,                     setlayout,        {.v = &layouts[2]} }, // monocle
	{ MODKEY,                    XKB_KEY_r,                     setlayout,        {.v = &layouts[3]} }, // dwindle
	//{ MODKEY,                    XKB_KEY_space,                setlayout,        {0} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_f,                     togglefloating,   {0} },
	{ MODKEY,                    XKB_KEY_f,                     togglefullscreen, {0} },
	//{ MODKEY,                    XKB_KEY_0,                     view,             {.ui = ~0} }, // view all windows
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_parenright,            tag,              {.ui = ~0} },
	{ MODKEY,                    XKB_KEY_comma,                 focusmon,         {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY,                    XKB_KEY_period,                focusmon,         {.i = WLR_DIRECTION_RIGHT} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_less,                  tagmon,           {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_greater,               tagmon,           {.i = WLR_DIRECTION_RIGHT} },
	// ===== Audio Volume Control
	{ 0, 												 XKB_KEY_XF86AudioRaiseVolume,  spawn,            {.v = vol_up} },
	{ 0, 												 XKB_KEY_XF86AudioLowerVolume,  spawn,            {.v = vol_down} },
	{ 0, 												 XKB_KEY_XF86AudioMute,         spawn,            {.v = vol_mute} },
	// ===== Brightness
	{ 0, 												 XKB_KEY_XF86MonBrightnessUp,   spawn,            {.v = bright_up} },
	{ 0, 												 XKB_KEY_XF86MonBrightnessDown, spawn,            {.v = bright_down} },
	// ===== Bar (dwlb)
	{ MODKEY,                    XKB_KEY_b,                     spawn,            {.v = run_toggle_dwlb} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_b,                     togglebar,        {0} },
	// ===== GenericGAPS
	//{ MODKEY|WLR_MODIFIER_LOGO,  XKB_KEY_h,           incgaps,          {.i = +1 } },
	//{ MODKEY|WLR_MODIFIER_LOGO,  XKB_KEY_l,           incgaps,          {.i = -1 } },
	//{ MODKEY|WLR_MODIFIER_LOGO|WLR_MODIFIER_SHIFT,    XKB_KEY_H,         incogaps,      {.i = +1 } },
	//{ MODKEY|WLR_MODIFIER_LOGO|WLR_MODIFIER_SHIFT,    XKB_KEY_L,         incogaps,      {.i = -1 } },
	//{ MODKEY|WLR_MODIFIER_LOGO|WLR_MODIFIER_CTRL,     XKB_KEY_h,         incigaps,      {.i = +1 } },
	//{ MODKEY|WLR_MODIFIER_LOGO|WLR_MODIFIER_CTRL,     XKB_KEY_l,         incigaps,      {.i = -1 } },
	{ MODKEY,                    XKB_KEY_g,                                togglegaps,        {0} },
	//{ MODKEY|WLR_MODIFIER_LOGO|WLR_MODIFIER_SHIFT,    XKB_KEY_parenright,defaultgaps,    {0} },
	//{ MODKEY,                    XKB_KEY_y,           incihgaps,        {.i = +1 } },
	//{ MODKEY,                    XKB_KEY_o,           incihgaps,        {.i = -1 } },
	//{ MODKEY|WLR_MODIFIER_CTRL,  XKB_KEY_y,           incivgaps,        {.i = +1 } },
	//{ MODKEY|WLR_MODIFIER_CTRL,  XKB_KEY_o,           incivgaps,        {.i = -1 } },
	//{ MODKEY|WLR_MODIFIER_LOGO,  XKB_KEY_y,           incohgaps,        {.i = +1 } },
	//{ MODKEY|WLR_MODIFIER_LOGO,  XKB_KEY_o,           incohgaps,        {.i = -1 } },
	//{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Y,           incovgaps,        {.i = +1 } },
	//{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_O,           incovgaps,        {.i = -1 } },
	// ===== FocusDir
	{ MODKEY,                   XKB_KEY_h,              focusdir,         {.ui = 0} },
	{ MODKEY,                   XKB_KEY_Left,           focusdir,         {.ui = 0} },
	{ MODKEY,                   XKB_KEY_l,              focusdir,         {.ui = 1} },
	{ MODKEY,                   XKB_KEY_Right,          focusdir,         {.ui = 1} },
	{ MODKEY,                   XKB_KEY_k,              focusdir,         {.ui = 2} },
	{ MODKEY,                   XKB_KEY_Up,             focusdir,         {.ui = 2} },
	{ MODKEY,                   XKB_KEY_j,              focusdir,         {.ui = 3} },
	{ MODKEY,                   XKB_KEY_Down,           focusdir,         {.ui = 3} },

	TAGKEYS(          XKB_KEY_1, XKB_KEY_exclam,                        0),
	TAGKEYS(          XKB_KEY_2, XKB_KEY_at,                            1),
	TAGKEYS(          XKB_KEY_3, XKB_KEY_numbersign,                    2),
	TAGKEYS(          XKB_KEY_4, XKB_KEY_dollar,                        3),
	TAGKEYS(          XKB_KEY_5, XKB_KEY_percent,                       4),
	TAGKEYS(          XKB_KEY_6, XKB_KEY_asciicircum,                   5),
	TAGKEYS(          XKB_KEY_7, XKB_KEY_ampersand,                     6),
	TAGKEYS(          XKB_KEY_8, XKB_KEY_asterisk,                      7),
	TAGKEYS(          XKB_KEY_9, XKB_KEY_parenleft,                     8),
	//{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_q,           			  quit,             {0} },

	/* Ctrl-Alt-Backspace and Ctrl-Alt-Fx used to be handled by X server */
	{ WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_Terminate_Server, quit, {0} },
	/* Ctrl-Alt-Fx is used to switch to another VT, if you don't know what a VT is
	 * do not remove them.
	 */
#define CHVT(n) { WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_XF86Switch_VT_##n, chvt, {.ui = (n)} }
	CHVT(1), CHVT(2), CHVT(3), CHVT(4), CHVT(5), CHVT(6),
	CHVT(7), CHVT(8), CHVT(9), CHVT(10), CHVT(11), CHVT(12),
};

// ====--__\  import end  /__--==== //

//----------------------------------------------------------------------------------//

