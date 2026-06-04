{ pkgs, inputs, ... }:

{
    programs.noctalia = {
		enable = true
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
	 }
}
