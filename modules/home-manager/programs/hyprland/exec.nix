{ pkgs, lib, config, username, ... }: {

  options = { exec_module.enable = lib.mkEnableOption "enables exec"; };

  config = lib.mkIf config.exec_module.enable {
    wayland.windowManager.hyprland = {
      settings = {
        "exec-once" = [
          "dbus-update-activation-environment --systemd --all"
          "systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "killall -q swww;sleep .5 && swww init"
          "nm-applet --indicator"
          "lxqt-policykit-agent"
          "swww img /home/${username}/Pictures/Wallpapers/nord1.png"
          "wallsetter"
          "killall -q waybar;sleep .5 && waybar"
          "killall -q swaync;sleep .5 && swaync"
        ];
      };
    };
  };
}
