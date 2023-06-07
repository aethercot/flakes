{
	self,
	pkgs,
	lib,
	config,
	inputs,
	...
}:

{
	imports = [./hardware-configuration.nix];
	
	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
		bootspec.enable = true;

	};

	hardware = {
		nvidia = {
			package = config.boot.kernelPackages.nvidiaPackages.stable;
			modesetting.enable = true;
		};
	};

	networking = {
		hostName = "snowbox";
		interfaces.enp4s0.useDHCP = true;
	};

	programs = {
		hyprland = {
			enable = true;
			nvidiaPatches = true;
			
			xwayland = {
				enable = true;
				hidpi = false;
			};

		};
	};

	services = {
		xserver = {
			enable = true;
			layout = "se";

			videoDrivers = [ "nvidia" ];

			displayManager.gdm = {
				enable = true;
				wayland = true;
			};
		};
	};
}
