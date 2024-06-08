{ pkgs, lib, config, ... }: {
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
}