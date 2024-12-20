args @ {pkgs, ...}: let
  isTheme = builtins.hasAttr "theme" args;
  f = t: n:
    if isTheme
    then "#" + t
    else n;
in {
  home.packages = [pkgs.broot];
  xdg.configFile."broot" = {
    source = ../../../configs/broot;
    recursive = true;
  };
  xdg.configFile."broot/skins/auto.hjson".text = ''
    {
        skin: {
            default: "${f args.theme.broot.bg "gray(22)"} None  / gray(20) None"
            tree: "${f args.theme.broot.tree "gray(8)"} None  / gray(4) None"
            parent: gray(18) None  / gray(13) None
            file: gray(22) None  / gray(15) None
            directory: "${f args.theme.broot.accent "ansi(110)"} None bold / ${f args.theme.accent "ansi(110)"} None"
            exe: Cyan None
            link: Magenta None
            pruning: gray(12) None Italic
            perm__: gray(5) None
            perm_r: ansi(94) None
            perm_w: ansi(132) None
            perm_x: ansi(65) None
            owner: ansi(138) None
            group: ansi(131) None
            count: ansi(138) gray(4)
            dates: ansi(66) None
            sparse: ansi(214) None
            content_extract: ansi(29) None
            content_match: ansi(34) None
            device_id_major: ansi(138) None
            device_id_sep: ansi(102) None
            device_id_minor: ansi(138) None
            git_branch: ansi(178) None
            git_insertions: ansi(28) None
            git_deletions: ansi(160) None
            git_status_current: gray(5) None
            git_status_modified: ansi(28) None
            git_status_new: ansi(94) None bold
            git_status_ignored: gray(17) None
            git_status_conflicted: ansi(88) None
            git_status_other: ansi(88) None
            selected_line: None gray(6)  / None gray(4)
            char_match: Green None
            file_error: Red None
            flag_label: gray(15) gray(2)
            flag_value: ansi(178) gray(2) bold
            input: White gray(2)  / gray(15) None
            status_error: gray(22) ansi(124)
            status_job: ansi(220) gray(5)
            status_normal: gray(20) gray(4)  / gray(2) gray(2)
            status_italic: ansi(178) gray(4)  / gray(2) gray(2)
            status_bold: ansi(178) gray(4) bold / gray(2) gray(2)
            status_code: ansi(229) gray(4)  / gray(2) gray(2)
            status_ellipsis: gray(19) gray(1)  / gray(2) gray(2)
            purpose_normal: gray(20) gray(2)
            purpose_italic: ansi(178) gray(2)
            purpose_bold: ansi(178) gray(2) bold
            purpose_ellipsis: gray(20) gray(2)
            scrollbar_track: gray(7) None  / gray(4) None
            scrollbar_thumb: gray(22) None  / gray(14) None
            help_paragraph: gray(20) None
            help_bold: ansi(178) None bold
            help_italic: ansi(229) None
            help_code: gray(21) gray(3)
            help_headers: ansi(178) None
            help_table_border: ansi(239) None
            preview: gray(20) gray(1)  / gray(18) gray(2)
            preview_title: gray(23) gray(2)  / gray(21) gray(2)
            preview_line_number: gray(12) gray(3)
            preview_match: None ansi(29)
            hex_null: gray(8) None
            hex_ascii_graphic: gray(18) None
            hex_ascii_whitespace: ansi(143) None
            hex_ascii_other: ansi(215) None
            hex_non_ascii: ansi(167) None
            staging_area_title: gray(22) gray(2)  / gray(20) gray(3)
            mode_command_mark: gray(5) ansi(204) bold
        }
        syntax_theme: MochaDark
    }
  '';
}
