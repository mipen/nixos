{ pkgs, lib, config, ... }: {

  options = { i3wm_module.enable = lib.mkEnableOption "enables i3wm_module"; };

  config = lib.mkIf config.i3wm_module.enable {
    services = { 
        xserver.windowManager.i3 = { 
            enable = true; 
        };
    };
  };
}
