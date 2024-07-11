{...}: {
  networking = {
    stevenblack = {
      enable = true;
      block = ["fakenews" "gambling" "porn" "social"];
    };
    extraHosts = ''
      192.168.18.4 rivet
      0.0.0.0 www.youtube.com
      0.0.0.0 www.twitch.tv
      0.0.0.0 www.amazon.tv
      0.0.0.0 www.ebay.com
      0.0.0.0 www.pccomponentes.com
    '';
  };
}
