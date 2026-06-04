{ pkgs, inputs, ... }:
{
    programs.noctalia-shell = {
		enable = true;

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

      settings = {
        # configure noctalia here
        bar = {
          density = "compact";
          position = "right";
          showCapsule = false;
          widgets = {
            left = [
              {
                id = "ControlCenter";
                useDistroLogo = true;
              }
              {
                id = "Network";
              }
              {
                id = "Bluetooth";
              }
            ];
            center = [
              {
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "none";
              }
            ];
            right = [
              {
                alwaysShowPercentage = false;
                id = "Battery";
                warningThreshold = 30;
              }
              {
                formatHorizontal = "HH:mm";
                formatVertical = "HH mm";
                id = "Clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
          };
        };
        colorSchemes.predefinedScheme = "Monochrome";
        # general = {
          # avatarImage = "/home/drfoobar/.face";
          # radiusRatio = 0.2;
        # };
        location = {
          monthBeforeDay = false;
          name = "Brisbane, Australia";
        };
      };
      # this may also be a string or a path to a JSON file.
    };
 
}
