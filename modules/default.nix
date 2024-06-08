{ pkgs, lib, config, ... }: {
    imports = [
        ./system
        ./home-manager
        ./packages
    ];
}