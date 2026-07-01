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
		python3    # required by lutris's umu-run (#!/usr/bin/env python3)
	];
}
