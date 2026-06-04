{ config, pkgs, lib, ... }:

let
  # Catppuccin Spicetify theme pinned declaratively
  catppuccinSpicetify = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "spicetify";
    rev = "main";
    sha256 = "sha256-11p9f7wh08l2cba11fvdxgkrhbik4icv87z348jb7f05fsjlkbsl=";
  };
in
{
  # -------------------------------------------------------
  # Packages
  # -------------------------------------------------------
  home.packages = with pkgs; [
    spotify
    spicetify-cli
  ];

  # -------------------------------------------------------
  # Spicetify config
  # -------------------------------------------------------
  home.file.".config/spicetify/config-xpui.ini".text = ''
[Setting]
spotify_path = ${pkgs.spotify}/share/spotify
prefs_path = /home/${config.home.username}/.config/spotify/prefs

# Catppuccin Mocha theme
current_theme = Catppuccin-Mocha
color_scheme = mocha

replace_colors = 1
inject_css = 1
overwrite_assets = 1

disable_sentry = 1
disable_ui_logging = 1
  '';

  # -------------------------------------------------------
  # Install Catppuccin theme declaratively
  # -------------------------------------------------------
  home.file.".config/spicetify/Themes/Catppuccin-Mocha".source =
    "${catppuccinSpicetify}/themes/Catppuccin-Mocha";

  # -------------------------------------------------------
  # Ensure Spotify config dir exists
  # -------------------------------------------------------
  home.file.".config/spotify/.keep".text = "";

  # -------------------------------------------------------
  # Fully automatic apply on rebuild (no manual CLI)
  # -------------------------------------------------------
  home.activation.spicetifyApply =
    lib.hm.dag.entryAfter ["writeBoundary"] ''
      export PATH=${pkgs.spicetify-cli}/bin:$PATH

      if command -v spicetify >/dev/null; then
        echo "Applying Spicetify (automatic)..."
        spicetify backup apply || true
      fi
    '';
}
