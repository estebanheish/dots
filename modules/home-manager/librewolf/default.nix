{...}: {
  programs.librewolf = {
    enable = true;
    settings = {
      "privacy.clearOnShutdown.history" = false;
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
    };
  };
}
