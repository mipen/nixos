{ pkgs, lib, config, ... }: {

  options = { chromium_module.enable = lib.mkEnableOption "enables chromium"; };

  config = lib.mkIf config.chromium_module.enable {
    programs = {
      chromium = {
        enable = true;
        package = pkgs.google-chrome;
        commandLineArgs = [ "--force-dark-mode" ];
      };
    };
  };
}
