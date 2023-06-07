{ config, pkgs, ... }:

{
  home = {
    username = "apricot";
    homeDirectory = "/home/apricot";
    stateVersion = "23.05";

    sessionVariables = {
      BROWSER = "firefox";
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      # Art
      aseprite
      
      # Games
      tetrio-desktop

      # Media
      spotify
      youtube-tui


      # Terminal
      neofetch
    ];
  
  };

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
