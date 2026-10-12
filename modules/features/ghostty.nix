{
  self,
  config,
  ...
}: {
  # Same font, padding and github-dark colors as foot.
  flake.homeModules.ghostty = {
    pkgs,
    lib,
    ...
  }: {
    home.packages = [pkgs.monaspace];
    programs.ghostty = {
      enable = true;
      package =
        if pkgs.stdenv.hostPlatform.isDarwin
        then pkgs.ghostty-bin
        else pkgs.ghostty;
      settings = {
        font-family = "Monaspace Krypton";
        font-size = lib.mkDefault 13;
        window-padding-x = 8;
        window-padding-y = 8;
        theme = "github-dark";
        macos-option-as-alt = true;
      };
      themes.github-dark = {
        palette = [
          "0=#000000"
          "1=#f78166"
          "2=#56d364"
          "3=#e3b341"
          "4=#6ca4f8"
          "5=#db61a2"
          "6=#2b7489"
          "7=#ffffff"
          "8=#4d4d4d"
          "9=#f78166"
          "10=#56d364"
          "11=#e3b341"
          "12=#6ca4f8"
          "13=#db61a2"
          "14=#2b7489"
          "15=#ffffff"
        ];
        background = "#101216";
        foreground = "#8b949e";
        cursor-color = "#c9d1d9";
        selection-background = "#3b5070";
        selection-foreground = "#ffffff";
      };
    };
  };

  flake.nixosModules.ghostty = {
    home-manager.users.${config.username}.imports = [self.homeModules.ghostty];
  };
}
