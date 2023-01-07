{
  description = "estebanheish nixos config";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/master;
    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = github:NixOS/nixos-hardware/master;
    hyprland = {
      url = "github:hyprwm/Hyprland";
      # build with your own instance of nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    # eww.url = "github:elkowar/eww";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      modules = [
        (import ./modules)
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
        inputs.hyprland.nixosModules.default
        # { programs.hyprland.enable = true; }
        # overlay
        ({ config, pkgs, ... }: { nixpkgs.overlays = [ (import ./overlays/default.nix) ]; })
      ];
    in
    {

      nixosConfigurations.nyx = let system = "x86_64-linux"; in
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = modules ++ [ ./hosts/nyx ];
          specialArgs = {
            inherit system;
            inputs = inputs;
          };
        };

      nixosConfigurations.qemu-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = modules ++ [ ./hosts/qemu-vm ];
      };

      nixosConfigurations.lemon = let system = "x86_64-linux"; in
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = modules ++ [ ./hosts/lemon ];
          specialArgs = {
            inherit system;
            inputs = inputs;
          };
        };

      nixosConfigurations.grape = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = modules ++ [
          inputs.nixos-hardware.nixosModules.raspberry-pi-4
          ./hosts/grape
        ];
      };

    };
}
