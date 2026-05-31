
# Networking Configuration
{ pkgs, ... }:

{
	networking.hostName = "battleship";
	networking.networkmanager.enable = true;
}
