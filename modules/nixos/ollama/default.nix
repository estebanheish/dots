{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  disabledModules = ["services/misc/ollama.nix"];
  imports = [
    "${inputs.master}/nixos/modules/services/misc/ollama.nix"
  ];

  services.ollama = {
    enable = true;
    acceleration = "rocm";
    package = outputs.packages.${pkgs.system}.ollama;
    rocmOverrideGfx = "11.0.0";
    environmentVariables = {
      OLLAMA_KEEP_ALIVE = "60m";
    };
  };

  environment.systemPackages = [inputs.teja.packages.${pkgs.system}.default];

  # https://github.com/NixOS/nixpkgs/pull/325224
  # services.open-webui = {
  #   enable = true;
  #   port = 11111;
  #   openFirewall = true;
  #   environment = {
  #     OLLAMA_API_BASE_URL = "http://localhost:11434";
  #     WEBUI_AUTH = "False";
  #   };
  # };
}
