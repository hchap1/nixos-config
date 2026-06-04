{ pkgs, ... }:

let
screenshot-clip = pkgs.writeShellApplication {
	name = "screenshot-clip";

	runtimeInputs = with pkgs; [
		grim
		slurp
		wl-clipboard
	];

	text = ''
		set -euo pipefail

		grim -g "$(slurp)" - | wl-copy
		'';
};

screenshot-save = pkgs.writeShellApplication {
	name = "screenshot-save";

	runtimeInputs = with pkgs; [
		grim
			slurp
	];

	text = ''
		set -euo pipefail

		dir="$HOME/Pictures/Screenshots"
		mkdir -p "$dir"

		file="$dir/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"

		grim -g "$(slurp)" "$file"
		'';
};

in
{
	home.packages = [
		screenshot-clip
			screenshot-save
	];
}
