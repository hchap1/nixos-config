{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		gcc
		pkg-config
		rustc
		cargo
		rust-analyzer
		rsync
		claude-code
	];
}
