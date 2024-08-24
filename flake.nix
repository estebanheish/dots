{
  description = "Heis dots";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = ["aarch64-linux" "i686-linux" "x86_64-linux" "aarch64-darwin" "x86_64-darwin"];
    forAllSystems = nixpkgs.lib.genAttrs systems;

    mkNixos = user: modules:
      nixpkgs.lib.nixosSystem {
        inherit modules;
        specialArgs = {inherit inputs outputs user;};
      };

    mkHome = user: modules: system:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {inherit system;};
        inherit modules;
        extraSpecialArgs = {inherit inputs outputs user;};
      };
  in {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;
    templates = import ./templates;
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

    nixosConfigurations = {
      nyx = mkNixos "heis" [./hosts/nyx];
      clank = mkNixos "heis" [./hosts/clank];
      rivet = mkNixos "heis" [./hosts/rivet];
      wololo = mkNixos "heis" [./hosts/wololo];
      grape = mkNixos "heis" [./hosts/grape];
      lemon = mkNixos "heis" [./hosts/lemon];
    };

    homeConfigurations = let
      user = builtins.getEnv "USER";
    in {
      "${user}" = mkHome user [./homes/shell] builtins.currentSystem;
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    master.url = "github:nixos/nixpkgs/master";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    raspberry-pi-nix.url = "github:nix-community/raspberry-pi-nix";
    wezterm.url = "github:wez/wezterm?dir=nix";
    reja.url = "github:estebanheish/reja";

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "master";
    };
  };
}
