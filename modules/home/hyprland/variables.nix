{ ... }:

{
  home.sessionVariables = {
    # Wayland support
    NIXOS_OZONE_WL = 1;
    GDK_BACKEND = "wayland";
    _JAVA_AWT_WM_NONEREPARENTING = 1;
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    OZONE_PLATFORM = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";

    # GTK / Qt
    GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
    GTK_USE_PORTAL = 1;
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    # QT_STYLE_OVERRIDE = "kvantum";
    # QTWEBENGINE_CHROMIUM_FLAGS = "--no-sandbox --disable-gpu --disable-software-rasterizer";

    # Misc
    SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
    DIRENV_LOG_FORMAT = "";
    GRIMBLAST_HIDE_CURSOR = 0;
    GSK_RENDERER = "ngl";

    # NVIDIA / Vulkan / Rendering
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm"; # Use NVIDIA for VDPAU — Default to Intel for Wayland
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    WLR_NO_HARDWARE_CURSORS = 1;
    WLR_DRM_NO_ATOMIC = 1;
    __GL_GSYNC_ALLOWED = 0;
    __GL_VRR_ALLOWED = 0;
    __GLX_VENDOR_LIBRARY_NAME = "nvidia"; # NVIDIA GLX (when offloading) — Best for HD 620 (Kaby Lake)

    # Unfree packages
    NIXPKGS_ALLOW_UNFREE = "1";

    # Input method (disabled)
    # GTK_IM_MODULE = "xim";
    # QT_IM_MODULE = "xim";
    # XMODIFIERS = "@im=none";
    # COMPOSEFILE = "/etc/XCompose";
    # IMSETTINGS_MODULE = "fcitx";
    # INPUT_METHOD = "fcitx";
    # SDL_IM_MODULE = "fcitx";
    # GLFW_IM_MODULE = "fcitx";

    # Other (disabled or experimental)
    # ANKI_WAYLAND = 1;
    # XKB_CONFIG_ROOT = "${pkgs.xkeyboard_config}/share/X11/xkb";
    # LIBGL_ALWAYS_SOFTWARE = "1";
  };
}
