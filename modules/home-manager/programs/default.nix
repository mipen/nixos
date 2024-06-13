{ pkgs, lib, config, inputs, ... }: {
  imports = [
    ./tmux.nix
    ./wezterm.nix
    ./zoxide.nix
    ./neovim.nix
    ./kitty.nix
    ./starship.nix
    ./gh.nix
    ./wofi.nix
    ./fish.nix
    ./bash.nix
    ./hyprlock.nix
    # ./steam.nix
    ./firefox.nix
    ./ags.nix
    ./hyprland.nix
    ./chromium.nix
    ./waybar_config1.nix
    ./waybar_config2.nix
    ./stylix.nix
    ./swaync.nix
    ./wlogout.nix
  ];

  tmux.enable = lib.mkDefault true;
  wezterm.enable = lib.mkDefault true;
  zoxide.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
  kitty.enable = lib.mkDefault true;
  starship.enable = lib.mkDefault true;
  gh.enable = lib.mkDefault true;
  wofi.enable = lib.mkDefault true;
  fish.enable = lib.mkDefault true;
  bash.enable = lib.mkDefault true;
  hyprlock.enable = lib.mkDefault true;
  # steam.enable = lib.mkDefault false;
  firefox_module.enable = lib.mkDefault false;
  agsmodule.enable = lib.mkDefault true;
  chromium_module.enable = lib.mkDefault true;
  waybar_config1.enable = lib.mkDefault true;
  waybar_config2.enable = lib.mkDefault false; # currently not functioning
  stylix_module.enable = lib.mkDefault true;
  swaync_module.enable = lib.mkDefault true;
  wlogout_module.enable = lib.mkDefault true;
}
