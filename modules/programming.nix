{ config, pkgs, lib, ... }:

{
	environment.systemPackages = with pkgs; [
		python3
		uv
		gcc
		pkg-config
		rustc
		cargo
		rust-analyzer
		basedpyright
		rsync
		claude-code
	];

	environment.variables = {
	  LD_LIBRARY_PATH = lib.mkOverride 0 (lib.makeLibraryPath [
		pkgs.wayland
		pkgs.libxkbcommon
		pkgs.pipewire
	  ]);
	};
}
