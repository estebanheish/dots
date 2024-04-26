rec {
  background = "1F1D27";
  layer = "353147";

  text = "f1ebff";
  text2 = "cab2fa";

  accent = "ae91e8"; # purple
  accent2 = "fec38f"; # orange

  flat = false;

  menu = {
    accent = accent2;
    inherit layer text text2;
  };

  bar = {
    accent = accent;
    inherit background layer;
  };

  hyprland = {
    gradient = !flat;
    wall = "space.jpg";
    inherit text accent accent2 layer background;
  };
}
