{...}: {
  networking = {
    stevenblack = {
      enable = true;
      block = ["fakenews" "gambling" "porn" "social"];
    };
    extraHosts = ''
      192.168.18.4 wololo
      127.0.0.1 llm
    '';
  };
}
