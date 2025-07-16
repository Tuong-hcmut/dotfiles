
{ pkgs, ... }:
let
  ankiWrapper = pkgs.writeShellScriptBin "anki" ''
    export QT_QPA_PLATFORM=xcb
    export LIBGL_ALWAYS_SOFTWARE=1
    export QTWEBENGINE_CHROMIUM_FLAGS="--no-sandbox --disable-gpu --disable-software-rasterizer --disable-gpu-compositing"
    exec ${pkgs.anki-bin}/bin/anki "$@"
  '';
in {
  home.packages = [ ankiWrapper ];
}
