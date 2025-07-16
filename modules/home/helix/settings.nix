{ ... }:
{
  programs.helix.settings = {
    theme = "catppuccin-mocha";
    editor = {
      line-number = "relative";
      cursorline = true;
      color-modes = true;
      auto-format = true;
      soft-wrap.enable = true;
      true-color = true;
      mouse = true;
      bufferline = "never";
      rulers = [80];
    };

    editor.cursor-shape = {
      insert = "bar";
      normal = "block";
      select = "underline";
    };

    keys.normal = {
      space = {
        w = ":w";
        q = ":q";
      };
    };
  };
}
