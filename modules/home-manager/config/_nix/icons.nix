{ pkgs, lib, config, configPath, ... }: {

  options = { wlogout_icons.enable = lib.mkEnableOption "enables wlogout icons home folder"; };

  config = lib.mkIf config.wlogout_icons.enable {
    home.file.".config/wlogout/icons" = {
      source = "${configPath}/wlogout";
      recursive = true;
    };
  };
}
