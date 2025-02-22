{
  description = "simple devshell";

  inputs = {nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";};

  outputs = {
    self,
    nixpkgs,
  }: let
    allSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

    forAllSystems = fn:
      nixpkgs.lib.genAttrs allSystems
      (system: fn {pkgs = import nixpkgs {inherit system;};});
  in {
    devShells = forAllSystems ({pkgs}: {
      default = pkgs.mkShell {
        name = "nix";
        # shellHook = ''''; # Bash statements that are executed by nix-shell.
        # packages = with pkgs; []; # Add executable packages to the nix-shell environment.
        # inputsFrom = []; # Add build dependencies of the listed derivations to the nix-shell environment.
        # LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath packages;
        # stdenv.cc.cc.lib
      };
    });
  };
}
