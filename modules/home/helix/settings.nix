{ ... }:
{
  programs.helix.settings = {
    theme = "Catppuccin-mocha";
    editor = {
      line-number = "relative";
      cursorline = true;
      color-modes = true;
      auto-format = true;
      soft-wrap.enable = true;
    };
    keys.normal = {
      "space" = {
        "w" = ":w";
        "q" = ":q";
      };
    };
  };
}
