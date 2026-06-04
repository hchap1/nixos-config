{ pkgs, ... }:

{
	programs.neovide = {
		enable = true;
	};

	home.packages = [
		(pkgs.writeShellScriptBin "edit" ''
		 set -e
		 target="${1:-.}"
		 target="$(realpath "$target")"
		 niri msg action spawn -- "neovide" "$target"
		 '')
	];
}
