{
  self,
  inputs,
  config,
  ...
}: let
  inherit (config) username;
in {
  flake.darwinModules.conqi = {pkgs, ...}: {
    imports = [
      ./_defaults.nix
      inputs.home-manager.darwinModules.home-manager
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      # Files already on the Mac are renamed instead of failing the switch.
      backupFileExtension = "before-nix";
      users.${username} = {config, ...}: {
        imports = [
          self.homeModules.git
          self.homeModules.shell
          self.homeModules.direnv
          self.homeModules.ssh
          self.homeModules.cli
          self.homeModules.ghostty
        ];
        home.packages = with pkgs; [
          btop
          bun
          cmake
          fzf
          tmux

          # Flutter iOS builds.
          cocoapods
          ios-deploy

          aerospace
          discord
          firefox-bin
          google-chrome
        ];
        programs.ghostty.settings.font-size = 20;
        # macOS starts the login shell without the Nix paths (NixOS sets them for every session).
        programs.nushell.extraEnv = let
          home = config.home.homeDirectory;
        in ''
          $env.PATH = ($env.PATH | split row (char esep) | prepend [
            "${home}/.local/bin"
            "${home}/.cargo/bin"
            "${home}/.shorebird/bin"
            "/etc/profiles/per-user/${username}/bin"
            "/run/current-system/sw/bin"
            "/nix/var/nix/profiles/default/bin"
            "/opt/homebrew/bin"
          ] | uniq)
        '';
        programs.nh = {
          enable = true;
          flake = "${config.home.homeDirectory}/.dots";
        };
        home.stateVersion = "25.11";
      };
    };

    networking.hostName = "conqi";
    system.primaryUser = username;

    users.knownUsers = [username];
    users.users.${username} = {
      uid = 501;
      home = "/Users/${username}";
      shell = pkgs.nushell;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFA0fkLNNFP4Aj+CnpbpLq/uT96TZpiKKeGGtaH+9jK+ estebanheish@gmail.com"
      ];
    };
    environment.shells = [pkgs.nushell];
    services.openssh.enable = true;
    security.sudo.extraConfig = ''
      ${username} ALL=(ALL) NOPASSWD: ALL
    '';

    power = {
      sleep.computer = "never";
      sleep.harddisk = "never";
      restartAfterPowerFailure = true;
    };

    nix = {
      settings = {
        experimental-features = ["nix-command" "flakes"];
        trusted-users = [username];
      };
      gc = {
        automatic = true;
        options = "--delete-older-than 14d";
      };
      optimise.automatic = true;
    };
    nixpkgs = {
      hostPlatform = "aarch64-darwin";
      config.allowUnfree = true;
    };

    system.stateVersion = 6;
  };

  flake.darwinConfigurations.conqi = inputs.nix-darwin.lib.darwinSystem {
    modules = [self.darwinModules.conqi];
  };
}
