{ pkgs, lib, config, configPath, ... }: {

  options = {
    wallpapers.enable = lib.mkEnableOption "enables wallpapers home folder";
  };

  config = lib.mkIf config.wallpapers.enable {
    home.file."Pictures/Wallpapers" = {
      source = "${configPath}/wallpapers";
      recursive = true;
    };
  };
}
