{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
	settings = builtins.fromJSON (builtins.readFile (
	  pkgs.runCommand "strip-comments" {} ''
		${pkgs.nodePackages.strip-json-comments-cli}/bin/strip-json-comments \
		  ${../config/waybar/config.jsonc} > $out
	  ''
	));
	style    = builtins.readFile ../config/waybar/style.css;
  };

  home.packages = with pkgs; [
    playerctl
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
