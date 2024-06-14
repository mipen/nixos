{ pkgs, lib, config, ... }: {

  options = { gtk_config.enable = lib.mkEnableOption "enables gtk_config"; };

  config = lib.mkIf config.gtk_config.enable {
    # Theme GTK
    gtk = {
      enable = true;
      iconTheme = {
        name = "Gruvbox-Dark";
        package = pkgs.gruvbox-dark-icons-gtk;
      };
      gtk3.extraConfig = { gtk-application-prefer-dark-theme = 1; };
      gtk4.extraConfig = { gtk-application-prefer-dark-theme = 1; };
    };
  };
}
