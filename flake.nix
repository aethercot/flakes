{
	description = "Aethercot's NixOS configuration.";

	outputs = inputs:
/*	let user = "apricot";
	in*/ inputs.flake-parts.lib.mkFlake { inherit inputs; } {
			systems = [
				"x86_64-linux"
				"aarch64-linux"
			];

			imports = [
				./home/hosts
				./hosts
				./modules
				{config._module.args._inputs = inputs // {inherit (inputs) self;};}
			];
		};

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		nur.url = "github:nix-community/NUR";

		spicetify = {
			url = "github:jakeisnt/spicetify-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprland = {
			url = "github:hyprwm/hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		flake-parts.url = "github:hercules-ci/flake-parts";
	};
}
