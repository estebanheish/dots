{
  inputs,
  outputs,
  pkgs,
  user,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "en_US.UTF-8";
  # console.keyMap = "us";
  system.stateVersion = "23.05";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user} = {
      imports = [
        ../modules/home-manager/lf
        ../modules/home-manager/nushell
        ../modules/home-manager/helix
        ../modules/home-manager/broot
        ../modules/home-manager/git
        ../modules/home-manager/pkgs-lists/core.nix
      ];
      home.stateVersion = "23.05";
    };
    extraSpecialArgs = {inherit inputs outputs user;};
  };

  users.users.${user} = {
    isNormalUser = true;
    createHome = true;
    initialPassword = "hola";
    shell = pkgs.nushell;
    extraGroups = ["wheel" "audio" "video"];
  };

  nixpkgs.config.allowUnfree = true;
  nix = {
    # settings.allowed-users = ["@wheel" "${user}"];
    gc.automatic = true;
    optimise.automatic = true;
    extraOptions = "experimental-features = nix-command flakes";
  };

  # doas instead of sudo
  security = {
    doas = {
      enable = true;
      extraConfig = "permit nopass :wheel";
    };
    sudo.enable = false;
  };

  environment.systemPackages = with pkgs; [git];
}
