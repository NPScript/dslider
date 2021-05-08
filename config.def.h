/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

#include <endian.h>
static int topbar = 1;                      /* -b  option; if 0, dslider appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"SauceCodePro Nerd Font:style=Regular:pixelsize=14"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#888888", "#191919" },
	[SchemeSel] = { "#ffffff", "#547f62" },
	[SchemeOut] = { "#888888", "#191919" },
};
static unsigned int gapxx			 = 10;
static unsigned int border		 = 10;
static unsigned int borderline = 1;
