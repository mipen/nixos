{ config, pkgs, host, inputs, username, options, sysModsPath, pkgsPath
, wallpapersPath, lib, ... }:

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

    boot.supportedFilesystems = [ "ntfs" ];

    boot.kernelPackages = pkgs.linuxPackages_cachyos;
    boot.kernelParams = [ "reboot=acpi" ];

    hardware.cpu.amd.updateMicrocode =
      lib.mkDefault config.hardware.enableRedistributableFirmware;

    systemd.sleep.extraConfig = ''
      AllowSuspend=yes
      AllowHibernation=no
      AllowHybridSleep=no
      AllowSuspendThenHibernate=yes
      HibernateDelaySec=21600
    '';

    auto-cpufreq_service.enable = true;

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Extra Module Options
    drivers.amdgpu.enable = true;
    drivers.nvidia.enable = false;
    drivers.nvidia-prime = {
      enable = false;
      intelBusID = "";
      nvidiaBusID = "";
    };
    drivers.intel.enable = false;
    vm.guest-services.enable = false;
    local.hardware-clock.enable = false;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
  };
}
