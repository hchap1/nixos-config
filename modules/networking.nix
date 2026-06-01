
# Networking Configuration
{ pkgs, ... }:

{
	programs.nm-applet = {
		enable = true;
	};

	networking.hostName = "battleship";
	networking.networkmanager.enable = true;
}
