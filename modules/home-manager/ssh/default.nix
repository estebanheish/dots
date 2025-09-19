{...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "clank" = {
        hostname = "192.168.18.2";
        user = "heis";
      };
      "orbb" = {
        hostname = "192.168.18.3";
        user = "heis";
      };
      "rivet" = {
        hostname = "192.168.18.4";
        user = "heis";
      };
      "nyx" = {
        hostname = "192.168.18.5";
        user = "heis";
      };
      "wololo" = {
        hostname = "192.168.18.6";
        user = "heis";
      };
      "grape" = {
        hostname = "192.168.18.7";
        user = "heis";
      };
      "lemon" = {
        hostname = "192.168.18.8";
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
}
