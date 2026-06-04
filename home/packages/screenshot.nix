{ pkgs, ... }:

{
	home.packages = with pkgs; [
		grim
			slurp
			wl-clipboard
	];

	home.file.".local/bin/screenshot-clip".text = ''
		#!/usr/bin/env bash
		set -euo pipefail

		grim -g "$(slurp)" - | wl-copy
		'';

	home.file.".local/bin/screenshot-save".text = ''
		#!/usr/bin/env bash
		set -euo pipefail

		dir="$HOME/Pictures/Screenshots"
		mkdir -p "$dir"

		file="$dir/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"

		grim -g "$(slurp)" "$file"
		'';

	home.sessionPath = [
		"$HOME/.local/bin"
	];
}
