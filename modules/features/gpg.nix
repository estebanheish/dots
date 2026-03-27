{...}: {
  flake.nixosModules.gpg = {...}: {
    programs.gnupg.agent = {
      enable = true;
    };
  };
}
