{ pkgs, lib, config, ... }: {

  options = { tmux.enable = lib.mkEnableOption "enables tmux"; };

  config = lib.mkIf config.tmux.enable {
    programs = {
      tmux = {
        enable = true;
        mouse = true;
        disableConfirmationPrompt = true;
        prefix = "C-s";
        plugins = with pkgs; [{
          plugin = tmuxPlugins.catppuccin;
          extraConfig = ''
            set -g @catppuccin_flavour "macchiato"
          '';
        }];
        extraConfig = ''
          set-option -g status-position top
        '';
      };
    };
  };
}
