{...}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "grape" = {
        hostname = "192.168.0.116";
        user = "heis";
      };
      "nyx" = {
        hostname = "192.168.0.176";
        user = "heis";
      };
    };
  };
}
