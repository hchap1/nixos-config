{ pkgs, inputs, ... }:

{
	home.packages = with pkgs; [
		lua-language-server
		basedpyright
		rust-analyzer
	];

	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};

	xdg.configFile."nvim".source = "${inputs.nvim-config}";
}
