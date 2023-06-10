{ pkgs, ... }:

{
	programs.firefox = {
		enable = true;

		profiles.aethercot = import ./profiles/aethercot.nix;
	};
}
