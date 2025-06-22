{ pkgs, config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];
  
  #drivers.amdgpu.enable = false;
  /*drivers.intel.enable = true;
  drivers.nvidia.enable = true;
  drivers.nvidia-prime = {
    enable = true;
    intelBusID = "PCI:0:2:0";
    nvidiaBusID = "PCI:1:0:0";
  };*/
  #vm.guest-services.enable = false;
  #local.hardware-clock.enable = true;
  #packages.enable = true;
  #kernel.enable = true;
  
  #system.bootloader-systemd.enable = true;
  
  #system.bootloader-grub.enable = false;
  
  #system.plymouth.enable = true;
  
  #system.audio.enable = true;
  #displayManager.enable = true;
  #system.greetd.enable = false;
  
  #powermanagement.enable = true;
  #system.scheduler.enable = true;
  #myOptions.cliphist.enable = false;
  
  #mine.hypridle.enable = true;
  
  #system.btrfs.enable = false;
  #system.zfs.enable = true;
  #system.zram.enable = true;
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  #catppuccin.tty.enable = true;
  #services.xserver.videoDrivers = ["modesetting" "nvidia"];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  users = {
    mutableUsers = true;
  };
  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    cpupower-gui
    powertop
    thermald
    tlp
    
    libva-utils
    libvdpau-va-gl
    intel-compute-runtime
    intel-vaapi-driver
    vaapiVdpau
    vaapi-intel-hybrid
    mesa
    #egl-wayland
    #pkgs-master.waybar # if wanted experimental next line
  ];
  hardware.graphics = {
    enable = true;
  };
  services = {
    power-profiles-daemon.enable = true;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };
    
    thermald.enable = true;
    tlp.enable = false;
    /*tlp.settings = {
    
      enable = false;
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      #CPU_BOOST_ON_AC = 1;
      #CPU_BOOST_ON_BAT = 1;

      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 1;

      PLATFORM_PROFILE_ON_AC = "balance";
      PLATFORM_PROFILE_ON_BAT = "power";

      INTEL_GPU_MIN_FREQ_ON_AC = 0;
      INTEL_GPU_MIN_FREQ_ON_BAT = 0;
      # INTEL_GPU_MAX_FREQ_ON_AC=0;
      # INTEL_GPU_MAX_FREQ_ON_BAT=0;
      # INTEL_GPU_BOOST_FREQ_ON_AC=0;
      # INTEL_GPU_BOOST_FREQ_ON_BAT=0;

      PCIE_ASPM_ON_AC = "default";
      PCIE_ASPM_ON_BAT = "powersupersave";
    };*/
  };

  powerManagement.cpuFreqGovernor = null;

  boot = {
    kernelModules = [ "acpi_call" ];
    extraModulePackages =
      with config.boot.kernelPackages;
      [
        acpi_call
        cpupower
      ]
      ++ [ pkgs.cpupower-gui ];
  };
}
