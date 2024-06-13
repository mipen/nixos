{ pkgs, lib, config, ... }: {

  options = {
    displayManager_service.enable =
      lib.mkEnableOption "enables displayManager service";
  };

  config = lib.mkIf config.displayManager_service.enable {
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
