{ pkgs, lib, config, configPath, ... }: {

  options = { fonts.enable = lib.mkEnableOption "enables fonts home folder"; };

  config = lib.mkIf config.fonts.enable {
    home.file.".local/share/fonts" = {
      source = "${configPath}/fonts";
      recursive = true;
    };
  };
}
