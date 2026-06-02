{ pkgs, ... }:

{
	services.mako = {
	  enable = true;

	  settings = {
		font = "JetBrainsMono Nerd Font";
		background-color = "#1e1e2e";
		text-color = "#cdd6f4";
		border-color = "#89b4fa";
		border-radius = 8;
		border-size = 2;
		default-timeout = 5000;
	  };
	};
}
