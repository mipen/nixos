{ pkgs, lib, config, ... }: {
    imports = [
        ./programs
        ./gtk_theme.nix
        ./qt_theme.nix
    ];

    config.gtk_theme.enable = true;
    config.qt_theme.enable = true;
}