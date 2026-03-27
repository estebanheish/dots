{...}: {
  flake.nixosModules.hostsfile = {...}: {
    networking = {
      stevenblack = {
        enable = true;
        block = ["fakenews" "gambling" "porn" "social"];
      };
      extraHosts = ''
        192.168.18.4 wololo
        127.0.0.1 llm

        127.0.0.1 youtube.com
        127.0.0.1 www.youtube.com
        127.0.0.1 m.youtube.com
        127.0.0.1 googlevideo.com
      '';
    };
  };
}
