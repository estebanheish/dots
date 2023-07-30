{pkgs, ...}: {
  home.packages = with pkgs; [
    # editors
    # neovim
    helix

    # downloads
    wget
    yt-dlp
    ytmdl
    transmission
    gallery-dl

    # archives
    unzip
    unrar
    gnutar

    # file sync
    rsync
    sshfs

    # video/audio processing
    ffmpeg_5
    imagemagick

    # basic utils
    # nnn
    tmux
    pciutils
    usbutils
    parted
    killall
    bc
    git
    fzf
    tree
    file
    tmate
    mediainfo
    efibootmgr
    pipe-rename

    # Modern UNIX utitlities
    bat # cat
    delta # syntax-highlighting pager for git, diff and grep output
    duf # df
    du-dust # du
    fd # find
    ripgrep # grep
    procs # ps
    choose # cut / awk
    bottom # htop / top
    hyperfine # time
    xh # curl
    dog # dig
    sd # sed
    jq # sed for json data
    grex
    tealdeer
  ];
}
