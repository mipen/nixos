{ pkgs, lib, config, ... }: {

  options = { wezterm.enable = lib.mkEnableOption "enables wezterm"; };

  config = lib.mkIf config.wezterm.enable {
    programs = {
      wezterm = {
        enable = false;
        extraConfig = ''
          return {
                    color_scheme = "Catppuccin Macchiato",
                  }'';
      };
    };
  };
}
