{ pkgs, ... }:

{
	services.mako = {
	  enable = true;

	  settings = {
		font = "JetBrainsMono Nerd Font";
		background-color = "#1e1e2e";
		text-color = "#cdd6f4";
		border-color = "#cba6f7";
		border-radius = 8;
		border-size = 3;
		default-timeout = 2000;
		max-visible = 5;
		layer = "top";
		anchor = "top-right";
	  };
	};
}
