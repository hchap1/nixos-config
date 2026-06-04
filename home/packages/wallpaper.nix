{ config, lib, ... }:

let
  wallpaper = "../../wallpaper/test.jpg";
in
{
  home.activation.createNoctaliaWallpaperDir =
    lib.hm.dag.entryBefore [ "linkGeneration" ] ''
      mkdir -p "$HOME/.cache/noctalia"
    '';

  home.file.".cache/noctalia/wallpapers.json".text =
    builtins.toJSON {
      defaultWallpaper = wallpaper;

      wallpapers = {
        "DP-3" = wallpaper;
      };
    };
}
