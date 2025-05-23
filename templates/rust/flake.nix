{
  description = "simple rust flake";

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
      default = pkgs.mkShell rec {
        name = "nix";
        packages = with pkgs; [
          rustc
          cargo
          rustfmt
          rustPackages.clippy
          rust-analyzer

          # libxkbcommon
          # libGL
          # alsa-lib
          # udev
          # vulkan-loader
          # wayland

          # pkg-config
          # clang
          # mold
        ];
        # LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath packages}";
      };
    });

    packages = forAllSystems ({pkgs}: {
      default = pkgs.rustPlatform.buildRustPackage {
        pname = "rust";
        version = "0.0.1";

        src = ./rust;

        cargoLock = {
          lockFile = ./rust/Cargo.lock;
        };

        # buildInputs = with pkgs; [];
        # nativeBuildInputs = with pkgs; [
        #   pkg-config
        # ];
      };
    });
  };
}
