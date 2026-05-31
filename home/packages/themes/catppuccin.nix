{ pkgs, lib }:

{
	name = "catppuccin-mocha";
	gtk = {
		themeName = "catppuccin-mocha-mauve-standard";
		themePackage = pkgs.catppuccin-gtk.override {

			accents = [ "mauve" ];
			variant = "mocha";
		};

		iconName = "Papirus-Dark";
		iconPackage = pkgs.papirus-icon-theme;
		cursorName = "catppuccin-mocha-dark-cursors";
		cursorPackage = pkgs.catppuccin-cursors.mochaDark;
		cursorSize = 24;
	};

	fonts = {
		sansSerif = { name = "Inter"; package = pkgs.inter; size = 11; };
		monospace = { name = "JetBrains Mono"; package = pkgs.jetbrains-mono; size = 11; };
	};

	qt = {
		style = "kvantum";
		kvTheme = "catppuccin-mocha";
		package = pkgs.catppuccin-kvantum;
	};

	colors = {
		base = "#1e1e2e";
		mantle = "#181825";
		crust = "#11111b";
		surface0 = "#313244";
		surface1 = "#45475a";
		surface2 = "#585b70";
		text = "#cdd6f4";
		subtext0 = "#a6adc8";
		subtext1 = "#bac2de";
		overlay0 = "#6c7086";
		overlay1 = "#7f849c";
		overlay2 = "#9399b2";
		rosewater = "#f5e0dc";
		flamingo = "#f2cdcd";
		pink = "#f5c2e7";
		mauve = "#cba6f7";
		red = "#f38ba8";
		maroon = "#eba0ac";
		peach = "#fab387";
		yellow = "#f9e2af";
		green = "#a6e3a1";
		teal = "#94e2d5";
		sky = "#89dceb";
		sapphire = "#74c7ec";
		blue = "#89b4fa";
		lavender = "#b4befe";
		accent = "#cba6f7";
	};
}
