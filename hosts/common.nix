{
  inputs,
  outputs,
  pkgs,
  user,
  theme,
  config,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = ["en_US.UTF-8/UTF-8"];
  console.keyMap = "colemak";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user} = {
      imports = [
        ../modules/home-manager/yazi
        ../modules/home-manager/nushell
        ../modules/home-manager/helix
        ../modules/home-manager/direnv
        ../modules/home-manager/broot
        ../modules/home-manager/git
        ../modules/home-manager/ssh
        ../modules/home-manager/tmux
        ../modules/home-manager/zellij
        ../modules/home-manager/hunspell
        ../modules/home-manager/pkgs-lists/core.nix
      ];
      home.stateVersion = "25.05";
    };
    extraSpecialArgs = {
      inherit inputs outputs user theme;
      profile = config.system.name;
    };
  };

  users.users.${user} = {
    isNormalUser = true;
    createHome = true;
    initialPassword = "hola";
    shell = pkgs.nushell;
    extraGroups = ["wheel" "audio" "video"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFA0fkLNNFP4Aj+CnpbpLq/uT96TZpiKKeGGtaH+9jK+ estebanheish@gmail.com"
    ];
  };
  users.users.root.initialPassword = "hola";

  nixpkgs = {
    config = {
      allowUnfree = true;
      # permittedInsecurePackages = [
      #   "electron-27.3.11" # TODO: logseq
      # ];
    };
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
      outputs.overlays.master-packages
    ];
  };

  nix = {
    # settings.allowed-users = ["@wheel" "${user}"];
    # gc.automatic = true;
    optimise.automatic = true;
    settings.trusted-users = ["@wheel"];
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

  environment.systemPackages = with pkgs; [
    git
    doas-sudo-shim # for nixos-rebuild --target-host ""--use-remote-sudo""
  ];
}
