//#include "../theme.h"
// Modify this file to change what commands output to your statusbar, and recompile using the make command.
// https://glyphsearch.com
// https://www.nerdfonts.com/cheat-sheet

static const Block blocks[] = {
	// ======================================================= //
  /*Icon*/  /*Command*/  /*Update Interval*/  /*Update Signal*/
	
  //{"^lm()^lm(kitty watch sensors) ", "sensors k10temp-pci-00c3 | grep -o '+.*C'",	3,		0},
	
  {"^lm()^lm(kitty btop)󰘚 ", "free -h | awk '/^Mem/ { print $3 }' | sed s/i//g", 2, 0},
	
  {"^lm()^lm(kitty btop)󰍛 ", "echo \"$[100-$(vmstat 1 1 | tail -1 | awk '{print $15}')]\"%", 2, 0},
	
  {"^rm()^us()^ds()^lm()", "battery_100", 10, 0},

	{"^rm()^us()^ds()^lm()", "brightness_100", 1, 5},

	{"^rm()^us()^ds()^lm()", "volume_100", 1, 6},

	{"^lm()^rm()^us()^ds()", "dwlb_moon_date_clock", 10, 7},

};

// sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "   ";
static unsigned int delimLen = 3;
