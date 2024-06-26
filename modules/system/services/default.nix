{ pkgs, lib, config, ... }: {
  imports = [
    ./xserver.nix
    ./smartd.nix
    ./flatpak.nix
    ./pipewire.nix
    ./syncthing.nix
    ./avahi.nix
    ./i3wm.nix
  ];

  xserver_service.enable = lib.mkDefault true;
  smartd_service.enable = lib.mkDefault true;
  flatpak_service.enable = lib.mkDefault false;
  pipewire_service.enable = lib.mkDefault true;
  syncthing_service.enable = lib.mkDefault true;
  avahi_service.enable = lib.mkDefault true;
  i3wm_service.enable = lib.mkDefault false;

  # Services to start
  services = {
    libinput.enable = lib.mkDefault true;
    openssh.enable = lib.mkDefault true;
    printing.enable = lib.mkDefault true;
    gnome.gnome-keyring.enable = lib.mkDefault true;
    ipp-usb.enable = lib.mkDefault true;
    rpcbind.enable = lib.mkDefault true;
    nfs.server.enable = lib.mkDefault true;
  };
}
