{ pkgs, lib, config, ... }: {

  options = { zoxide.enable = lib.mkEnableOption "enables zoxide"; };

  config = lib.mkIf config.zoxide.enable {
    programs = {
      zoxide = {
        enable = true;
        enableFishIntegration = true;
        enableBashIntegration = true;
        options = [ "--cmd cd" ];
      };
    };
  };
}
