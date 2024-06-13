{ pkgs, lib, config, configPath, ... }: {
    imports = [
        ./_nix/wallpapers.nix
        ./_nix/icons.nix
        ./_nix/fonts.nix
        ./_nix/ags.nix
    ];

    wallpapers.enable = lib.mkDefault true;
    icons.enable = lib.mkDefault true;
    fonts.enable = lib.mkDefault true;
    ags_config.enable = lib.mkDefault false;
}