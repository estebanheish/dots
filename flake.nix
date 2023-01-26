{
  description = "heis dots";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/master;
    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = github:NixOS/nixos-hardware/master;
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    # eww.url = "github:elkowar/eww";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: let
    userEnv = builtins.getEnv "USER";
    user =
      if builtins.elem userEnv ["" "root"]
      then "heis"
      else userEnv;
    modules = [
      (import ./nixos)
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${user} = import ./home;
          extraSpecialArgs = {inherit inputs user;};
        };
      }
      inputs.hyprland.nixosModules.default
      ({
        config,
        pkgs,
        ...
      }: {nixpkgs.overlays = [(import ./overlays/default.nix)];})
    ];
  in {
    nixosConfigurations.nyx = let
      system = "x86_64-linux";
    in
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules =
          modules
          ++ [
            ({...}: {home-manager.extraSpecialArgs = {inherit system;};})
            ./hosts/nyx
          ];
        specialArgs = {inherit system inputs user;};
      };

    nixosConfigurations.lemon = let
      system = "x86_64-linux";
    in
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules =
          modules
          ++ [
            ({...}: {home-manager.extraSpecialArgs = {inherit system;};})
            ./hosts/lemon
          ];
        specialArgs = {inherit system inputs user;};
      };

    nixosConfigurations.grape = let
      system = "aarch64-linux";
    in
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules =
          modules
          ++ [
            inputs.nixos-hardware.nixosModules.raspberry-pi-4
            ({...}: {home-manager.extraSpecialArgs = {inherit system;};})
            ./hosts/grape
          ];
        specialArgs = {inherit system inputs user;};
      };

    homeConfigurations.shell = let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home
          (
            {...}: {
              home = {
                username = user;
                homeDirectory = "/home/${user}";
                keyboard = {
                  layout = "us";
                  variant = "colemak";
                };
                sessionVariables = {
                  EDITOR = "nvim";
                };
              };
              modules = {
                nushell.enable = true;
                neovim.enable = true;
                broot.enable = true;
                lf.enable = true;
                alacritty.enable = true;
              };
              programs.home-manager.enable = true;
            }
          )
        ];

        extraSpecialArgs = {inherit system inputs user;};
      };
  };
}
