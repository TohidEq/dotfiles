
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
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_b,                     togglebar,       {0} },
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
