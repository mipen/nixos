{ config, pkgs, host, inputs, username, options, sysModsPath, pkgsPath
, wallpapersPath, ... }:

{
  imports = [
    ./hardware.nix
    ./users.nix
    "${sysModsPath}/general.nix"
    "${sysModsPath}/nix.nix"
    "${sysModsPath}/hardware"
    "${sysModsPath}/services"
    "${pkgsPath}/base_packages.nix"
    "${pkgsPath}/flutter_dev.nix"
    "${pkgsPath}/java_dev.nix"
    "${sysModsPath}/programs"
    # "${pkgsPath}/ags.nix"
  ];

  options = { };

  config = {

    security.pki.certificateFiles = [ ./cacerts.pem ];

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    environment.systemPackages = [ pkgs.konsole ];

    hardware.cpu.intel.updateMicrocode =
      lib.mkDefault config.hardware.enableRedistributableFirmware;

    # Services to start
    services.xserver.videoDrivers = [ "nvidia" ];
    config.smartd_service.enable = false;

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Enable sound with pipewire.
    sound.enable = false;
    hardware.pulseaudio.enable = false;

    hardware.bluetooth.enable = false;
    hardware.bluetooth.powerOnBoot = false;
    services.blueman.enable = false;

    # Extra Module Options
    drivers.amdgpu.enable = false;
    drivers.nvidia.enable = true;
    drivers.nvidia-prime = {
      enable = false;
      intelBusID = "";
      nvidiaBusID = "";
    };
    drivers.intel.enable = true;
    vm.guest-services.enable = false;
    local.hardware-clock.enable = false;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
  };
}
