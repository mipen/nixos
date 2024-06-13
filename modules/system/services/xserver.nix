{ pkgs, lib, config, ... }: {
  options = {
    xserver_service.enable = lib.mkEnableOption "enable xserver service";
  };

  config = lib.mkIf config.xserver_service.enable {
    services = {
      xserver = {
        enable = true;
        desktopManager.cinnamon.enable = false;
        xkb = {
          layout = "us";
          variant = "";
        };
      };
    };
  };
}
