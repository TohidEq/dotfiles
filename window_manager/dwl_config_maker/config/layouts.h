
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