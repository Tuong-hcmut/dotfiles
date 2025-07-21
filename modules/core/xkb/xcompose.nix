{ lib, config, pkgs, ... }:

let
  inherit (lib) mkIf mkEnableOption;
in {
  options.customXcompose.enable = mkEnableOption "Custom XCompose definitions";

  config = mkIf config.customXcompose.enable {
    environment.etc."XCompose".text = builtins.readFile ./xcompose;

    # Optional: Set a Compose key (e.g., Right Alt)
    services.xserver.xkbOptions = "compose:ralt";
  };
}