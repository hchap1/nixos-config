{ pkgs, lib, ... }:

let
	# Select the theme
	activeTheme = "catppuccin-mocha";
	
	# Options (map name -> import)
	themes = {
		catppuccin-mocha = import ./catppuccin.nix { inherit pkgs lib; };
	};

in
	themes.${activeTheme}
