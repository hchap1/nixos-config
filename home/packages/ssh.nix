{ config, pkgs, lib, ... }:

let
  githubKey = "${config.home.homeDirectory}/.ssh/id_ed25519_github";
in
{
  programs.ssh = {
    enable = true;

    # Ensures ssh-agent is used (optional but recommended)
    addKeysToAgent = "yes";

    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = githubKey;
        identitiesOnly = true;
      };
    };

    extraConfig = ''
      Host *
        ServerAliveInterval 60
        ServerAliveCountMax 3
    '';
  };

  home.activation.createGitHubSSHKey = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ ! -f "${githubKey}" ]; then
      echo "Generating GitHub SSH key..."
      ${pkgs.openssh}/bin/ssh-keygen -t ed25519 \
        -f "${githubKey}" \
        -N "" \
        -C "github-${config.home.username}@${config.networking.hostName or "nixos"}"
    fi
  '';
}
