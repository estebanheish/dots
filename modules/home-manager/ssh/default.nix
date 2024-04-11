{...}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "grape" = {
        hostname = "192.168.18.10";
        user = "heis";
      };
      "nyx" = {
        hostname = "192.168.18.2";
        user = "heis";
      };
      "clank" = {
        hostname = "192.168.18.19";
        user = "heis";
      };
      "lemon" = {
        hostname = "192.168.18.8";
        user = "heis";
      };
      "wololo" = {
        hostname = "192.168.18.14";
        user = "heis";
      };
    };
  };
}
