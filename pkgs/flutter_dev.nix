{ config, pkgs, host, inputs, username, options, ... }: {
  environment.systemPackages = with pkgs; [ android-studio flutter ];
}
