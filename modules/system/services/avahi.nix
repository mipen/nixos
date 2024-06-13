{ pkgs, lib, config, ... }: {

  options = {
    avahi_service.enable = lib.mkEnableOption "enables avahi service";
  };

  config = lib.mkIf config.avahi_service.enable {
    services = {
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
