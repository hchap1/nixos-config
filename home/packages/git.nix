{ pkgs, ... }:

{
	programs.git = {
		enable = true;

		userName = "Harrison Chapman";
		userEmail = "hchap1@hotmail.com";

		settings.alias = {
			ga = "add";
			gc = "commit";
			gp = "push";
		};

		extraConfig = {
			init.defaultBranch = "main";
		};
	};
}
