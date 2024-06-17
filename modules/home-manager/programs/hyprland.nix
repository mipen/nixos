{ pkgs, config, lib, inputs, username, host, hostsPath, ... }:

let
  theme = config.lib.stylix.colors;
  hyprplugins = inputs.hyprland-plugins.packages.${pkgs.system};
  inherit (import "${hostsPath}/${host}/variables.nix")
    browser borderAnim terminal;
in with lib; {
  imports = [ inputs.hyprland.homeManagerModules.default ./hyprland ];

  options = { hyprland_module.enable = lib.mkEnableOption "enables hyprland"; };

  config = lib.mkIf config.hyprland_module.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      plugins = [ hyprplugins.hyprexpo ];
      settings = {
        "plugins:hyprexpo" = {
          columns = 3;
          gap_size = 5;
          bg_col = "rgb(111111)";
          workspace_method =
            "center current"; # [center/first] [workspace] e.g. first 1 or center m+1

          enable_gesture = true; # laptop touchpad
          gesture_fingers = 3; # 3 or 4
          gesture_distance = 300; # how far is the "max"
          gesture_positive = true; # positive = swipe down. Negative = swipe up.
        };
        bind = [ "SUPER, grave, hyprexpo:expo, toggle" ];
      };
    };
  };
}
