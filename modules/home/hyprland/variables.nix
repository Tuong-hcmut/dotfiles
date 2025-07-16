{ ... }:
{
  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    __GL_GSYNC_ALLOWED = 0;
    __GL_VRR_ALLOWED = 0;
    _JAVA_AWT_WM_NONEREPARENTING = 1;
    SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
    DISABLE_QT5_COMPAT = 0;
    GDK_BACKEND = "wayland";
    # ANKI_WAYLAND = 1;
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = 1;
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    # QT_STYLE_OVERRIDE = "kvantum";
    # QTWEBENGINE_CHROMIUM_FLAGS = "--no-sandbox --disable-gpu --disable-software-rasterizer";
    MOZ_ENABLE_WAYLAND = 1;
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    WLR_NO_HARDWARE_CURSORS = 1;
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
    GRIMBLAST_HIDE_CURSOR = 0;

    # LIBGL_ALWAYS_SOFTWARE = "1";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx";
    SDL_IM_MODULE = "fcitx";
    OZONE_PLATFORM = "wayland";
    GTK_USE_PORTAL = 1;
    
    GSK_RENDERER = "ngl";
    LIBVA_DRIVER_NAME = "nvidia";
    # Use NVIDIA for VDPAU           # Default to Intel for Wayland
    GBM_BACKEND = "nvidia-drm";
    NIXPKGS_ALLOW_UNFREE = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia"; # NVIDIA GLX (when offloading)# Best for HD 620 (Kaby Lake)
  };
}
