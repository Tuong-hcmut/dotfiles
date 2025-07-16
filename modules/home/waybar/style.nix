{ ... }:
let
  custom = {
    font = "Maple Mono";
    font_size = "12px";
    font_weight = "bold";
    text_color = "#FBF1C7";
    background_0 = "#1D2021";
    background_1 = "#282828";
    border_color = "#A89984";
    red = "#CC241D";
    green = "#98971A";
    yellow = "#FABD2F";
    blue = "#458588";
    magenta = "#B16286";
    cyan = "#689D6A";
    orange = "#D65D0E";
    orange_bright = "#FE8019";
    opacity = "1";
    indicator_height = "2px";
  };
in
{
  programs.waybar.style = with custom; ''
    * {
      border: none;
      border-radius: 0px;
      box-shadow: none;
      padding: 0;
      margin: 0;
      font-family: ${font};
      font-weight: ${font_weight};
      opacity: ${opacity};
      font-size: ${font_size};
    }

    window#waybar {
      background: transparent;
      border-top: hidden;
    }

    tooltip {
      background: ${background_1};
      border: 1px solid ${border_color};
    }
    tooltip label {
      margin: 5px;
      color: ${text_color};
    }

    #workspaces {
      margin-left: 8px;
      margin-right: 8px;
      border-radius: 20px;
      border: 2px solid ${border_color};
    }
    #workspaces button {
      color: ${orange_bright};
      padding-left:  5px;
      padding-right: 5px;
    }
    #workspaces button.empty {
      color: ${text_color};
    }
    #workspaces button.active {
      color: ${red};
      background: ${background_1};
      border: 1px solid ${border_color};
      border-radius: 20px;
    }
    #workspaces button:hover {
      transition: none;
      box-shadow: inherit;
      text-shadow: inherit;
      border-radius: inherit;
      color: ${red};
      background: ${background_0};
    }

    #clock {
      padding-left: 16px;
      padding-right: 16px;
      border-radius: 10px;
      transition: none;
      color: ${text_color};
      background: ${background_1};
      border: 2px solid ${border_color};
}

    #tray {
      padding-left: 10px;
      padding-right: 10px;
      color: ${text_color};
      background: ${background_1};
      border: 2px solid ${border_color};
      border-radius: 20px;
    }
    #tray menu {
      background: ${background_1};
      border: 2px solid ${border_color};
      padding: 8px;
    }
    #tray menuitem {
      padding: 1px;
    }

    #pulseaudio, #network, #cpu, #memory, #disk, #battery/*, #language*/, #custom-notification {
      padding-left: 5px;
      padding-right: 5px;
      margin-right: 10px;
      color: ${text_color};
      background: ${background_1};
      border: 2px solid ${border_color};
      border-radius: 20px;
    }

    #pulseaudio/*, #language*/ {
      margin-left: 15px;
    }

    #custom-notification {
      padding-left: 15px;
      padding-right: 15px;
      margin-right: 5px;
      border-radius: 20px;
    }

    #custom-launcher {
      font-size: 20px;
      color: ${text_color};
      font-weight: bold;
      padding-left: 15px;
      padding-right: 10px;
      border-radius: 20px;
    }
  '';
}
