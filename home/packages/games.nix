{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lutris                      # installs CnCNet via built-in script
    wineWow64Packages.stable    # 32-bit + 64-bit Wine for Lutris/CnCNet
    winetricks                  # Wine dependency helper
    protonup-qt                 # GUI for managing GE-Proton builds in Steam
  ];

  # Lutris/UMU scans this directory directly (doesn't go through Steam's
  # launcher wrapper where programs.steam.extraCompatPackages sets the env var).
  home.file.".local/share/Steam/compatibilitytools.d/GE-Proton".source =
    pkgs.proton-ge-bin;
}
