{config, ...}: {
  flake.nixosModules.ssh = {
    home-manager.users.${config.username} = {...}: {
      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
        matchBlocks = {
          "clank" = {
            hostname = "192.168.18.2";
            user = "haros";
          };
          "orbb" = {
            hostname = "192.168.18.3";
            user = "haros";
          };
          "rivet" = {
            hostname = "192.168.18.4";
            user = "haros";
          };
          "nyx" = {
            hostname = "192.168.18.5";
            user = "heis";
          };
          "wololo" = {
            hostname = "192.168.18.6";
            user = "haros";
          };
          "julius" = {
            hostname = "192.168.18.7";
            user = "heis";
          };
          "*" = {
            forwardAgent = false;
            addKeysToAgent = "no";
            compression = false;
            serverAliveInterval = 0;
            serverAliveCountMax = 3;
            hashKnownHosts = false;
            userKnownHostsFile = "~/.ssh/known_hosts";
            controlMaster = "no";
            controlPath = "~/.ssh/master-%r@%n:%p";
            controlPersist = "no";
          };
        };
        extraConfig = ''
          Include ~/.ssh/config.local
        '';
      };
    };
  };
}
