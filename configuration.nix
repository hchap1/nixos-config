
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

	time.timeZone = "Australia/Brisbane";
	system.stateVersion = "25.11";
}
