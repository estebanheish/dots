{...}: {
  networking = {
    stevenblack = {
      enable = true;
      block = ["fakenews" "gambling" "porn" "social"];
    };
    extraHosts = ''
      192.168.18.4 wololo
      0.0.0.0 www.youtube.com
      0.0.0.0 www.twitch.tv
      0.0.0.0 www.amazon.es
      0.0.0.0 www.ebay.com
      0.0.0.0 www.pccomponentes.com
    '';
  };
}
