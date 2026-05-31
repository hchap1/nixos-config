# Boot Config
{ pkgs, ... }:

{
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.systemd-boot.editor = false;
	boot.loader.timeout = 5;
	  
}
