{ pkgs, ... }:

let defaultSettings = {
# Never save passwords.
	"signon.rememberSignons" = false;

# Don't show a warning when opening about:config. I know what I'm doing!
	"browser.aboutConfig.showWarning" = false;

# Telemetry
	"browser.newtabpage.activity-stream.feeds.telemetry" = false;
	"browser.ping-centre.telemetry" = false;
	"browser.tabs.crashReporting.sendReport" = false;
	"devtools.onboarding.telemetry.logged" = false;
	"toolkit.telemetry.enabled" = false;
	"toolkit.telemetry.server" = "";
	"toolkit.telemetry.unified" = false;

# Disable Pocket
	"browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
	"browser.newtabpage.activity-stream.feeds.section.topstories" = false;
	"browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
	"browser.newtabpage.activity-stream.showSponsored" = false;
	"extensions.pocket.enabled" = false;

# Disable prefetching
	"network.dns.disablePrefetch" = true;
	"network.prefetch-next" = false;

# Disable Javascript in PDF
	"pdfjs.enableScripting" = false;

# Disable Firefox account features
	"identity.fxaccounts.enabled" = false;
	extensions = with pkgs.nur.repos.rycee.firefox-addons; [
		onepassword-password-manager
		ublock-origin
	];
}; in {
	id = 0;
	settings = defaultSettings // {
# Does not work. pls help: "extensions.activeThemeID" = "2022yellow-colorway@mozilla.org";

# Firefox Dark Theme
	"browser.theme.content-theme" = 0;
	"browser.theme.toolbar-theme" = 0;
	"extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
};

}
