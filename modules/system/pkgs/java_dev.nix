{ config, pkgs, host, inputs, username, options, ... }: {
    environment.systemPackages = [
        jetbrains.idea-ultimate
    ];
}