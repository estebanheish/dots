{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.virtualization;
in {
  options = {
    modules.virtualization.enable = mkEnableOption "virtualization";
  };

  config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    virtualisation.libvirtd.qemu.ovmf.enable = true;
    users.users.${user}.extraGroups = ["libvirtd"];
    environment.systemPackages = with pkgs; [
      #virtualbox
      gnome.gnome-boxes
      virt-manager
    ];
  };
}
