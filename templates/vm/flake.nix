# nix build .#nixosConfigurations.default.config.system.build.vm
{
  description = "simple vm";

  inputs = {nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";};

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({...}: {
          networking.hostName = "simple";
          users.users.root.initialPassword = "rr";
          services.openssh = {
            enable = true;
            settings = {
              PasswordAuthentication = true;
              PermitRootLogin = "yes";
            };
          };
          networking.firewall.enable = false;
          virtualisation.vmVariant = {
            virtualisation = {
              cores = 4;
              memorySize = 8192;
              graphics = false;
              diskSize = 51200;
              forwardPorts = [
                {
                  # ssh
                  from = "host";
                  host.port = 2222;
                  guest.port = 22;
                }
              ];
            };
          };
        })
      ];
      # specialArgs = {inherit inputs self;};
    };
  };
}
