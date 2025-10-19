{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    master.davinci-resolve
  ];
  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
  };
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa.opencl # Enables Rusticl (OpenCL) support
      rocmPackages.clr.icd
    ];
  };
}
