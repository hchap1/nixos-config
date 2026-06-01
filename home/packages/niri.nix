{ config, pkgs, ... }:

{
	# Config location
	xdg.configFile."niri".source =
	  config.lib.file.mkOutOfStoreSymlink
		"${config.home.homeDirectory}/nixos-config/home/config/niri";
}
