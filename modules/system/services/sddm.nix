{ pkgs, lib, config, ... }: {

  options = {
    sddm_service.enable =
      lib.mkEnableOption "enables sddm service";
  };

  config = lib.mkIf config.sddm_service.enable {
    services = {
      displayManager.sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
        theme = "sugar-dark";
      };
    };
  };
}
