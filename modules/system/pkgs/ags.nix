{ config, pkgs, host, inputs, username, options, ... }: {
  environment.systemPackages = with pkgs; [ ags ddcutil sass bun ];
}
