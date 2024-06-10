{ pkgs, lib, config, ... }: {

  options = { device_module.enable = lib.mkEnableOption "enables devices"; };

  config = lib.mkIf config.device_module.enable {
    wayland.windowManager.hyprland = {
      settings = {
        device = {
          name = "elan0001:00-04f3:327e-touchpad";
          sensitivity = 1.0;
        };
      };
    };
  };
}
