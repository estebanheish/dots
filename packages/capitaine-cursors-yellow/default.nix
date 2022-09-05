{ stdenvNoCC }:

stdenvNoCC.mkDerivation rec {
  pname = "capitaine-cursors-yellow";
  version = "0";

  src = ./src;

  installPhase = ''
    install -dm 0755 $out/share/icons
    cp -pr capitan-yellow $out/share/icons/capitan-yellow
  '';
}
