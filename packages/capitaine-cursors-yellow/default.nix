{ lib
, stdenvNoCC
, fetchFromGitHub
, fetchpatch
, makeFontsConf
, inkscape
, xcursorgen
, bc
}:

stdenvNoCC.mkDerivation rec {
  pname = "capitaine-cursors-yellow";
  version = "4";

  src = fetchFromGitHub {
    owner = "estebanheish";
    repo = pname;
    rev = "r${version}";
    sha256 = "";
  };

  patches = [
    # Fixes the build on inscape => 1.0, without this it generates empty cursor files
    (fetchpatch {
      name = "inkscape-1.0-compat";
      url = "https://github.com/keeferrourke/capitaine-cursors/commit/9da0b53e6098ed023c5c24c6ef6bfb1f68a79924.patch";
      sha256 = "0lx5i60ahy6a2pir4zzlqn5lqsv6claqg8mv17l1a028h9aha3cv";
    })
  ];

  postPatch = ''
    patchShebangs .
  '';

  # Complains about not being able to find the fontconfig config file otherwise
  FONTCONFIG_FILE = makeFontsConf { fontDirectories = [ ]; };

  buildInputs = [
    inkscape
    xcursorgen
    bc
  ];

  buildPhase = ''
    HOME="$NIX_BUILD_ROOT" ./build.sh --max-dpi xhd --type yellow
  '';

  installPhase = ''
    install -dm 0755 $out/share/icons
    cp -pr dist/dark $out/share/icons/capitaine-cursors
    cp -pr dist/light $out/share/icons/capitaine-cursors-white
  '';
}
