{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.scripts;
in
{
  options = {
    modules.scripts.enable = mkEnableOption "bin/scripts in path";
  };

  config = mkIf cfg.enable {
    environment.localBinInPath = true;
    hm.home.file.".local/bin" = {
      source = ./../../bin/scripts;
      recursive = true;
    };
  };
}
