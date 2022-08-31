{
  description = "Personal NixOS config";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixgkgs.follows = "nixpkgs";
    nixos-hardware.url = github:NixOS/nixos-hardware/master;
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware }:
    let
      modules = [
        (import ./modules)
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
        # overlay
        ({ config, pkgs, ... }: { nixpkgs.overlays = [ (import ./overlays/default.nix) ]; })
      ];
    in
    {

      nixosConfigurations.nyx = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = modules ++ [ ./hosts/nyx ];
      };

      nixosConfigurations.qemu-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = modules ++ [ ./hosts/qemu-vm ];
      };

      nixosConfigurations.lemon = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = modules ++ [ ./hosts/lemon ];
      };

      nixosConfigurations.grape = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = modules ++ [
          nixos-hardware.nixosModules.raspberry-pi-4
          ./hosts/grape
        ];
      };

    };
}
