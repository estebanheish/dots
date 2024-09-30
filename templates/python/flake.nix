{
  description = "simple python flake";

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
        packages = with pkgs; [
          pyright
          black
          (python312.withPackages (ps:
            with ps; [
            ]))
        ];
      };
    });
  };
}
