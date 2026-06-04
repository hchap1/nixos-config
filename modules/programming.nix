{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		python3
		uv

		rustc
		cargo
		rust-analyzer
	];
}
