{ pkgs, lib, config, ... }: {

  options = {
    pipewire_service.enable = lib.mkEnableOption "enables pipewire service";
  };

  config = lib.mkIf config.pipewire_service.enable {
    services = {
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    };
  };
}
