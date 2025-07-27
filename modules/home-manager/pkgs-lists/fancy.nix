{pkgs, ...}: {
  imports = [
    ../lazygit
  ];
  home.packages = with pkgs; [
    # file sync
    rsync
    sshfs
    restic

    caligula

    # video/audio processing
    pkgs.master.ffmpeg_7-full
    imagemagick

    # basic utils
    # pciutils
    # usbutils
    # bc
    fzf
    tree
    mediainfo
    efibootmgr
    # pipe-rename
    (libqalculate.override {gnuplot = gnuplot_qt;})
    gnuplot_qt

    # Modern UNIX utitlities
    bat # cat
    # procs
    # delta # syntax-highlighting pager for git, diff and grep output
    # duf # df
    # du-dust # du
    # fd # find
    # ripgrep # grep
    # procs # ps
    # bottom # htop / top
    hyperfine # time
    xh # curl
    # dog # dig
    # sd # sed
    # grex
    # lazygit
    # tealdeer
    # jq
    jless
    # pup
    nethogs
    # gitoxide
  ];
}
