{ config, pkgs, host, inputs, username, options, ... }: {
  environment.systemPackages = let
    sugar = pkgs.callPackage ./sddm-sugar-dark.nix { };
    tokyo-night = pkgs.libsForQt5.callPackage ./sddm-tokyo-night.nix { };
  in with pkgs; [
    vscode.fhs
    nixfmt
    fish
    fzf
    neovim
    tmux
    google-chrome
    qemu_kvm
    bridge-utils
    vim
    wget
    killall
    git
    cmatrix
    lolcat
    neofetch
    htop
    libvirt
    lxqt.lxqt-policykit
    mangohud
    lm_sensors
    unzip
    unrar
    libnotify
    eza
    v4l-utils
    ydotool
    wl-clipboard
    lm_sensors
    pciutils
    socat
    cowsay
    ripgrep
    lsd
    lshw
    pkg-config
    meson
    gnumake
    ninja
    symbola
    noto-fonts-color-emoji
    material-icons
    brightnessctl
    virt-viewer
    swappy
    appimage-run
    networkmanagerapplet
    yad
    playerctl
    nh
    nixfmt-rfc-style
    discord
    libvirt
    swww
    grim
    slurp
    gnome.file-roller
    swaynotificationcenter
    imv
    transmission-gtk
    distrobox
    mpv
    gimp
    obs-studio
    rustup
    audacity
    pavucontrol
    tree
    protonup-qt
    font-awesome
    spotify
    neovide
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    sugar.sddm-sugar-dark # Name: sugar-dark
    tokyo-night # Name: tokyo-night-sddm
    pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];
}
