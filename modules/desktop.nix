# Desktop Config
{ pkgs, ... }:

{
	programs.niri.enable = true;
	xdg.portal.enable = true;
	security.polkit.enable = true;

	environment.systemPackages = with pkgs; [
		xwayland-satellite
		waybar
		mako
	];

	services.greetd = {
		enable = true;
		settings.default_session = {
			command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri-session";
			user = "greeter";
		};
	};
}
