{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellInit = ''
      set -g fish_greeting
    '';

	shellAliases = {
		ll = "eza -lah --icons";
		ls = "eza --icons";
		cat = "bat";
		ga = "git add";
		gc = "git commit";
		gp = "git push";
	};
  };
}
