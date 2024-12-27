{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.zsh;
in {
  options = {
    modules.zsh.enable = mkEnableOption "zsh";
  };

  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      interactiveShellInit = builtins.readFile ./../../config/zsh/zshrc;
      setOptions = ["autocd"];
    };

    environment.sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "ghostty";
      FILE = "broot";
      BROWSER = "qutebrowser";
      READER = "zathura";
      OPENER = "xdg-open";
    };

    environment.shellAliases = import ./aliases.nix;
  };
}
