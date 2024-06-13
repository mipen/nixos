{ pkgs, lib, config, ... }: {
  imports = [
    ./xserver.nix
    ./displayManager.nix
    ./smartd.nix
    ./flatpak.nix
    ./pipewire.nix
    ./syncthing.nix
    ./avahi.nix
  ];

  xserver_service.enable = lib.mkDefault true;
  displayManager_service.enable = lib.mkDefault true;
  smartd_service.enable = lib.mkDefault true;
  flatpak_service.enable = lib.mkDefault false;
  pipewire_service.enable = lib.mkDefault true;
  syncthing_service.enable = lib.mkDefault true;
  avahi_service.enable = lib.mkDefault true;

  # Services to start
  services = {
    libinput.enable = true;
    openssh.enable = true;
    printing.enable = true;
    gnome.gnome-keyring.enable = true;
    ipp-usb.enable = true;
    rpcbind.enable = true;
    nfs.server.enable = true;
  };
}
