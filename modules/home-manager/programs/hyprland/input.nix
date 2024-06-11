{ pkgs, lib, config, ... }: {

  options = { input_module.enable = lib.mkEnableOption "enables input"; };

  config = lib.mkIf config.input_module.enable {
    wayland.windowManager.hyprland = {
      settings = {
        input = {
          kb_layout = "us";
          kb_options = [ "grp:alt_shift_toggle" "caps:super" ];
          follow_mouse = 1;
          touchpad = { natural_scroll = true; };
          sensitivity = 0; # -1.0 - 1.0, 0 means no modification."
          accel_profile = "flat";
        };
      };
    };
  };
}
