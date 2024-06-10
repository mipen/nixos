{ pkgs, config, lib, inputs, username, host, hostsPath, ... }:

let
  theme = config.lib.stylix.colors;
  hyprplugins = inputs.hyprland-plugins.packages.${pkgs.system};
  inherit (import "${hostsPath}/${host}/variables.nix")
    browser borderAnim terminal extraMonitorSettings;
in with lib; {
  imports = [ inputs.hyprland.homeManagerModules.default ./hyprland ];
  
  options = { };

  config = {
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

      extraConfig = let modifier = "SUPER";
      in concatStrings [''
        env = NIXOS_OZONE_WL, 1
        env = NIXPKGS_ALLOW_UNFREE, 1
        env = XDG_CURRENT_DESKTOP, Hyprland
        env = XDG_SESSION_TYPE, wayland
        env = XDG_SESSION_DESKTOP, Hyprland
        env = GDK_BACKEND, wayland, x11
        env = CLUTTER_BACKEND, wayland
        env = QT_QPA_PLATFORM=wayland;xcb
        env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
        env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
        env = SDL_VIDEODRIVER, wayland
        env = MOZ_ENABLE_WAYLAND, 1
        exec-once = dbus-update-activation-environment --systemd --all
        exec-once = systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
        exec-once = killall -q swww;sleep .5 && swww init
        # exec-once = killall -q waybar;sleep .5 && waybar
        # exec-once = killall -q swaync;sleep .5 && swaync
        exec-once = nm-applet --indicator
        exec-once = lxqt-policykit-agent
        exec-once = swww img /home/${username}/Pictures/Wallpapers/nord1.png
        exec-once = wallsetter
        monitor=,preferred,auto,1
        layerrule = blur,waybar
        layerrule = blur,wofi
        ${extraMonitorSettings}




        windowrule = noborder,^(wofi)$
        windowrule = center,^(wofi)$
        windowrule = center,^(steam)$
        windowrulev2 = stayfocused, title:^()$,class:^(steam)$
        windowrulev2 = minsize 1 1, title:^()$,class:^(steam)$
        gestures {
          workspace_swipe = true
          workspace_swipe_fingers = 3
        }



        plugin {
          hyprtrails {
            color = rgba(${theme.base0A}ff)
          }
        }
        dwindle {
          pseudotile = true
          preserve_split = true
        }
        master {
          new_is_master = true
        }

      ''];
    };
  };
}
