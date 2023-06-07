{ config, lib, pkgs, inputs, ... }:

{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  }
}
