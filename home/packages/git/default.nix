{ pkgs, ... }:

{
	programs.git = {
		enable = true;
		package = pkgs.gitFull;

		userName = "aethercot";
		userEmail = "99132199+aethercot@users.noreply.github.com";

		extraConfig = {
			init.defaultBranch = "main";
			credential.helper = "${pkgs.gitAndTools.gitFull}/bin/git-credential-libsecret";
		};

		ignores = [
			"*~"
			"*.swp"

			"result"
			"result-*"
		];
	};
}
