{ pkgs, ... }:

{
	home.packages = with pkgs; [
		eza
		ripgrep
		bat
	];

  programs.fish = {
    enable = true;

    shellInit = ''
      set -g fish_greeting
    '';

	shellAliases = {
		ll = "eza -lah";
		ls = "eza";
		cat = "bat";
	};
  };
}
