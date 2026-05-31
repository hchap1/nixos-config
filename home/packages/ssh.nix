# Load ssh from ~/.ssh/id_ed25519
{ pkgs, ... }:

{
	programs.ssh = {
		enable = true;

		matchBlocks."github.com" = {
			hostname = "github.com";
			user = "git";
			identityFile = "~/.ssh/id_ed25519";
		};
	};
}
