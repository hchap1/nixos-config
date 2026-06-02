{ pkgs, ... }:

{
	home.packages = with pkgs; [
		brave
	];

	xdg.desktopEntries.brave = {
		name = "Brave Web Browser";
		exec = "brave --ozone-platform=wayland %U";
		icon = "brave-browser";
		categories = [ "Network" "WebBrowser" ];
		mimeType = [
		  "text/html"
		  "x-scheme-handler/http"
		  "x-scheme-handler/https"
		];
		terminal = false;
	};
}
