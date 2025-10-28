{
  description = "Lenni's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-config.url = "github:lennihein/home-manager";
    # home-manager-config.url = "/home/lenni/home-manager";
  };

 outputs = { self, nixpkgs, nixpkgs-stable, home-manager, home-manager-config, ... }: {
    nixosConfigurations = {
      dell = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # Provide extra module arguments for downstream modules
        specialArgs = {
          # Stable package set for modules expecting `pkgsStable`
          pkgsStable = import nixpkgs-stable {
            system = "x86_64-linux";
            config = { allowUnfree = true; }; # keep in sync with nixpkgs config
          };
        };
        modules = [
          ./modules/common
          ./modules/laptop/default.nix
          ./modules/desktop-environment/default.nix
          ./modules/uncommon/x11.nix
          ./modules/uncommon/boot.nix
          ./modules/uncommon/virtualisation.nix
          ./modules/uncommon/wireshark.nix
          ./modules/uncommon/tpm.nix
          ./modules/uncommon/ssh.nix
          ./modules/uncommon/latex.nix
          ./hosts/dell/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # Pass stable pkgs into home-manager modules
            home-manager.extraSpecialArgs = {
              pkgsStable = import nixpkgs-stable {
                system = "x86_64-linux";
                config = { allowUnfree = true; };
              };
            };
            home-manager.users.lenni = home-manager-config.nixosModules.default;
          }
        ];
      };
      ptah = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          pkgsStable = import nixpkgs-stable {
            system = "x86_64-linux";
            config = { allowUnfree = true; };
          };
        };
        modules = [
          ./modules/common
          ./modules/laptop/default.nix
          ./modules/desktop-environment/default.nix
          ./modules/uncommon/x11.nix
          ./modules/uncommon/boot.nix
          ./modules/uncommon/virtualisation.nix
          ./modules/uncommon/wireshark.nix
          ./modules/uncommon/tpm.nix
          ./modules/uncommon/latex.nix
          ./modules/uncommon/adguard.nix
          ./hosts/ptah/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              pkgsStable = import nixpkgs-stable {
                system = "x86_64-linux";
                config = { allowUnfree = true; };
              };
            };
            home-manager.users.lenni = home-manager-config.nixosModules.default;
          }
        ];
      };
    };
  };
}
