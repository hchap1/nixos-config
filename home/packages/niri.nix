{ config, pkgs, ... }:

{
	# Config location
	home.file.".config/niri".source =
	  config.lib.file.mkOutOfStoreSymlink
		"${config.home.homeDirectory}/nixos-config/home/config/niri";
}
