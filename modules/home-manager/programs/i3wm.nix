{ pkgs, lib, config, ... }: {

  options = { i3wm_module.enable = lib.mkEnableOption "enables i3wm_module"; };

  config = lib.mkIf config.i3wm_module.enable {
    xsession.windowManager.i3 = { 
        enable = true;
    };
  };
}
