{...}: {
  flake.nixosModules.tabby = {...}: {
    services.tabby = {
      enable = true;
      acceleration = "rocm";
    };
  };
}
