{
	imports = [
		{ _module.args.theme = { colors = import ../themes/javacafe.nix; }; }
		../packages/alacritty
		../packages/discocss
		../packages/firefox
		../packages/git
		../packages/hyprland
		../packages/neovim
	];

	home.sessionVariables = {
		BROWSER = "firefox";
		discord = "discocss";
		EDITOR = "nvim";
	};


        wayland.windowManager.hyprland = {
          extraConfig = ''
            env = WLR_NO_HARDWARE_CURSORS,1

            monitor = DP-1, 2560x1440, 0x0, 1
            monitor = HDMI-A-1, 1920x1080, 2560x0, 1

            input {
              kb_layout = se
            }
          '';
          
          nvidiaPatches = true;
        };
}
