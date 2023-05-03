{...}: {
  programs.git = {
    enable = true;
    userName = "estebanheish";
    userEmail = "estebanheish@gmail.com";
    delta = {
      enable = true;
      options = {
        side-by-side = true;
      };
    };
    aliases = {
      s = "status";
      d = "diff";
      A = "add -A";
      df = "diff --staged";
    };
  };
}
