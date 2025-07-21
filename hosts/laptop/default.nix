{ pkgs, config, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  # Drivers
  #drivers.amdgpu.enable = false;
  #drivers.intel.enable = true;
  drivers.nvidia.enable = true;
  drivers.nvidia-prime = {
    enable = true;
    intelBusID = "PCI:0:2:0";
    nvidiaBusID = "PCI:1:0:0";
  };

  # VM/Hardware
  #vm.guest-services.enable = false;
  #local.hardware-clock.enable = true;

  # Boot/System Options
  #system.bootloader-systemd.enable = true;
  #system.bootloader-grub.enable = false;
  #system.plymouth.enable = true;
  #system.audio.enable = true;
  #system.greetd.enable = false;
  #displayManager.enable = true;
  #powermanagement.enable = true;
  #system.scheduler.enable = true;
  #myOptions.cliphist.enable = false;
  #mine.hypridle.enable = true;

  # Storage/Compression
  #system.btrfs.enable = false;
  #system.zfs.enable = true;
  #system.zram.enable = true;

  # Bootloader (legacy)
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

  # Themes
  #catppuccin.tty.enable = true;

  # Nixpkgs options
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;
  nixpkgs.config.allowBroken = true;

  # Users
  users.mutableUsers = true;

  # System packages
  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    cpupower-gui
    lm_sensors
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
    # egl-wayland
    # pkgs-master.waybar  # if wanted experimental next line
  ];

  # Hardware
  hardware.graphics.enable = true;

  # Services
  services = {
    power-profiles-daemon.enable = false;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };

    thermald.enable = true;

    tlp = {
      enable = true;
      settings = {
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
        # INTEL_GPU_MAX_FREQ_ON_AC = 0;
        # INTEL_GPU_MAX_FREQ_ON_BAT = 0;
        # INTEL_GPU_BOOST_FREQ_ON_AC = 0;
        # INTEL_GPU_BOOST_FREQ_ON_BAT = 0;

        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "powersupersave";
      };
    };
  };

  # Custom modules
  customXkb.enable = true;
  # customXcompose.enable = true;

  # CPU governor
  powerManagement.cpuFreqGovernor = "schedutil";

  # Boot kernel modules
  boot = {
    kernelModules = [ "acpi_call" ];
    extraModulePackages = with config.boot.kernelPackages; [
      acpi_call
      cpupower
    ] ++ [ pkgs.cpupower-gui ];
  };
}