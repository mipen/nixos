{ pkgs, lib, config, configPath, ... }: {

  options = {
    waybar_config2.enable = lib.mkEnableOption "enables waybar_config2";
  };

  config = lib.mkIf config.waybar_config2.enable {
    xdg.portal = {
      enable = true;
      extraPortals =
        [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
      xdgOpenUsePortal = true;
    };
    services.dunst = { enable = true; };
    programs.waybar = { enable = true; };
    home.file.".config/waybar" = {
      source = "${configPath}/waybar";
      recursive = true;
    };
    home.file.".config/dunst" = {
      source = "${configPath}/dunst";
      recursive = true;
    };
    home.file.".local/bin/cliphist.sh".source =
      "${configPath}/waybar/cliphist.sh";
    home.file.".local/bin/keybinds_hint.sh".source =
      "${configPath}/waybar/keybinds_hint.sh";
    home.file.".local/bin/notifications.py".source =
      "${configPath}/waybar/notifications.py";
    home.file.".local/bin/themeselect.sh".source =
      "${configPath}/waybar/themeselect.sh";
    home.file.".local/bin/themeswitch.sh".source =
      "${configPath}/waybar/themeswitch.sh";
    home.file.".local/bin/wbarconfgen.sh".source =
      "${configPath}/waybar/wbarconfgen.sh";
  };
}

