{ pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;

    fonts = with pkgs; [
      sarasa-gothic
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Sarasa Mono K" ];
        sansSerif = [ "Sarasa UI K" ];
        serif = [ "Sarasa UI K" ];
      };
    };
  };
}	
