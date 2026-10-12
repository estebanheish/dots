{
  inputs,
  lib,
  moduleLocation,
  ...
}: {
  imports = [inputs.home-manager.flakeModules.home-manager];

  # flake-parts only knows nixosModules; same thing for nix-darwin.
  options.flake.darwinModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
    default = {};
    apply = lib.mapAttrs (k: v: {
      _class = "darwin";
      _file = "${toString moduleLocation}#darwinModules.${k}";
      imports = [v];
    });
  };
}
