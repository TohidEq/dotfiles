
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
static const char *cursor_theme            = "Moga-Candy-Grey";
static const char cursor_size[]            = "24"; /* Make sure it's a valid integer, otherwise things will break */

static const int cursor_timeout = 5; // 5 sec and then invis
