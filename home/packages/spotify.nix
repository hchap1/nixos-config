{ inputs, pkgs, ... }:
let
spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
	imports = [ inputs.spicetify-nix.homeManagerModules.default ];

	programs.spicetify = {
		enable = true;
		theme = spicePkgs.themes.dribbblish;
		colorScheme = "base";

		enabledExtensions = with spicePkgs.extensions; [
		# add any extensions here, e.g.:
		# adblock
		# keyboardShortcut
		];
	};
}
