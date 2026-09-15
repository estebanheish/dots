f @ {...}: {
  flake.nixosModules.nushell = {
    pkgs,
    config,
    lib,
    ...
  }: let
    inherit (pkgs) nu_scripts;
    expand = f: l: builtins.concatStringsSep "\n" (map f l);
  in {
    home-manager.users.${f.config.username} = {
      home.packages = [pkgs.nufmt];

      programs.nushell = {
        enable = true;
        package = pkgs.nushell;
        extraConfig = lib.mkBefore (builtins.readFile ../../configs/nushell/config.nu);
      };

      programs.zoxide = {
        enable = true;
        enableNushellIntegration = true;
      };

      programs.atuin = {
        enable = true;
        enableNushellIntegration = true;
        flags = ["--disable-up-arrow"];
        settings = {
          auto_sync = false;
          update_check = false;
          search_mode = "fuzzy";
          history_filter = [
            "^br$"
            "^y$"
            "^lg$"
            "zed .$"
            "^ls$"
            "^mkdir"
          ];
          enter_accept = true;
        };
      };

      xdg.configFile = {
        "nushell/aliases.nu".source = ../../configs/nushell/aliases.nu;
        "nushell/themes" = {
          source = ../../configs/nushell/themes;
          recursive = true;
        };
        "nushell/jujutsu-completions.nu".source = pkgs.runCommand "jujutsu-nushell-completions.nu" {nativeBuildInputs = [pkgs.jujutsu];} ''
          jj util completion nushell > "$out"
        '';
        "nushell/completions.nu".text = expand (s: "use ${nu_scripts}/share/nu_scripts/custom-completions/${s}/${s}-completions.nu *") [
          "nix"
          "git"
          "rg"
          "rustup"
          "man"
          "less"
          "typst"
          "curl"
          "btm"
          "cargo"
          "make"
        ];
      };
    };
  };
}
