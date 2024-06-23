{ pkgs, lib, config, ... }: {

  options = { auto-cpufreq_service.enable = lib.mkEnableOption "enables auto-cpufreq"; };

  config = lib.mkIf config.auto-cpufreq_service.enable {
    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
