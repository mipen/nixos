{ config, pkgs, host, inputs, username, options, ... }: {
    environment.systemPackages = with pkgs; [
        pkgs.jetbrains.idea-ultimate
    ];
}