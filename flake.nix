{
  description = "Lenni's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # home-manager-config.url = "github:lennihein/home-manager";
    home-manager-config.url = "/home/lenni/home-manager";
  };

 outputs = { self, nixpkgs, home-manager, home-manager-config, ... }: {
    nixosConfigurations = {
      dell = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/common
          ./modules/laptop/default.nix
          ./modules/desktop-environment/default.nix
          ./modules/uncommon/x11.nix
          ./modules/uncommon/boot.nix
          ./modules/uncommon/virtualisation.nix
          ./modules/uncommon/wireshark.nix
          ./hosts/dell/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lenni = home-manager-config.nixosModules.default;
          }
        ];
      };
      ptah = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/common
          ./modules/laptop/default.nix
          ./modules/desktop-environment/default.nix
          ./modules/uncommon/x11.nix
          ./modules/uncommon/boot.nix
          ./modules/uncommon/virtualisation.nix
          ./modules/uncommon/wireshark.nix
          ./modules/uncommon/adguard.nix
          ./hosts/ptah/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lenni = home-manager-config.nixosModules.default;
          }
        ];
      };
    };
  };
}
