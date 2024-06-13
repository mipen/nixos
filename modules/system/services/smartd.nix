{ pkgs, lib, config, ... }: {

  options = {
    smartd_service.enable = lib.mkEnableOption "enables smartd service";
  };

  config = lib.mkIf config.smartd_service.enable {
    services = {
      smartd = {
        enable = true;
        autodetect = true;
      };
    };
  };
}
