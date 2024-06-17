{ pkgs, lib, config, servicesPath, ... }: {

  imports = [ (servicesPath + "/lightdm.nix") ];

  options = {
    i3wm_service.enable = lib.mkEnableOption "enables i3wm service";
  };

  config = lib.mkIf config.i3wm_service.enable {
    lightdm_service.enable = true;
    services = { xserver.windowManager.i3 = { enable = true; }; };
  };
}
