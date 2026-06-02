{ pkgs, ... }:

{
	services.mako = {
	  enable = true;

	  settings = {
		font = "JetBrainsMono Nerd Font";
		background-color = "#1e1e2e77";
		text-color = "#cdd6f4";
		border-color = "#cba6f7";
		border-radius = 8;
		border-size = 3;
		default-timeout = 2000;
		max-visible = 5;
		layer = "top";
		anchor = "top-right";
		shadow = true;
		shadow-color = "#00000080";
		padding=12;
		outer-margin=10;
	  };
	};
}
