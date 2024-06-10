{ pkgs, lib, config, ... }: {

  options = {
    decoration_module.enable = lib.mkEnableOption "enables decorations";
  };

  config = lib.mkIf config.decoration_module.enable {
    wayland.windowManager.hyprland = {
      settings = {
        decoration = {
          rounding = 10;
          drop_shadow = false;
          blur = {
            enabled = true;
            size = 5;
            passes = 3;
            new_optimizations = "on";
            ignore_opacity = "on";
          };
        };
      };
    };
  };
}
