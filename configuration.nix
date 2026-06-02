
{ config, lib, pkgs, ... }:

{
	imports =
		[
			# Hardware Config
			./hardware-configuration.nix

			# OS Modules
			./modules/shell.nix
			./modules/boot.nix
			./modules/networking.nix
			./modules/audio.nix
			./modules/bluetooth.nix
			./modules/desktop.nix

			# System Packages
			./modules/keyd.nix
			./modules/fonts.nix
			./modules/notify.nix
			./modules/portal.nix
		];

	users.users.hc = {
		isNormalUser = true;
		extraGroups = [
			"wheel"
			"networkmanager"
			"audio"
			"video"
			"bluetooth"
			"storage"
			"input"
		];

		shell = pkgs.fish;
	};

	# Allow 'unfree' packages [e.g. Spotify]
	nixpkgs.config.allowUnfree = true;

	time.timeZone = "Australia/Brisbane";
	system.stateVersion = "25.11";
}
