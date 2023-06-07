{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  documentation.nixos.enable = false;

  environment = {
  	pathsToLink = ["/share/zsh"];

  	systemPackages = with pkgs; [
		neovim
		wget
	];
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "sv_SE.UTF-8/UTF-8"
    ];
  };
  console = {
	font = "Lat2-Terminus16";
  	keyMap = "sv-latin1";
  };

  hardware.opengl.enable = true;

  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
    };
  };

  #networking.timeServers = options.networking.timeServers.default ++ [ "time.google.com" ];
  time.timeZone = lib.mkDefault "Europe/Stockholm";

  users.users = {
    apricot = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "networkmanager" "audio" "adbusers" ];
    };
  };

	nixpkgs.config.allowUnfree = true;

  system.stateVersion = lib.mkDefault "23.05";
}
