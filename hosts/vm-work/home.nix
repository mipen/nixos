{ config, pkgs, inputs, username, host, configPath, modsPath, scriptsPath
, programsPath, hostsPath, ... }: {

  imports = [ configPath programsPath ];

  options = { };

  config = {
    hyprdots_windowrules_module.enable = false;
    wayland.windowManager.hyprland.settings.monitor = ",3840x2160@60,auto,1";
  };

}
