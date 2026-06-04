{ pkgs, ... }:

{
	home.packages = with pkgs; [
		starship
	];

	programs.starship = {
		enable = true;

		enableFishIntegration = true;

		settings = {
			add_newline = true;
			format = "$all$directory$character";
		};
	};
}
