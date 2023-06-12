{ pkgs, ... }:

{
	programs.firefox = {
		enable = true;

		profiles.default = {
			isDefault = true;
			/*extensions = with pkgs.nur.repos.rycee.firefox-addons; [
				onepassword-password-manager
				ublock-origin
			]; */ # wtf why does this not work
			settings = {
				"beacon.enabled" = false;

				"browser.newtabpage.activity-stream.feeds.telemetry" = false;
				"browser.ping-centre.telemetry" = false;
				"browser.tabs.crashReporting.sendReport" = false;
				"devtools.onboarding.telemetry.logged" = false;
				"toolkit.telemetry.enabled" = false;
				"toolkit.telemetry.server" = "";
				"toolkit.telemetry.unified" = false;

				# Disable pocket.
				"extensions.pocket.enabled" = false;
				"extensions.pocket.api" = "0.0.0.0";
				"extensions.pocket.loggedOutVariant" = "";
				"extensions.pocket.oAuthConsumerKey" = "";
				"extensions.pocket.onSaveRecs" = false;
				"extensions.pocket.onSaveRecs.locales" = "";
				"extensions.pocket.showHome" = false;
				"extensions.pocket.site" = "0.0.0.0";
				"browser.newtabpage.activity-stream.pocketCta" = "";
				"browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
				"services.sync.prefs.sync.browser.newtabpage.activity-stream.section.highlights.includePocket" = false;

				# Never save passwords.
				"signons.rememberSignons" = false;
			};
		};
	};
}
