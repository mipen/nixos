{ pkgs, lib, config, ... }:
let palette = config.lib.stylix.colors;
in {

  options = { hyprdots_windowrules_module.enable = lib.mkEnableOption "enables hyprdots_windowrules"; };

  config = lib.mkIf config.hyprdots_windowrules_module.enable {
    wayland.windowManager.hyprland = {
      settings = {
        layerrule = [
          "blur,wofi"
          "ignorezero,wofi"
          "blur,notifications"
          "ignorezero,notifications"
          "blur,swaync-notification-window"
          "ignorezero,swaync-notification-window"
          "blur,swaync-control-center"
          "ignorezero,swaync-control-center"
          "blur,logout_dialog"
        ];

        windowrulev2 = [
          "opacity 0.950 0.950,class:^(firefox)$"
          "opacity 0.950 0.950,class:^(Brave-browser)$"
          "opacity 0.950 0.950,class:^(code-oss)$"
          "opacity 0.950 0.950,class:^(Code)$"
          "opacity 0.950 0.950,class:^(code-url-handler)$"
          "opacity 0.950 0.950,class:^(code-insiders-url-handler)$"
          "opacity 0.950 0.950,class:^(kitty)$"
          "opacity 0.950 0.950,class:^(thunar)$"
          "opacity 0.950 0.950,class:^(org.kde.dolphin)$"
          "opacity 0.950 0.950,class:^(org.kde.ark)$"
          "opacity 0.950 0.950,class:^(nwg-look)$"
          "opacity 0.950 0.950,class:^(qt5ct)$"
          "opacity 0.950 0.950,class:^(qt6ct)$"
          "opacity 0.950 0.950,class:^(kvantummanager)$"
          "opacity 0.950 0.950,class:^(pavucontrol)$"
          "opacity 0.950 0.950,class:^(blueman-manager)$"
          "opacity 0.950 0.950,class:^(nm-applet)$"
          "opacity 0.950 0.950,class:^(nm-connection-editor)$"
          "opacity 0.950 0.950,class:^(org.kde.polkit-kde-authentication-agent-1)$"
          "opacity 0.950 0.950,class:^(polkit-gnome-authentication-agent-1)$"
          "opacity 0.950 0.950,class:^(org.freedesktop.impl.portal.desktop.gtk)$"
          "opacity 0.950 0.950,class:^(org.freedesktop.impl.portal.desktop.hyprland)$"
          "opacity 0.950 0.950,class:^([Ss]team)$"
          "opacity 0.950 0.950,class:^(steamwebhelper)$"
          "opacity 0.950 0.950,class:^(Spotify)$"
          "opacity 0.950 0.950,initialTitle:^(Spotify Free)$"
          "opacity 0.950 0.950,class:^(com.github.rafostar.Clapper)$" # Clapper-Gtk
          "opacity 0.950 0.950,class:^(com.github.tchx84.Flatseal)$" # Flatseal-Gtk
          "opacity 0.950 0.950,class:^(hu.kramo.Cartridges)$" # Cartridges-Gtk
          "opacity 0.950 0.950,class:^(com.obsproject.Studio)$" # Obs-Qt
          "opacity 0.950 0.950,class:^(gnome-boxes)$" # Boxes-Gtk
          "opacity 0.950 0.950,class:^(discord)$" # Discord-Electron
          "opacity 0.950 0.950,class:^(WebCord)$" # WebCord-Electron
          "opacity 0.950 0.950,class:^(ArmCord)$" # ArmCord-Electron
          "opacity 0.950 0.950,class:^(app.drey.Warp)$" # Warp-Gtk
          "opacity 0.950 0.950,class:^(net.davidotek.pupgui2)$" # ProtonUp-Qt
          "opacity 0.950 0.950,class:^(yad)$" # Protontricks-Gtk
          "opacity 0.950 0.950,class:^(Signal)$" # Signal-Gtk
          "opacity 0.950 0.950,class:^(io.github.alainm23.planify)$" # planify-Gtk
          "opacity 0.950 0.950,class:^(io.gitlab.theevilskeleton.Upscaler)$" # Upscaler-Gtk
          "opacity 0.950 0.950,class:^(com.github.unrud.VideoDownloader)$" # VideoDownloader-Gtk
          "opacity 0.950 0.950,class:^(io.gitlab.adhami3310.Impression)$" # Impression-Gtk
          "opacity 0.950 0.950,class:^(io.missioncenter.MissionCenter)$" # MissionCenter-Gtk
          "opacity 0.950 0.950,class:^(io.github.flattool.Warehouse)$" # Warehouse-Gtk
          "float,class:^(org.kde.dolphin)$,title:^(Progress Dialog — Dolphin)$"
          "float,class:^(org.kde.dolphin)$,title:^(Copying — Dolphin)$"
          "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
          "float,class:^(firefox)$,title:^(Library)$"
          "float,class:^(kitty)$,title:^(top)$"
          "float,class:^(kitty)$,title:^(btop)$"
          "float,class:^(kitty)$,title:^(htop)$"
          "float,class:^(vlc)$"
          "float,class:^(kvantummanager)$"
          "float,class:^(qt5ct)$"
          "float,class:^(qt6ct)$"
          "float,class:^(nwg-look)$"
          "float,class:^(org.kde.ark)$"
          "float,class:^(pavucontrol)$"
          "float,class:^(blueman-manager)$"
          "float,class:^(nm-applet)$"
          "float,class:^(nm-connection-editor)$"
          "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
          "float,class:^(Signal)$ # Signal-Gtk"
          "float,class:^(com.github.rafostar.Clapper)$" # Clapper-Gtk
          "float,class:^(app.drey.Warp)$" # Warp-Gtk
          "float,class:^(net.davidotek.pupgui2)$" # ProtonUp-Qt
          "float,class:^(yad)$" # Protontricks-Gtk
          "float,class:^(eog)$" # Imageviewer-Gtk
          "float,class:^(io.github.alainm23.planify)$" # planify-Gtk
          "float,class:^(io.gitlab.theevilskeleton.Upscaler)$" # Upscaler-Gtk
          "float,class:^(com.github.unrud.VideoDownloader)$" # VideoDownloader-Gkk
          "float,class:^(io.gitlab.adhami3310.Impression)$" # Impression-Gtk
          "float,class:^(io.missioncenter.MissionCenter)$" # MissionCenter-Gtk
        ];
      };
    };
  };
}

