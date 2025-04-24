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
      clank = mkNixos "heis" [./hosts/clank];
      orbb = mkNixos "heis" [./hosts/orbb];
      rivet = mkNixos "heis" [./hosts/rivet];
      wololo = mkNixos "heis" [./hosts/wololo];
      nyx = mkNixos "heis" [./hosts/nyx];
      lemon = mkNixos "heis" [./hosts/lemon];
      grape = mkNixos "heis" [./hosts/grape];
    };

    homeConfigurations = let
      user = builtins.getEnv "USER";
    in {
      "shell" = mkHome user [./homes/shell] builtins.currentSystem;
      "wm" = mkHome user [./homes/wm] builtins.currentSystem;
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    raspberry-pi-nix.url = "github:nix-community/raspberry-pi-nix";

    # hyprland = {
    #   url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    #   inputs.nixpkgs.follows = "nixpkgs-master";
    # };

    # nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    # ghostty.url = "github:ghostty-org/ghostty";
  };
}
