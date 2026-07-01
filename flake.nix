{
	description = "NixOS Config";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		catppuccin = {
			url = "github:catppuccin/nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nix-index-database = {
			url = "github:nix-community/nix-index-database";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nvim-config = {
			url = "github:hchap1/nvim";
			flake = false;
		};
		noctalia = {
			url = "github:noctalia-dev/noctalia-shell";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		spicetify-nix = {
			url = "github:Gerg-L/spicetify-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = { self, nixpkgs, home-manager, catppuccin, nix-index-database, nvim-config, spicetify-nix, ... } @ inputs:
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
	{
		devShells.${system}.python = let
			libs = pkgs.lib.makeLibraryPath (with pkgs; [
				stdenv.cc.cc.lib
				zlib
				glib
				libGL
				SDL2
				SDL2_image
				SDL2_mixer
				SDL2_ttf
				freetype
				libpng
				libjpeg_turbo
				libwebp
				wayland
				libxkbcommon
				pipewire
				xorg.libxcb
			]);
		in pkgs.mkShell {
			name = "python-dev";
			packages = with pkgs; [ python3 uv ];
			shellHook = ''
				export LD_LIBRARY_PATH="${libs}:/run/opengl-driver/lib:$LD_LIBRARY_PATH"
				echo "Python ML shell ready — use 'uv add <package>' to install packages"
			'';
		};

		devShells.${system}.rust = let
			libs = pkgs.lib.makeLibraryPath (with pkgs; [
				wayland
				libxkbcommon
				libGL
				libglvnd
				vulkan-loader
				xorg.libX11
				xorg.libXcursor
				xorg.libXi
				xorg.libXrandr
				xorg.libxcb
				stdenv.cc.cc.lib
			]);
		in pkgs.mkShell {
			name = "rust-iced";

			# buildInputs exposes .pc files so cargo build finds libs via pkg-config
			buildInputs = with pkgs; [
				wayland
				libxkbcommon
				vulkan-loader
				libGL
				xorg.libX11
				xorg.libXcursor
				xorg.libXi
				xorg.libXrandr
			];

			shellHook = ''
				export LD_LIBRARY_PATH="${libs}:/run/opengl-driver/lib:$LD_LIBRARY_PATH"
				export WINIT_UNIX_BACKEND=wayland
				echo "Rust/iced Wayland shell ready"
			'';
		};

		nixosConfigurations = {
			battleship = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs; };
	
				modules = [
					./hardware-configuration.nix
					./configuration.nix
					catppuccin.nixosModules.catppuccin
					home-manager.nixosModules.home-manager
					{
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							extraSpecialArgs = { inherit inputs; };
							users.hc = import ./home/home.nix;
							sharedModules = [
								catppuccin.homeManagerModules.catppuccin
								nix-index-database.hmModules.nix-index
							];
						};
					}
				];
			};
		};
	};
}
