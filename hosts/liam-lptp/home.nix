{ config, pkgs, inputs, username, host, configPath, modsPath
, scriptsPath, programsPath, hostsPath, ... }:
let
  palette = config.lib.stylix.colors;
  inherit (import ./variables.nix) gitUsername gitEmail theme;
in {
  # Home Manager Settings
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11";

  # Import Program Configurations
  imports = [
    # inputs.nix-colors.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default
    "${configPath}/hyprland.nix"
    "${configPath}/swaync.nix"
    "${configPath}/waybar.nix"
    "${configPath}/wlogout.nix"
    "${configPath}/stylix.nix"
    programsPath
  ];

  # Place Files Inside Home Directory
  home.file."Pictures/Wallpapers" = {
    source = "${configPath}/wallpapers";
    recursive = true;
  };
  home.file.".config/wlogout/icons" = {
    source = "${configPath}/wlogout";
    recursive = true;
  };
  home.file.".local/share/fonts" = {
    source = "${configPath}/fonts";
    recursive = true;
  };
  home.file.".config/starship.toml".source = "${configPath}/starship.toml";
  home.file.".config/ascii-neofetch".source = "${configPath}/ascii-neofetch";
  home.file.".base16-themes".source = "${configPath}/base16-themes";
  home.file.".emoji".source = "${configPath}/emoji";
  home.file.".face.icon".source = "${configPath}/face.jpg";
  home.file.".config/neofetch/config.conf".text = ''
    print_info() {
        prin "$(color 6)  ZaneyOS $ZANEYOS_VERSION"
        info underline
        info "$(color 7)  VER" kernel
        info "$(color 2)  UP " uptime
        info "$(color 4)  PKG" packages
        info "$(color 6)  DE " de
        info "$(color 5)  TER" term
        info "$(color 3)  CPU" cpu
        info "$(color 7)  GPU" gpu
        info "$(color 5)  MEM" memory
        prin " "
        prin "$(color 1) $(color 2) $(color 3) $(color 4) $(color 5) $(color 6) $(color 7) $(color 8)"
    }
    distro_shorthand="on"
    memory_unit="gib"
    cpu_temp="C"
    separator=" $(color 4)>"
    stdout="off"
  '';
  home.file.".config/swappy/config".text = ''
    [Default]
    save_dir=/home/${username}/Pictures/Screenshots
    save_filename_format=swappy-%Y%m%d-%H%M%S.png
    show_panel=false
    line_size=5
    text_size=20
    text_font=Ubuntu
    paint_mode=brush
    early_exit=true
    fill_shape=false
  '';

  # Install & Configure Git
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
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  # Scripts
  home.packages = [
    (import "${scriptsPath}/emopicker9000.nix" { inherit pkgs; })
    (import "${scriptsPath}/task-waybar.nix" { inherit pkgs; })
    (import "${scriptsPath}/squirtle.nix" { inherit pkgs; })
    (import "${scriptsPath}/themechange.nix" {
      inherit pkgs;
      inherit host;
      inherit username;
    })
    (import "${scriptsPath}/theme-selector.nix" { inherit pkgs; })
    (import "${scriptsPath}/nvidia-offload.nix" { inherit pkgs; })
    (import "${scriptsPath}/wallsetter.nix" {
      inherit pkgs;
      inherit username;
    })
    (import "${scriptsPath}/web-search.nix" { inherit pkgs; })
    (import "${scriptsPath}/rofi-launcher.nix" { inherit pkgs; })
    (import "${scriptsPath}/screenshootin.nix" { inherit pkgs; })
    (import "${scriptsPath}/list-hypr-bindings.nix" {
      inherit pkgs;
      inherit host;
      inherit hostsPath;
    })
  ];

  programs = { home-manager.enable = true; };
}
