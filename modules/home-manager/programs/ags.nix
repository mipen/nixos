{ inputs, pkgs, lib, config, configPath, ... }: {

  # imports = [ inputs.ags.homeManagerModules.default ];
  imports = [ ];

  options = { agsmodule.enable = lib.mkEnableOption "enables ags"; };

  config = lib.mkIf config.agsmodule.enable {
    programs = {
      ags = {
        enable = true;
        # configDir = "${configPath}/ags";
        configDir = null; # if ags dir is managed by home-manager, it'll end up being read-only. not too cool.
        extraPackages = with pkgs; [ gtksourceview webkitgtk accountsservice ];
      };
    };
  };
}
