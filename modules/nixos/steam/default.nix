{pkgs, ...}: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;
  environment.systemPackages = with pkgs; [
    SDL2
  ];
}
