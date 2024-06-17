{ config, pkgs, inputs, username, host, configPath, modsPath, scriptsPath
, programsPath, hostsPath, lib, ... }:
let
  inherit (import "${hostsPath}/${host}/variables.nix")
    gitUsername gitEmail theme;
in {
  imports = [
    ./_nix/wallpapers.nix
    ./_nix/icons.nix
    ./_nix/fonts.nix
    ./_nix/ags.nix
    ./_nix/starship.nix
    ./_nix/neofetch.nix
    ./_nix/swappy.nix
    ./_nix/gtk.nix
    ./_nix/qt.nix
  ];

  # Home Manager Settings
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11";

  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
  };

  # Create XDG Dirs
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    configFile = {
      "gtk-4.0/assets".source = lib.mkForce
        "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
      "gtk-4.0/gtk.css".source = lib.mkForce
        "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
      "gtk-4.0/gtk-dark.css".source = lib.mkForce
        "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  # Scripts
  home.packages = [
    (import "${scriptsPath}/task-waybar.nix" { inherit pkgs; })
    (import "${scriptsPath}/nvidia-offload.nix" { inherit pkgs; })
    (import "${scriptsPath}/wallsetter.nix" {
      inherit pkgs;
      inherit username;
    })
    (import "${scriptsPath}/rofi-launcher.nix" { inherit pkgs; })
    (import "${scriptsPath}/screenshootin.nix" { inherit pkgs; })
    (import "${scriptsPath}/list-hypr-bindings.nix" {
      inherit pkgs;
      inherit host;
      inherit hostsPath;
    })
    # (import "${scriptsPath}/python.nix" { inherit pkgs; })
  ];

  programs = { home-manager.enable = true; };

  wallpapers.enable = lib.mkDefault true;
  wlogout_icons.enable = lib.mkDefault true;
  fonts.enable = lib.mkDefault true;
  ags_config.enable = lib.mkDefault false;
  starship_config.enable = lib.mkDefault true;
  neofetch_config.enable = lib.mkDefault true;
  swappy_config.enable = lib.mkDefault true;
  gtk_config.enable = lib.mkDefault true;
  qt_config.enable = lib.mkDefault true;

}
