{...}: {
  programs.git = {
    enable = true;
    userName = "estebanheish";
    userEmail = "estebanheish@gmail.com";
    delta = {
      enable = true;
    };
    aliases = {
      s = "status";
      d = "diff";
      ds = "diff --staged";
      A = "add -A";
    };
  };
}
