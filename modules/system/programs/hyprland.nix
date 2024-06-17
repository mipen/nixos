{ pkgs, lib, config, inputs, servicesPath, ... }: {

  imports = [ (servicesPath + "/sddm.nix") ];

  options = { hyprland_module.enable = lib.mkEnableOption "enables hyprland"; };

  config = lib.mkIf config.hyprland_module.enable {
    sddm_service.enable = true;
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
  };
}
