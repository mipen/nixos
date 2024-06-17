{ pkgs, lib, config, ... }: {

  options = {
    lightdm_service.enable =
      lib.mkEnableOption "enables lightdm service";
  };

  config = lib.mkIf config.lightdm_service.enable {
    services = {
      xserver.displayManager.lightdm.enable = true;
    };
  };
}
