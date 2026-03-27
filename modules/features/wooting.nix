{...}: {
  flake.nixosModules.wooting = {...}: {
    hardware.wooting.enable = true;
  };
}
