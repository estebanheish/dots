{
  inputs,
  pkgs,
  ...
}: {
  flake.nixosModules.hermesAgent = {
    imports = [
      inputs.hermes-agent.nixosModules.default
    ];
    services.hermes-agent = {
      enable = true;
      # settings.model.default = "anthropic/claude-sonnet-4";
      environmentFiles = [
      ];
      addToSystemPackages = true;
      # extraPythonPackages = [
      #   pkgs.python312Packages.python-telegram-bot
      # ];
    };
  };
}
