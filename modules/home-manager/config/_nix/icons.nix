{ pkgs, lib, config, configPath, ... }: {

  options = { icons.enable = lib.mkEnableOption "enables icons home folder"; };

  config = lib.mkIf config.icons.enable {
    home.file.".config/wlogout/icons" = {
      source = "${configPath}/wlogout";
      recursive = true;
    };
  };
}
