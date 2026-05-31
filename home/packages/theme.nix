{ config, pkgs, lib, ... }:

let
	theme = import ./themes { inherit pkgs lib; };
in
{
	gtk = {
		enable = true;
		theme = {
			name = theme.gtk.themeName;
			package = theme.gtk.themePackage;
		};

		iconTheme = {
			name = theme.gtk.iconName;
			package = theme.gtk.cursorPackage;
		};
			
		cursorTheme = {
			name = theme.gtk.cursorName;
			package = theme.gtk.cursorPackage;
			size = theme.gtk.cursorSize;
		};

		font = {
			name = theme.fonts.sansSerif.name;
			size = theme.fonts.sansSerif.size;
			package = theme.fonts.sansSerif.package;
		};

		gtk4.extraConfig = {
			gtk-application-prefer-dark-theme = true;
		};

		gtk3.extraConfig = {
			gtk-application-prefer-dark-theme = true;
		};
	};

	home.pointerCursor = {
		name = theme.gtk.cursorName;
		package = theme.gtk.cursorPackage;
		size = theme.gtk.cursorSize;

		gtk.enable = true;
		x11.enable = true;
	};

	qt = {
		enable = true;
		platformTheme.name = "kvantum";
		style = {
			name = "kvantum";
			package = pkgs.kdePackages.qtstyleplugin-kvantum;
		};
	};

	xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
		[General]
		theme=${theme.qt.kvTheme}
	'';

	fonts.fontconfig.enable = true;
	
	home.packages = with pkgs; [
		theme.fonts.sansSerif.package
		theme.fonts.monospace.package
		theme.qt.package
		noto-fonts
		noto-fonts-color-emoji
	];

	home.sessionVariables = {
		GTK_THEME = theme.gtk.themeName;
		XCURSOR_THEME = theme.gtk.cursorName;
		XCURSOR_SIZE = toString theme.gtk.cursorSize;

		QT_QPA_PLATFORMTHEME = "kvantum";
		QT_STYLE_OVERRIDE = "kvantum";
		
		QT_QPA_PLATFORM = "wayland;xcb";
		GDK_BACKEND = "wayland,x11";
		CLUTTER_BACKEND = "wayland";
		
		MOZ_ENABLE_WAYLAND = "1";
		NIXOS_OZONE_WL = "1";
	};

	dconf.settings = {
		"org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
			gtk-theme = theme.gtk.themeName;
			icon-theme = theme.gtk.iconName;
			cursor-theme = theme.gtk.cursorName;
			cursor-size = theme.gtk.cursorSize;
			font-name = "${theme.fonts.sansSerif.name} ${toString theme.fonts.sansSerif.size}";
			monospace-font-name = "${theme.fonts.monospace.name} ${toString theme.fonts.monospace.size}";
		};
	};
}
