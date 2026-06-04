{ pkgs, ... }:

{
  programs.neovide.enable = true;

  home.packages = [
    (pkgs.writeShellApplication {
      name = "edit";
      runtimeInputs = [ pkgs.coreutils ];

      text = ''
        set -e
        target="''${1:-.}"
        target="$(realpath "$target")"
        niri msg action spawn -- neovide "$target"
      '';
    })
  ];
}
