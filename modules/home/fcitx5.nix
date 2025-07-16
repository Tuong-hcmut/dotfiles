{ pkgs, ... }:
{
  programs.fcitx5 = {
    enable = true;
    waylandFrontend = true;
    addons = with pkgs.libsForQt5; [
      fcitx5-unikey
      fcitx5-configtool
    ];
  };
}
