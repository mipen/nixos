{ pkgs, lib, config, ... }: {

  options = { qt_config.enable = lib.mkEnableOption "enables qt_config"; };

  config = lib.mkIf config.qt_config.enable {
    # Theme QT -> GTK
    qt = {
      enable = true;
      platformTheme = "gtk";
      style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
      };
    };
  };
}
