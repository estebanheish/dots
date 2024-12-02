{...}: {
  networking = {
    stevenblack = {
      enable = false;
      block = ["fakenews" "gambling" "porn" "social"];
    };
    extraHosts = ''
      192.168.18.4 wololo
      127.0.0.1 llm
      # 0.0.0.0 www.youtube.com
      # 0.0.0.0 www.twitch.tv
      # 0.0.0.0 www.amazon.es
      # 0.0.0.0 www.ebay.com
      # 0.0.0.0 www.pccomponentes.com
    '';
  };
}
