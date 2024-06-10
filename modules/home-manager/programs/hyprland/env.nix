{ pkgs, lib, config, ... }: {

  options = { env_module.enable = lib.mkEnableOption "enables env"; };

  config = lib.mkIf config.env_module.enable {
    wayland.windowManager.hyprland = {
      settings = {
        env = [
          "NIXOS_OZONE_WL, 1"
          "NIXPKGS_ALLOW_UNFREE, 1"
          "XDG_CURRENT_DESKTOP, Hyprland"
          "XDG_SESSION_TYPE, wayland"
          "XDG_SESSION_DESKTOP, Hyprland"
          "GDK_BACKEND, wayland, x11"
          "CLUTTER_BACKEND, wayland"
          "QT_QPA_PLATFORM=wayland;xcb"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
          "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
          "SDL_VIDEODRIVER, wayland"
          "MOZ_ENABLE_WAYLAND, 1"
        ];
      };
    };
  };
}
