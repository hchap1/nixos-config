{ pkgs, ... }:

{
  services.mako.enable = false;
  services.swaync = {
    enable = true;

    settings = {
      positionX = "right";
      positionY = "top";

      layer = "overlay";
      control-center-layer = "top";

      layer-shell = true;

      notification-icon-size = 48;

      control-center-margin-top = 10;
      control-center-margin-right = 10;
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
      }

      .notification {
        background: rgba(30, 30, 46, 0.75);
        border: 1px solid rgba(137, 180, 250, 0.6);
        border-radius: 12px;
      }

      .control-center {
        background: rgba(17, 17, 27, 0.75);
        border-radius: 16px;
      }
    '';
  };
}
