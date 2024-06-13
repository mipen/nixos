{ pkgs, lib, config, configPath, ... }: {

  options = {
    ags_config.enable = lib.mkEnableOption "enables ags config home folder";
  };

  config = lib.mkIf config.ags_config.enable {
    home.file.".config/ags" = {
      source = "${configPath}/ags";
      recursive = true;
    };
  };
}
