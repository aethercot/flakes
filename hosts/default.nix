{
	inputs,
	sharedModules,
	homeImports,
	...
}:

{
	flake.nixosConfigurations = {
		snowbox = inputs.nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			
			modules = [
				./snowbox
				{ home-manager.users.apricot.imports = homeImports."apricot@snowbox"; }
			]
			++ sharedModules;
		};

		# silverflake = inputs.nixpkgs.lib.nixosSystem {
		#	system = "aarch64-linux";

		#	modules = []
		#	++ sharedModules;
		# };
	};
}
