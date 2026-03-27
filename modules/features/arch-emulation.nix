{...}: {
  flake.nixosModules.archEmulation = {...}: {
    boot.binfmt.emulatedSystems = ["aarch64-linux"];
  };
}
