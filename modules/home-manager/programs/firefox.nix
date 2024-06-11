{ pkgs, lib, config, ... }: {

  options = { firefox_module.enable = lib.mkEnableOption "enables firefox"; };

  config =
    lib.mkIf config.firefox_module.enable { programs = { firefox.enable = true; }; };
}
