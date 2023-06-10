{ pkgs, theme, ... }:

{
  programs.discocss = {
    enable = true;
    discordPackage = pkgs.discord;
    discordAlias = true;
    css = import ./style.nix { inherit theme; };
  };
}
