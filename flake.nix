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
	};

	outputs = { self, nixpkgs, home-manager, catppuccin, nix-index-database, ... } @ inputs:
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};

	in
	{	
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
