
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

	services.tailscale = {
		enable = true;
		openFirewall = true;
	};

	environment.systemPackages = with pkgs; [
		openssl
	];

	networking.firewall = {
		enable = true;
		# Required for Tailscale packet routing
		checkReversePath = "loose";
		# Trust all traffic on the Tailscale interface (allows SSH through Tailscale)
		trustedInterfaces = [ "tailscale0" ];
		allowedTCPPorts = [ 12345 42069 ];
		allowedUDPPorts = [ 12345 42069 ];
	};
}
