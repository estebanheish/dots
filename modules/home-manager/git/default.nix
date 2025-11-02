{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "estebanheish";
        email = "estebanheish@gmail.com";
      };
      aliase = {
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
