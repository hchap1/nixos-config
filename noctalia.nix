{ pkgs, inputs, ... }:
{
	services.power-profiles-daemon.enable = true;
	services.upower.enable = true;

	home-manager.users.hc = {
		imports = [
			inputs.noctalia.homeModules.default
		];

		programs.noctalia-shell = {
			enable = true;
			settings = {

				wallpaper = {
					enabled = true;
					overviewEnabled = true;
					overviewBlur = 0.4;
					overviewTint = 0.5;
				};

				bar = {
					density = "compact";
					position = "top";
					showCapsule = false;
					widgets = {
						widgets = {
							left = [
							{
								id = "Launcher";
							}
							{
								id = "Clock";
							}
							{
								id = "SystemMonitor";
							}
							{
								id = "ActiveWindow";
							}
							{
								id = "MediaMini";
							}
							];
							center = [
							{
								hideUnoccupied = false;
								id = "Workspace";
							}
							];
							right = [
							{
								id = "Tray";
							}
							{
								id = "NotificationHistory";
							}
							{
								id = "Volume";
							}
							{
								id = "ControlCenter";
							}
							];
						};
					};
					colorSchemes.predefinedScheme = "Monochrome";
					location = {
						monthBeforeDay = true;
						name = "Brisbane, Australia";
					};
				};

# this may also be a string or a path to a JSON file.
				colors = {
					mError = "#f38ba8";
					mOnError = "#1e1e2e";
					mOnPrimary = "#1e1e2e";
					mOnSecondary = "#1e1e2e";
					mOnSurface = "#cdd6f4";
					mOnSurfaceVariant = "#a6adc8";
					mOnTertiary = "#1e1e2e";
					mOnHover = "#cba6f7";
					mOutline = "#45475a";
					mPrimary = "#cba6f7";
					mSecondary = "#b4befe";
					mShadow = "#000000";
					mSurface = "#1e1e2e";
					mHover = "#2a2a3a";
					mSurfaceVariant = "#313244";
					mTertiary = "#f5c2e7";
				};
			};
		};
	}
