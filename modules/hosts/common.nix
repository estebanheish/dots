{
  self,
  config,
  ...
}: {
  flake.nixosModules.common = {pkgs, ...}: {
    imports = [
      self.nixosModules.git
    ];

    time.timeZone = "Europe/Madrid";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.supportedLocales = ["en_US.UTF-8/UTF-8"];
    console.keyMap = "colemak";

    services.xserver = {
      xkb = {
        layout = "us";
        variant = "colemak";
        options = "grp:win_space_toggle";
      };
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };

    users.users.${config.username} = {
      isNormalUser = true;
      createHome = true;
      initialPassword = "hola";
      shell = pkgs.nushell;
      extraGroups = [
        "wheel"
        "audio"
        "disk"
        "floppy"
        "input"
        "kvm"
        "optical"
        "scanner"
        "storage"
        "video"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFA0fkLNNFP4Aj+CnpbpLq/uT96TZpiKKeGGtaH+9jK+ estebanheish@gmail.com"
      ];
    };
    users.users.root.initialPassword = "hola";

    nixpkgs = {
      config = {
        allowUnfree = true;
      };
      # overlays = [
      #   outputs.overlays.additions
      #   outputs.overlays.modifications
      #   outputs.overlays.stable-packages
      #   outputs.overlays.master-packages
      # ];
    };

    nix = {
      optimise.automatic = true;
      settings.trusted-users = ["@wheel"];
      extraOptions = "experimental-features = nix-command flakes";
    };

    security.sudo-rs = {
      enable = true;
      extraRules = [
        {
          groups = ["wheel"];
          commands = [
            {
              command = "ALL";
              options = ["NOPASSWD"];
            }
          ];
        }
      ];
    };
  };
}
