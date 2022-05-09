{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.modules.git;
in
{

  options = {
    modules.git.enable = mkEnableOption "git";
  };

  config = mkIf cfg.enable {
    hm.programs.git = {
      enable = true;
      userName = "estebanheish";
      userEmail = "estebanheish@gmail.com";
    };
  };

}

