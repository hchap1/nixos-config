
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

	environment.systemPackages = with pkgs; [
		openssl
	];

	networking.firewall = {
		enable = true;
		allowedTCPPorts = [ 12345, 42069 ];
		allowedUDPPorts = [ 12345, 42069 ];
	};
}
