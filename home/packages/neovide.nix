{ pkgs, ... }:

{
	programs.neovide = {
		enable = true;
	};

	{ pkgs, ... }:

	{
		home.packages = [
			(pkgs.writeShellScriptBin "edit" ''
			 set -e
			 target="''${1:-.}"
			 target="$(realpath "$target")"

			 if [ -d "$target" ]; then
			 exec ${pkgs.neovide}/bin/neovide --cwd "$target"
			 else
			 exec ${pkgs.neovide}/bin/neovide "$target"
			 fi
			 '')
		];
	}
}
