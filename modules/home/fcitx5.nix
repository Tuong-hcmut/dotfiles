{ pkgs, ... }:

{
  programs.fcitx5 = {
    enable = true;
    waylandFrontend = true;
    addons = with pkgs; [
      fcitx5-bamboo
      fcitx5-gtk
      libsForQt5.fcitx5-qt
      kdePackages.fcitx5-qt
    ];
  };

  home.packages = with pkgs; [
    fcitx5
    fcitx5-bamboo
    fcitx5-gtk
    libsForQt5.fcitx5-qt
    kdePackages.fcitx5-qt
    fcitx5-configtool
  ];

  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus"; # optional, for games
  };

  # Optional: fcitx5 config to use bamboo by default
  xdg.configFile."fcitx5/profile".text = ''
    [Groups/0]
    Name=Default
    Layout=us
    Default Layout=us
    DefaultIM=bamboo

    [GroupOrder]
    0=Default
  '';

  # Optional systemd startup (or use Hyprland exec-once)
  systemd.user.services.fcitx5 = {
    Unit = {
      Description = "Fcitx5 daemon";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.fcitx5}/bin/fcitx5";
      Restart = "always";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
