{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
    twemoji-color-font
    noto-fonts-emoji
    fantasque-sans-mono
    maple-mono.truetype-autohint
  ];
  #gtk-im-module=fcitx;
  #QT_IM_MODULE=fcitx;
  gtk = {
    enable = true;
    font = {
      name = "Maple Mono";
      size = 11;
    };
    catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    size = "standard";
    tweaks = [ "normal" ];
  };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 15;
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 15;
  };
}
