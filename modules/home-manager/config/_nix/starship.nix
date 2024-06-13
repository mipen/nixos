{ pkgs, lib, config, configPath, ... }: {

  options = {
    starship_config.enable = lib.mkEnableOption "enables starship_config";
  };

  config = lib.mkIf config.starship_config.enable {
    home.file.".config/starship.toml".source = "${configPath}/starship.toml";
  };
}
