{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ../config/waybar/config.jsonc);
	style    = builtins.readFile ../config/waybar/style.css;
  };

  home.packages = with pkgs; [
    playerctl
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
