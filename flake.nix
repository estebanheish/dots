{
  description = "Heis dots";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;

    forEachSystem = nixpkgs.lib.genAttrs ["x86_64-linux" "aarch64-linux"];
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

    mkNixos = user: modules:
      nixpkgs.lib.nixosSystem {
        inherit modules;
        specialArgs = {inherit inputs outputs user;};
      };

    mkHome = user: modules: pkgs:
      home-manager.lib.homeManagerConfiguration {
        inherit modules pkgs;
        extraSpecialArgs = {inherit inputs outputs user;};
      };
  in {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;
    templates = import ./templates;
    formatter = forEachPkgs (pkgs: pkgs.alejandra);

    overlays = import ./overlays {inherit inputs outputs;};
    packages = forEachPkgs (pkgs: (import ./pkgs {inherit pkgs;}));

    nixosConfigurations = {
      nyx = mkNixos "heis" [./hosts/nyx];
    };

    homeConfigurations = {
      "heis@nyx" = mkHome "heis" [./modules/home-manager] nixpkgs.legacyPackages."x86_64-linux";
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    eww-scripts = {
      url = "github:estebanheish/eww-scripts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
