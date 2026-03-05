{user, ...}: {
  services.audiobookshelf = {
    enable = true;
    port = 1778;
    host = "0.0.0.0";
    openFirewall = true;
  };
  fileSystems."/var/lib/audiobookshelf/audiobooks" = {
    device = "/home/${user}/Documents/audiolibros";
    options = ["bind" "ro"];
  };
}
