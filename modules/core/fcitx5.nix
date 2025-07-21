# modules/core/fcitx5.nix
{ config, pkgs, ... }: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-bamboo
      fcitx5-gtk
      libsForQt5.fcitx5-qt
      kdePackages.fcitx5-qt
    ];
  };
  /*i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ bamboo ];
  };*/

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx";
  };

  environment.systemPackages = with pkgs; [
    fcitx5
    fcitx5-bamboo
    fcitx5-gtk
    libsForQt5.fcitx5-qt
    kdePackages.fcitx5-qt
    fcitx5-configtool
  ];
}