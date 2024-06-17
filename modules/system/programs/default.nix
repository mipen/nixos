{ pkgs, lib, config, inputs, ... }: {
  imports = [ ./hyprland.nix ./thunar.nix ];

  thunar_module.enable = lib.mkDefault true;
  hyprland_module.enable = lib.mkDefault true;
  # nix-index_module.enable = lib.mkDefault false;

  programs = {
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    virt-manager.enable = true;
  };
}
