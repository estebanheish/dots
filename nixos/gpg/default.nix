{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.gpg;
in {
  options = {
    modules.gpg.enable = mkEnableOption "gpg";
  };

  config = mkIf cfg.enable {
    programs.gnupg.agent = {
      enable = true;
    };
  };
}
