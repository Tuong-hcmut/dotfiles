{ config, lib, ... }:

{
  services.xserver = {
    layout = "phoboard,phoboard_cm,jp";
    xkbVariant = "basic,basic,kana";
    xkbOptions = "grp:ctrls_toggle,lv3:ralt_switch";
  };

  environment.variables = {
    XKB_DEFAULT_LAYOUT = "phoboard";
    XKB_DEFAULT_VARIANT = "basic";
  };
}