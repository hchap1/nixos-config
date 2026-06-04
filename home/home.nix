{ config, pkgs, lib, ... }:

{
	home.username = "hc";
	home.homeDirectory = "/home/hc";
	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	imports = [

		# Packages
		./packages/niri.nix
			./packages/neovim.nix
			./packages/neovide.nix
			./packages/git.nix
			./packages/fish.nix
			./packages/networkmanager-applet.nix
			./packages/ghostty.nix
			./packages/ssh.nix

			# Applications
			./packages/brave.nix
			./packages/spotify.nix
			./packages/vesktop.nix

			# Theming
			./packages/theme.nix
			./packages/wallpaper.nix
	];

	home.sessionVariables = {
		XDG_DOWNLOAD_DIR = "${config.home.homeDirectory}/Downloads";
	};

	home.packages = with pkgs; [
		xdg-user-dirs
	];
}
