{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.modules.qemu;
in
{

  options = {
    modules.qemu.enable = mkEnableOption "qemu";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ qemu quickemu ];
  };

}
