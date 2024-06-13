{ pkgs, lib, config, ... }: {

  options = { gtk_config.enable = lib.mkEnableOption "enables gtk_config"; };

  config = lib.mkIf config.gtk_config.enable {
    # Theme GTK
    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      gtk3.extraConfig = { gtk-application-prefer-dark-theme = 1; };
      gtk4.extraConfig = { gtk-application-prefer-dark-theme = 1; };
    };
  };
}
