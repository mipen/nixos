{ pkgs, lib, config, ... }: {
    imports = [
        ./programs
        ./gtk_theme.nix
        ./qt_theme.nix
    ];
}