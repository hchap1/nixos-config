{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "catppuccin-mocha";

      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;

      window-padding-x = 8;
      window-padding-y = 8;

      confirm-close-surface = false;
      gtk-titlebar = false;
    };
  };
}
