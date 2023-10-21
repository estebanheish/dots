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
    };
  };
}
