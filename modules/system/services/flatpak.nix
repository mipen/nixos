{ pkgs, lib, config, ... }: {

  options = {
    flatpak_service.enable = lib.mkEnableOption "enables flatpak service";
  };

  config = lib.mkIf config.flatpak_service.enable {
    services = { flatpak.enable = false; };
    systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };
}
