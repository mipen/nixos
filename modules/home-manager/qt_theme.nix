{ pkgs, lib, config, ... }: {

  options = {
    qt_theme.enable = 
      lib.mkEnableOption "enables qt_theme";
  };

  config = lib.mkIf config.qt_theme.enable {
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