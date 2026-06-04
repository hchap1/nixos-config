{ pkgs, ... }:

{
	home.packages = with pkgs; [
		vesktop
	];

	home.file.".config/vesktop/settings.json".text = builtins.toJSON {
	  appBadge = false;
	  arRPC = true;
	  checkUpdates = false;

	  customTitleBar = true;
	  minimizeToTray = true;
	  tray = true;

	  splashTheming = true;
	  splashBackground = "#1e1e2e";
	  splashColor = "#cdd6f4";

	  hardwareAcceleration = true;
	  discordBranch = "stable";
	};

	home.file.".config/vesktop/settings/quickCss.css".source = ../../data/vesktop/theme.css;
	home.file.".config/vesktop/themes/".source = ../../data/vesktop/theme.css;
}
