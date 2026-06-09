
# Networking Configuration
{ pkgs, ... }:

{
	programs.nm-applet = {
		enable = true;
	};

	networking.hostName = "battleship";
	networking.networkmanager.enable = true;

	services.avahi = {
		enable = true;
		nssmdns4 = true;
		openFirewall = true;
	};
}
