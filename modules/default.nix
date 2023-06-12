{
	_inputs,
	inputs,
	default,
	...
}: let	module_args = {
	_module.args = {
		inputs = _inputs;
		inherit default;
	};
};
in {
	imports	= [
		{
			_module.args = {
				inherit module_args;

				sharedModules = [
					{ home-manager.useGlobalPkgs = true; }
					inputs.home-manager.nixosModule
					
					inputs.hyprland.nixosModules.default

					inputs.nur.nixosModules.nur

					module_args

                                        ./audio.nix
                                        ./fonts.nix

					./main.nix
					./networking.nix
					./nix.nix
				];
			};
		}
	];

	flake.nixosModules = {
		main = import ./main.nix;
		nix = import ./nix.nix;
		networking = import ./networking.nix;
	};
}
