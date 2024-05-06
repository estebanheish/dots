/*
wezterm -> "Ayu Mirage (Gogh)"
helix -> "ayu_mirage"
*/
rec {
  background = "1F2430";
  layer = "12151C";

  text = "cccac2";
  text2 = "A19F99";

  accent = "FFCC66"; # yellow
  accent2 = "695380"; # purple

  flat = false;

  menu = {
    layer = background;
    inherit accent text text2;
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

  notis = {
    inherit background text accent;
  };
}
