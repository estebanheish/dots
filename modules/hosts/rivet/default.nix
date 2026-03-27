{
  self,
  inputs,
  config,
  ...
}: {
  flake.nixosModules.rivet = {pkgs, ...}: {
    imports = [
      ./_hardware-configuration.nix
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s
      inputs.nixos-hardware.nixosModules.common-pc-ssd

      self.nixosModules.common
      self.nixosModules.pipewire
      self.nixosModules.bluetooth
      self.nixosModules.syncthing
      self.nixosModules.niri
      self.nixosModules.shell
      # self.nixosModules.hostsfile

      self.nixosModules.corePkgs
      self.nixosModules.downloadsPkgs
      self.nixosModules.fancyPkgs
      self.nixosModules.archivesPkgs
    ];

    home-manager.users.${config.username} = {
      home.stateVersion = "25.11";
      home.packages = with pkgs; [
        acpi
        spotify
        # bitwarden-desktop
        # bitwarden-cli
        # logseq
      ];
    };

    networking.hostName = "rivet";
    console.keyMap = "colemak";

    networking.networkmanager.enable = true;
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
    # programs.ssh.startAgent = true;

    boot.supportedFilesystems = ["ntfs"];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    system.stateVersion = "24.05";
  };

  flake.nixosConfigurations.rivet = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.rivet
    ];
  };
}
