{
  self,
  inputs,
  config,
  ...
}: {
  flake.nixosModules.orbb = {pkgs, ...}: {
    imports = [
      ./_hardware-configuration.nix
      inputs.nixos-hardware.nixosModules.common-cpu-amd
      inputs.nixos-hardware.nixosModules.common-pc-ssd

      self.nixosModules.common
      self.nixosModules.pipewire
      self.nixosModules.bluetooth
      self.nixosModules.niri
      self.nixosModules.superlight
      self.nixosModules.nvidia
      self.nixosModules.quickemu
      self.nixosModules.syncthing
      # self.nixosModules.hostsfile
      self.nixosModules.nix-ld

      self.nixosModules.lspPkgs
      self.nixosModules.downloadsPkgs
      self.nixosModules.fancyPkgs
      self.nixosModules.archivesPkgs
      self.nixosModules.zed
      self.nixosModules.neovim
    ];

    home-manager.users.${config.username} = {
      home.packages = with pkgs; [
        telegram-desktop
        discord-canary

        spotify
        # bitwarden-desktop
        # bitwarden-cli

        # linuxKernel.packages.linux_zen.perf
        typst
        nvtopPackages.nvidia
        smartcat
      ];
      home.stateVersion = "25.11";
    };

    networking.hostName = "orbb";

    networking.wireless.iwd.enable = true;

    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };

    boot.supportedFilesystems = ["ntfs"];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;
    system.stateVersion = "25.05";
  };

  flake.nixosConfigurations.orbb = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.orbb
    ];
  };
}
