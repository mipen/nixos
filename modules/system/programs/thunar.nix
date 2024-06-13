{ pkgs, lib, config, ... }: {
  options = { thunar_module.enable = lib.mkEnableOption "enables thunar"; };
  config = lib.mkIf config.thunar_module.enable {
    programs = {
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
      };
    };
  };
}
