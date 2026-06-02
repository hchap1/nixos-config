{ pkgs, ... }:

{
	programs.fish = {
		enable = true;
	};

	environment.systemPackages = with pkgs; [
		eza
		ripgrep
		bat
		git
	];
}
