{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		python3
		uv
		gcc
		pkg-config
		rustc
		cargo
		rust-analyzer
	];
}
