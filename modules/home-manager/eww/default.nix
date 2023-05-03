{
  inputs,
  pkgs,
  colors,
  ...
}: let
  images = pkgs.stdenv.mkDerivation {
    pname = "eww-images";
    version = "0.0.1";

    src = ../../../configs/eww/svg;

    nativeBuildInputs = [pkgs.librsvg];

    buildPhase = ''
      mkdir -p out/audio
      find -name "*.svg" | while read -r file; do
        rsvg-convert -w 512 -a <(sed "s/iconcolor/${colors.foreground}/g" "''${file}") -o "out/''${file%.*}.png"
      done
    '';

    installPhase = ''
      cp -r ./out $out
    '';
  };
in {
  home.packages = [
    pkgs.eww-wayland
    inputs.eww-scripts.packages.${pkgs.system}.default
  ];

  xdg.configFile = {
    "eww/eww.yuck".source = ../../../configs/eww/eww.yuck;
    "eww/eww.scss".source = ../../../configs/eww/eww.scss;
    "eww/scripts" = {
      source = ../../../configs/eww/scripts;
      recursive = true;
    };
    "eww/images".source = images;
    "eww/colors.scss".text = ''
      $foreground: #${colors.foreground};
      $background: #${colors.background};
      $backgroundrgba: ${colors.backgroundrgba};
      $focus: #${colors.focus};
    '';
  };
}
