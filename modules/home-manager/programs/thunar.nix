{ pkgs, lib, config, ... }: {

  options = { thunar.enable = lib.mkEnableOption "enables thunar"; };

  config = lib.mkIf config.thunar.enable {
    programs = {
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
      };
    };
  };
}
