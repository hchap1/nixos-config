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
					directory = ./wallpaper;
					setWallpaperOnAllMonitors = false;
					enabled = true;
					overviewEnabled = true;
					overviewBlur = 0.4;
					overviewTint = 0.5;
				};

				bar = {
					monitorDirectories = [
					{
						monitor = "DP-3";
						directory = ./wallpaper/left/left.jpg;
					}
					{
						monitor = "DP-2";
						directory = ./wallpaper/right/right.jpg;
					}
					{
						monitor = "HDMI-A-1";
						directory = ./wallpaper/middle/middle.jpg;
					}
					];
					outer-corners = false;
					density = "default";
					backgroundOpacity = 0.7;
					enableExclusionZoneInset = false;
					position = "top";
					showCapsule = false;
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
						];
						center = [
						{
							colorizeIcons = false;
							hideMode = "hidden";
							id = "ActiveWindow";
							maxWidth = 500;
							scrollingMode = "hover";
							showIcon = true;
							textColor = "none";
							useFixedWidth = false;
						}
						{
							compactMode = true;
							compactShowAlbumArt = true;
							compactShowVisualizer = false;
							hideMode = "hidden";
							hideWhenIdle = false;
							id = "MediaMini";
							maxWidth = 200;
							panelShowAlbumArt = true;
							panelShowVisualizer = true;
							scrollingMode = "hover";
							showAlbumArt = true;
							showArtistFirst = false;
							showProgressRing = true;
							showVisualizer = true;
							textColor = "secondary";
							useFixedWidth = false;
							visualizerType = "linear";
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
							id = "Battery";
						}
						{
							id = "Volume";
						}
						{
							id = "Brightness";
						}
						{
							id = "ControlCenter";
						}
						];
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

				appLauncher = {
					enableClipboardHistory = false;
					autoPasteClipboard = false;
					enableClipPreview = true;
					clipboardWrapText = true;
					enableClipboardSmartIcons = true;
					enableClipboardChips = true;
					position = "center";
					pinnedApps = [ "Brave Web Browser" "Spotify" ];
					sortByMostUsed = true;
					terminalCommand = "ghostty -e";
					customLaunchPrefixEnabled = false;
					customLaunchPrefix = "";
					viewMode = "list";
					showCategories = true;
					iconMode = "tabler";
					showIconBackground = false;
					enableSettingsSearch = true;
					enableWindowsSearch = true;
					enableSessionSearch = true;
					ignoreMouseInput = false;
					screenshotAnnotationTool = "";
					overviewLayer = false;
					density = "default";
				};
			};
		};
	};
}
