{...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "estebanheish";
        email = "estebanheish@gmail.com";
      };
      aliases = {
        s = "status";
        d = "diff";
        ds = "diff --staged";
        A = "add -A";
      };
    };
    # delta = {
    #   enable = true;
    # };
  };
}
