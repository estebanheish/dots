{pkgs, ...}: {
  # disabledModules = [
  # "services/misc/ollama.nix"
  # "services/misc/open-webui.nix"
  # ];
  # imports = [
  # Searxng Query URL: http://localhost:8888/search?q=<query>
  # ../searx

  # "${inputs.nixpkgs-master}/nixos/modules/services/misc/ollama.nix"
  # "${inputs.nixpkgs-stable}/nixos/modules/services/misc/open-webui.nix"
  # ];

  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    # package = outputs.packages.${pkgs.stdenv.hostPlatform.system}.ollama;
    # package = pkgs.ollama;
    # rocmOverrideGfx = "11.0.0";
    environmentVariables = {
      OLLAMA_KEEP_ALIVE = "15m";
      OLLAMA_GPU_OVERHEAD = "1000000000";
    };
  };

  # services.open-webui = {
  #   enable = true;
  #   port = 11111;
  #   openFirewall = true;
  #   environment = {
  #     OLLAMA_API_BASE_URL = "http://localhost:11434";
  #     WEBUI_AUTH = "False";
  #   };
  #   # package = pkgs.stable.open-webui;
  # };
}
