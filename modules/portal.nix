{ lib, pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    config.niri.default = lib.mkForce "gtk";
  };
}
