{...}: {
  flake.nixosModules.quickemu = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [quickemu];
    virtualisation.spiceUSBRedirection.enable = true;
  };
}
