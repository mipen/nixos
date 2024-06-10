{ pkgs, lib, config, ... }: {

  imports = [
    ./animations.nix
    ./binds.nix
    ./decoration.nix
    ./device.nix
    ./general.nix
    ./input.nix
    ./misc.nix
  ];

  animation_module.enable = lib.mkDefault true;
  binds_module.enable = lib.mkDefault true;
  decoration_module.enable = lib.mkDefault true;
  device_module.enable = lib.mkDefault true;
  misc_module.enable = lib.mkDefault true;
  input_module.enable = lib.mkDefault true;
  general_module.enable = lib.mkDefault true;
}
