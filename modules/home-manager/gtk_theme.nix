{ pkgs, lib, config, gtkThemeFromScheme, ... }: {

  options = {
    gtk_theme.enable = 
      lib.mkEnableOption "enables gtk_theme";
  };

  config = lib.mkIf config.gtk_theme.enable {
    gtk = {
        enable = true;
        font = {
            name = "Ubuntu";
            size = 12;
            package = pkgs.ubuntu_font_family;
        };
            theme = {
                name = "${config.colorScheme.slug}";
                package = gtkThemeFromScheme { scheme = config.colorScheme; };
        };
        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme;
        };
        gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = 1;
        };
        gtk4.extraConfig = {
            gtk-application-prefer-dark-theme = 1;
        };
    };
  };
}
