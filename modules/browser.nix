{ config, pkgs, lib, ... }:

{
  # Install Brave system-wide so desktop entries + MIME types exist
  environment.systemPackages = with pkgs; [
    brave
  ];

  # Make Brave the default browser for xdg-open
  xdg.mime = {
    enable = true;

    defaultApplications = {
      "text/html" = "brave-browser.desktop";
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";
      "x-scheme-handler/about" = "brave-browser.desktop";
      "x-scheme-handler/unknown" = "brave-browser.desktop";
    };
  };

  # Optional: improve Wayland/Niri compatibility
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Optional: ensure portals exist (important for Save As dialogs)
  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];

    config.common.default = "gtk";
  };

  # Optional convenience wrapper flags (Wayland + better integration)
  environment.variables = {
    BRAVE_OZONE_PLATFORM_HINT = "wayland";
  };
}
