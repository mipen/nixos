{ pkgs, lib, config, ... }: {

  options = { misc_module.enable = lib.mkEnableOption "enables misc"; };

  config = lib.mkIf config.misc_module.enable {
    wayland.windowManager.hyprland = {
      settings = {
        misc = {
          mouse_move_enables_dpms = true;
          key_press_enables_dpms = false;
          disable_hyprland_logo = false;
          animate_manual_resizes = true;
        };
      };
    };
  };
}
