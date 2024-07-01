{...}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "clank" = {
        hostname = "192.168.18.2";
        user = "heis";
      };
      "nyx" = {
        hostname = "192.168.18.3";
        user = "heis";
      };
      "rivet" = {
        hostname = "192.168.18.4";
        user = "heis";
      };
      "rivetw" = {
        hostname = "192.168.18.5";
        user = "heis";
      };
      "grape" = {
        hostname = "192.168.18.6";
        user = "heis";
      };
      "lemon" = {
        hostname = "192.168.18.7";
        user = "heis";
      };
    };
  };
}
