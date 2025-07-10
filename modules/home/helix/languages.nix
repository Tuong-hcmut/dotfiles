{ ... }:
{
  programs.helix.languages = {
    language-server = {
      nixd = {
        command = "nixd";
      };
      clangd = {
        command = "clangd";
        args = [ "--clang-tidy" ];
      };
      zls = {
        command = "zls";
      };
    };

    language = [
      {
        name = "nix";
        language-servers = [ "nixd" ];
        auto-format = true;
      }
      {
        name = "cpp";
        language-servers = [ "clangd" ];
        auto-format = true;
      }
      {
        name = "c";
        language-servers = [ "clangd" ];
        auto-format = true;
      }
      {
        name = "zig";
        language-servers = [ "zls" ];
        auto-format = true;
      }
    ];
  };
}
