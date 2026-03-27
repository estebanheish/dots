{...}: {
  flake.nixosModules.steam = {pkgs, ...}: {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      package = pkgs.steam.override {
        extraArgs = "-system-composer -silent";
      };
    };
    environment.systemPackages = with pkgs; [
      SDL2
    ];
  };
}
