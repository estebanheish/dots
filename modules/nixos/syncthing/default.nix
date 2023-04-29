{user, ...}: {
  services = {
    syncthing = {
      enable = true;
      user = user;
      dataDir = "/home/${user}";
      overrideDevices = false;
      overrideFolders = false;
      folders = {
        "Documents" = {
          label = "Documents";
          path = "/home/${user}/Documents";
        };
        "Videos" = {
          label = "Videos";
          path = "/home/${user}/Videos";
        };
        "Music" = {
          label = "Music";
          path = "/home/${user}/Music";
        };
        "Pictures" = {
          label = "Pictures";
          path = "/home/${user}/Pictures";
        };
      };
    };
  };
}
