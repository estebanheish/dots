{
  description = "heis dots";

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

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      userEnv = builtins.getEnv "USER";
      user = if builtins.elem userEnv [ "" "root" ] then "heis" else userEnv;
      modules = [
        (import ./nixos)
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${user} = import ./home;
            extraSpecialArgs = { inherit inputs user; };
          };
        }
        inputs.hyprland.nixosModules.default
        ({ config, pkgs, ... }: { nixpkgs.overlays = [ (import ./overlays/default.nix) ]; })
      ];
    in
    {
      nixosConfigurations.nyx = let system = "x86_64-linux"; in
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = modules ++ [ ./hosts/nyx ({ ... }: { home-manager.extraSpecialArgs = { inherit system; }; }) ];
          specialArgs = { inherit system inputs user; };
        };

      nixosConfigurations.lemon = let system = "x86_64-linux"; in
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = modules ++ [ ./hosts/lemon ({ ... }: { home-manager.extraSpecialArgs = { inherit system; }; }) ];
          specialArgs = { inherit system inputs user; };
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
