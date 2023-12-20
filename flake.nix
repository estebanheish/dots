{
  description = "Heis dots";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    colors = import ./modules/home-manager/themes/monokai_pro.nix;

    forEachSystem = nixpkgs.lib.genAttrs ["x86_64-linux" "aarch64-linux"];
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

    mkNixos = user: modules:
      nixpkgs.lib.nixosSystem {
        inherit modules;
        specialArgs = {inherit inputs outputs user colors;};
      };
    # mkHome = user: modules: pkgs:
    #   home-manager.lib.homeManagerConfiguration {
    #     inherit modules pkgs;
    #     extraSpecialArgs = {inherit inputs outputs user colors;};
    #   };
  in {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;
    templates = import ./templates;
    formatter = forEachPkgs (pkgs: pkgs.alejandra);

    overlays = import ./overlays {inherit inputs outputs;};
    packages = forEachPkgs (pkgs: (import ./pkgs {inherit pkgs;}));

    nixosConfigurations = {
      nyx = mkNixos "heis" [./hosts/nyx];
      grape = mkNixos "heis" [./hosts/grape];
      lemon = mkNixos "heis" [./hosts/lemon];
    };

    homeConfigurations = let
      user = builtins.getEnv "USER";
      system = builtins.currentSystem;
    in {
      "${user}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."${system}";
        modules = [
          ({
            config,
            pkgs,
            user,
            ...
          }: {
            home.username = user;
            home.homeDirectory = "/home/${user}";
            home.stateVersion = "23.05";
            imports = [
              ./modules/home-manager/lf
              ./modules/home-manager/nushell
              ./modules/home-manager/helix
              # ./modules/home-manager/direnv
              ./modules/home-manager/broot
            ];
            home.packages = [pkgs.zoxide];
            programs.home-manager.enable = true;
          })
        ];
        extraSpecialArgs = {inherit inputs outputs user colors;};
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    eww-scripts = {
      url = "github:estebanheish/eww-scripts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
