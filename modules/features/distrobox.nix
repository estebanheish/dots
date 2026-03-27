{...}: {
  flake.nixosModules.distrobox = {pkgs, ...}: {
    environment.systemPackages = [pkgs.distrobox];
    imports = [./podman.nix];
  };
}
