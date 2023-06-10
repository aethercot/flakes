{ pkgs, ... }:

let
  spicetify = pkgs.fetchFromGitHub {
    owner = "pietdevries94";
    repo = "spicetify-nix";
    rev = "c386ede8e3d97daee8e43794a1dd2747b625d3b7";
    sha256 = "f4545c4e435961bb616091a9485aa75f24af826362c1bed50aa5f81800238d9b";
  };
in {
  imports = [ (import "${spicetify}/module.nix") ];

  programs.spicetify = {
    enable = true;
    theme = "Dribbblish";
    colorScheme = "horizon";
  };
}
