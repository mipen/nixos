{ pkgs, lib, config, ... }:
let palette = config.lib.stylix.colors;
in {

  options = { general_module.enable = lib.mkEnableOption "enables general"; };

  config = lib.mkIf config.general_module.enable {
    wayland.windowManager.hyprland = {
      settings = {
        general = {
          gaps_in = 3;
          gaps_out = 6;
          border_size = 2;
          "col.active_border" = lib.mkForce
            "rgba(${palette.base05}ff) rgba(${palette.base00}ff) 45deg";
          "col.inactive_border" = lib.mkForce
            "rgba(${palette.base00}cc) rgba(${palette.base01}cc) 45deg";
          layout = "dwindle";
          resize_on_border = true;
        };

        monitor = lib.mkDefault ",preferred,auto,1";

        layerrule = [ "blur,waybar" "blur,wofi" ];

        windowrule =
          [ "noborder,^(wofi)$" "center,^(wofi)$" "center,^(steam)$" ];

        windowrulev2 = [
          "stayfocused, title:^()$,class:^(steam)$"
          "minsize 1 1, title:^()$,class:^(steam)$"
        ];

        gestures = {
          workspace_swipe = true;
          workspace_swipe_fingers = 3;
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = { new_is_master = true; };
      };
    };
  };
}
