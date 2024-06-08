{ pkgs, lib, config, ... }:
let palette = config.colorScheme.palette;
in {

  options = { wofi.enable = lib.mkEnableOption "enables wofi"; };

  config = lib.mkIf config.wofi.enable {
    programs = {
      wofi = {
        enable = true;
        settings = {
          allow_images = true;
          prompt = "Run Programs...";
          width = "35%";
          hide_scroll = true;
          term = "kitty";
          show = "drun";
        };
        style = ''
          * {
            font-family: JetBrainsMono Nerd Font Mono,monospace;
            font-weight: bold;
          }
          #window {
            border-radius: 25px;
            border: 2px solid #${palette.base08};
            background: #${palette.base00};
          }
          #input {
            border-radius: 10px;
            border: 2px solid #${palette.base0B};
            margin: 20px;
            padding: 15px 25px;
            background: #${palette.base00};
            color: #${palette.base05};
          }
          #inner-box {
            border: none;
            background-color: transparent;
          }
          #outer-box {
            border: none;
            font-weight: bold;
            font-size: 14px;
          }
          #text {
            border: none;
          }
          #entry {
            margin: 10px 80px;
            padding: 20px 20px;
            border-radius: 10px;
            border: none;
          }
          #entry:focus {
            border: none;
          }
          #entry:hover {
            border: none;
          }
          #entry:selected {
            background-color: #${palette.base0F};
            color: #${palette.base00};
          }
        '';
      };
    };
  };
}
