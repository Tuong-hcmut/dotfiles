{ lib, config, ... }:

let
  inherit (lib) mkIf;
in
{
  options.customXkb.enable = lib.mkEnableOption "Custom XKB layout (phoboard)";

  # Get it? phoboard, as in Phở Bò-ard?
  config = mkIf config.customXkb.enable {
    # Make layout visible at build + runtime
    services.xserver.extraLayouts.phoboard = {
      description = "Vietnamese (Phoboard)";
      languages = [ "vie" ];
      symbolsFile = ./phoboard;
    };
    services.xserver.extraLayouts.phoboard_cm = {
      description = "Vietnamese (Phoboard - Colemak)";
      languages = [ "vie" ];
      symbolsFile = ./phoboard_cm;
    };
    environment.etc."xkb/symbols/phoboard".text = builtins.readFile ./phoboard;
    environment.etc."xkb/symbols/phoboard_cm".text = builtins.readFile ./phoboard_cm;
    
    # Optional: i think these ended up doing nothing, patching hyprland is a pain
    # environment.etc."xkb/rules/evdev.xml".text = builtins.readFile ./evdev-patched.xml;
    # environment.etc."xkb/rules/evdev.lst".text = builtins.readFile ./evdev-patched.lst;
    
    # environment.variables.XKB_CONFIG_ROOT = lib.mkForce "/etc/xkb";
  };
}

