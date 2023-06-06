{pkgs, ...}: {
  services.nginx = {
    enable = true;
    additionalModules = [pkgs.nginxModules.rtmp];
    config = ''
      rtmp {
        server {
                listen 1935;
                chunk_size 4096;

                application live {
                        live on;
                        record off;
                }
        }
      }
    '';
  };
}
