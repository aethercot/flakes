{ pkgs, ... }:

{
	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland;

		terminal = "alacritty"; # TODO: Get rid of hardcoded terminal value
	};
}
