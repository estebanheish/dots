{pkgs, ...}: {
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
  };
}
