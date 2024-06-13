{ pkgs, lib, config, username, ... }: {

  options = {
    syncthing_service.enable = lib.mkEnableOption "enables syncthing service";
  };

  config = lib.mkIf config.syncthing_service.enable {
    services = {
      syncthing = {
        enable = false;
        user = "${username}";
        dataDir = "/home/${username}";
        configDir = "/home/${username}/.config/syncthing";
      };
    };
  };
}
