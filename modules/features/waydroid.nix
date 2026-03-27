{...}: {
  flake.nixosModules.waydroid = {...}: {
    virtualisation = {
      waydroid.enable = true;
      lxd.enable = true;
    };
  };
}
