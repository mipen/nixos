{ pkgs, lib, config, host, username, ... }: {

  options = { fish.enable = lib.mkEnableOption "enables fish"; };

  config = lib.mkIf config.fish.enable {
    programs = {
      fish = {
        enable = true;
        shellAliases = {
          sv = "sudo nvim";
          flake-rebuild =
            "nh os switch --hostname ${host} /home/${username}/zaneyos";
          gcCleanup =
            "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
        };
        interactiveShellInit = ''
          set fish_greeting
        '';
      };
    };
  };
}
