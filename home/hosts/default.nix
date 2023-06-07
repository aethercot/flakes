{
	inputs,
	module_args,
	withSystem,
	pkgs,
	...
}: let
	sharedModules = [
		../.
		#module_args
	];

	homeImports = {
		"apricot@snowbox" = [
			./snowbox.nix
			inputs.hyprland.homeManagerModules.default
		] ++ sharedModules;
	};

	inherit (inputs.home-manager.lib) homeManagerConfiguration;
in {
	imports = [
		{ _module.args = { inherit homeImports; }; }
	];

	flake = {
		homeConfigurations = {
			"apricot@snowbox" = homeManagerConfiguration {
				modules = homeImports."apricot@snowbox" ++ module_args;
				inherit pkgs;
			};
		};
	};
}
