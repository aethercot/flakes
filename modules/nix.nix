{
	config,
	inputs,
	lib,
	pkgs,
	...
}:

{
	environment.systemPackages = [ pkgs.git ];

	nix = {
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 7d";
		};

		registry = lib.mapAttrs (_: v: { flake = v; }) inputs;

		nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

		settings = {
			auto-optimise-store = true;
			experimental-features = [ "nix-command" "flakes" ];
			flake-registry = "/etc/nix/registry.json";

			keep-derivations = true;
			keep-outputs = true;

			trusted-users = [ "root" "@wheel" ];
		};
	};
}
