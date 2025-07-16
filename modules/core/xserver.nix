{ username, ... }:
{
  services = {
    xserver = {
      enable = true;
      # xkb.layout = "us";
      videoDrivers = ["modesetting"]; # "nvidia"];
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
