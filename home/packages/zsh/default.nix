{ pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		enableAutosuggestions = true;
		enableSyntaxHighlighting = true;

		dotDir = ".config/zsh";

		plugins = with pkgs; [
			{
				name = "powerlevel10k";
				src = pkgs.zsh-powerlevel10k;
			}
		];
	};
}
