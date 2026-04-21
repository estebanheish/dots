{
  self,
  inputs,
  config,
  ...
}: {
  flake.nixosModules.clank = {pkgs, ...}: {
    imports = [
      ./_hardware-configuration.nix
      inputs.nixos-hardware.nixosModules.common-cpu-amd
      inputs.nixos-hardware.nixosModules.common-gpu-amd
      inputs.nixos-hardware.nixosModules.common-pc-ssd
      inputs.home-manager.nixosModules.home-manager
      self.nixosModules.pipewire
      self.nixosModules.bluetooth

      self.nixosModules.common
      self.nixosModules.niri
      self.nixosModules.shell
      self.nixosModules.direnv
      # self.nixosModules.llamaswap
      # self.nixosModules.docker
      self.nixosModules.quickemu
      self.nixosModules.syncthing
      self.nixosModules.audiobookshelf
      self.nixosModules.steam
      self.nixosModules.ssh
      # self.nixosModules.zed
      self.nixosModules.wooting
      self.nixosModules.zed
      # self.nixosModules.nix-ld
      # self.nixosModules.hostfile
      self.nixosModules.archEmulation
      self.nixosModules.corePkgs
      self.nixosModules.lspPkgs
      self.nixosModules.downloadsPkgs
      self.nixosModules.fancyPkgs
      self.nixosModules.archivesPkgs
      self.nixosModules.hardwareAccess
      self.nixosModules.nh
      self.nixosModules.nix-ld
    ];

    home-manager.users.${config.username} = {
      home.stateVersion = "25.11";
      home.packages = with pkgs; [
        telegram-desktop
        spotify
        bitwarden-desktop
        nvtopPackages.amd
      ];
    };

    networking.hostName = "clank";
    networking.wireless.iwd.enable = true;
    # networking.firewall = {
    #   allowedTCPPorts = [
    #     22
    #     8000
    #     8080
    #   ];
    #   allowedUDPPorts = [
    #     1900
    #   ];
    # };

    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };

    boot.supportedFilesystems = ["ntfs"];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_zen;
    system.stateVersion = "24.05";
  };

  flake.nixosConfigurations.clank = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.clank
    ];
  };
}
