{ pkgs, lib, config, host, username, ... }: {

  options = { bash.enable = lib.mkEnableOption "enables bash"; };

  config = lib.mkIf config.bash.enable {
    programs = {
      bash = {
        enable = true;
        enableCompletion = true;
        profileExtra = ''
          #if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
          #  exec Hyprland
          #fi
        '';
        initExtra = ''
          neofetch
          if [ -f $HOME/.bashrc-personal ]; then
            source $HOME/.bashrc-personal
          fi
        '';
        shellAliases = {
          sv = "sudo nvim";
          flake-rebuild =
            "nh os switch --hostname ${host} /home/${username}/sisyphusos";
          flake-update =
            "nh os switch --hostname ${host} --update /home/${username}/sisyphusos";
          gcCleanup =
            "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
          v = "nvim";
          ls = "lsd";
          ll = "lsd -l";
          la = "lsd -a";
          lal = "lsd -al";
          ".." = "cd ..";
          neofetch = "neofetch --ascii ~/.config/ascii-neofetch";
        };
      };
    };
  };
}
