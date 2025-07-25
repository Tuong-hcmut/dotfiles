{
  inputs,
  pkgs,
  host,
  ...
}:
{
  programs.hyprlock = {
    enable = true;

    package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;

    settings = {
      general = {
        hide_cursor = true;
        no_fade_in = false;
        disable_loading_bar = true;
        ignore_empty_input = true;
        fractional_scaling = 0;
      };

      background = [
        {
          monitor = "";
          #path = "${../../../wallpapers/otherWallpaper/gruvbox/astronaut.jpg}";
          path = "${../../../wallpapers/otherWallpaper/gruvbox/hill_of_swords.png}";
          #blur_passes = 2;
          #contrast = 0.8916;
          #brightness = 0.8172;
          #vibrancy = 0.1696;
          #vibrancy_darkness = 0.0;
        }
      ];

      shape = [
        # User box
        {
          monitor = "";
          size = "300, 50";
          color = "rgba(102, 92, 84, 0.66)";
          rounding = 10;
          border_color = "rgba(255, 255, 255, 0)";
          position = "0, ${if host == "laptop" then "120" else "270"}";
          halign = "center";
          valign = "bottom";
        }
      ];

      label = [
        # Time
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +'%k:%M')"'';
          color = "rgba(235, 219, 178, 0.9)";
          font_size = 135;
          font_family = "Maple Mono Bold";
          shadow_passes = 3;
          position = "0, ${if host == "laptop" then "-25" else "-150"}";
          halign = "center";
          valign = "top";
        }
        # Date
        {
          monitor = "";
          text = ''cmd[update:1000] echo "- $(date +'%A, %d %B') -" '';
          color = "rgba(235, 219, 178, 0.9)";
          font_size = 35;
          font_family = "Maple Mono";
          shadow_passes = 3;
          position = "0, ${if host == "laptop" then "-275" else "-350"}";
          halign = "center";
          valign = "top";
        }
        # Username
        {
          monitor = "";
          text = "  $USER";
          color = "rgba(235, 219, 178, 1)";
          font_size = 13;
          font_family = "Maple Mono Bold";
          position = "0, ${if host == "laptop" then "135" else "281"}";
          halign = "center";
          valign = "bottom";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 50";
          outline_thickness = 1;
          rounding = 10;
          dots_size = 0.25;
          dots_spacing = 0.4;
          dots_center = true;
          outer_color = "rgba(102, 92, 84, 0.66)";
          inner_color = "rgba(102, 92, 84, 0.66)";
          color = "rgba(235, 219, 178, 0.9)";
          font_color = "rgba(235, 219, 178, 0.9)";
          font_size = 25;
          font_family = "Maple Mono Bold";
          fade_on_empty = false;
          placeholder_text = ''<i><span foreground="##fbf1c7">Enter Password</span></i>'';
          hide_input = false;
          position = "0, ${if host == "laptop" then "75" else "200"}";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
