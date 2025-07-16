{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [ superfile ripgrep];

  xdg.configFile."superfile/config.toml".source = ./config.toml;
}
