{ pkgs, lib, config, ... }:
let palette = config.lib.stylix.colors;
in {

  options = { general_module.enable = lib.mkEnableOption "enables general"; };

  config = lib.mkIf config.general_module.enable {
    wayland.windowManager.hyprland = {
      settings = {
        general = {
          gaps_in = 6;
          gaps_out = 8;
          border_size = 2;
          "col.active_border" = lib.mkForce
            "rgba(${palette.base0C}ff) rgba(${palette.base0D}ff) rgba(${palette.base0B}ff) rgba(${palette.base0E}ff) 45deg";
          "col.inactive_border" = lib.mkForce
            "rgba(${palette.base00}cc) rgba(${palette.base01}cc) 45deg";
          layout = "dwindle";
          resize_on_border = true;
        };
      };
    };
  };
}
