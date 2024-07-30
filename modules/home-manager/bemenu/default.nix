{
  pkgs,
  theme,
  ...
}: let
  bemenu = "${pkgs.bemenu}/bin/bemenu";
  cliphist = "${pkgs.cliphist}/bin/cliphist";
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";

  bargs = ''    -i -p ''' -H 25 \
         --fn 'Ubuntu bold 15' \
         --tb '#${theme.background}' \
         --tf '#${theme.foreground}' \
         --fb '#${theme.background}' \
         --ff '#${theme.foreground}' \
         --nb '#${theme.background}' \
         --nf '#${theme.foreground}' \
         --hb '#${theme.focus_background}' \
         --hf '#${theme.focus}' \
         --sb '#${theme.background}' \
         --sf '#${theme.foreground}' \
         --af '#${theme.white}' \
         --ab '#${theme.background}' \
  '';

  bmenu = pkgs.writeScriptBin "bmenu" "${pkgs.bemenu}/bin/bemenu ${bargs}";
  bmenul = pkgs.writeScriptBin "bmenul" "${pkgs.bemenu}/bin/bemenu -l 20 ${bargs}";
  bmenu-run = pkgs.writeScriptBin "bmenu-run" "${pkgs.bemenu}/bin/bemenu-run ${bargs}";
  bfiles = pkgs.writeScriptBin "bfiles" ''${pkgs.xdg-utils}/bin/xdg-open "$(${pkgs.fd}/bin/fd --search-path ~/Documents --search-path ~/Downloads --search-path ~/Videos --search-path ~/media --search-path /mnt/data/media -tf | ${pkgs.bemenu}/bin/bemenu -l 20 ${bargs})"'';
  bclip = pkgs.writeScriptBin "bclip" "${cliphist} list | ${bemenu} -l 20 ${bargs} | ${cliphist} decode | ${wl-copy}";
in {
  home.packages = [bmenu bmenul bmenu-run bfiles bclip];
}
