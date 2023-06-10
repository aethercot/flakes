{ pkgs, theme, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = import ./settings.nix { inherit theme; };
  };
}
