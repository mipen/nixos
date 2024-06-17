{ pkgs, lib, config, ... }: {

  imports = [
    ./animations.nix
    ./animations2.nix
    ./binds.nix
    ./decoration.nix
    ./general.nix
    ./input.nix
    ./misc.nix
    ./env.nix
    ./exec.nix
    ./hyprdots_windowrules.nix
  ];

  animation_module.enable = lib.mkDefault false;
  animation_module2.enable = lib.mkDefault true;
  binds_module.enable = lib.mkDefault true;
  decoration_module.enable = lib.mkDefault true;
  misc_module.enable = lib.mkDefault true;
  input_module.enable = lib.mkDefault true;
  general_module.enable = lib.mkDefault true;
  exec_module.enable = lib.mkDefault true;
  env_module.enable = lib.mkDefault true;
  hyprdots_windowrules_module.enable = lib.mkDefault true;
}
