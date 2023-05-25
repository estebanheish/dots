{
  pkgs,
  colors,
  ...
}: let
  bemenu = "${pkgs.bemenu}/bin/bemenu";
  cliphist = "${pkgs.cliphist}/bin/cliphist";
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";

  bargs = ''    -i -p ''' -H 25 \
         --fn 'Ubuntu bold 15' \
         --tb '#${colors.background}' \
         --tf '#${colors.foreground}' \
         --fb '#${colors.background}' \
         --ff '#${colors.foreground}' \
         --nb '#${colors.background}' \
         --nf '#${colors.foreground}' \
         --hb '#${colors.focus_background}' \
         --hf '#${colors.focus}' \
         --sb '#${colors.background}' \
         --sf '#${colors.foreground}' \
         --af '#${colors.white}' \
         --ab '#${colors.background}' \
  '';

  bmenu = pkgs.writeScriptBin "bmenu" "${pkgs.bemenu}/bin/bemenu ${bargs}";
  bmenul = pkgs.writeScriptBin "bmenul" "${pkgs.bemenu}/bin/bemenu -l 20 ${bargs}";
  bmenu-run = pkgs.writeScriptBin "bmenu-run" "${pkgs.bemenu}/bin/bemenu-run ${bargs}";
  bfiles = pkgs.writeScriptBin "bfiles" ''${pkgs.xdg-utils}/bin/xdg-open "$(${pkgs.fd}/bin/fd --search-path ~/Documents --search-path ~/Downloads --search-path ~/Videos --search-path ~/media --search-path /mnt/media -tf | ${pkgs.bemenu}/bin/bemenu -l 20 ${bargs})"'';
  bclip = pkgs.writeScriptBin "bclip" "${cliphist} list | ${bemenu} -l 20 ${bargs} | ${cliphist} decode | ${wl-copy}";
in {
  home.packages = [bmenu bmenul bmenu-run bfiles bclip];
}
