{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];
        modules-center = [
          "custom/music"
          "clock"
        ];
        modules-right = [
          "pulseaudio"
          "pulseaudio/slider"
          "memory"
          "cpu"
          "tray"
        ];

        "clock" = {
          format = "<b>󰥔  {:%H:%M:%S   󰃭  %m/%d/%Y}</b> ";
          format-alt = "<b>󰥔  {:%I:%M:%S %p   󰃭  %m/%d/%Y}</b> ";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            format = {
              months = "<span color='#cdd6f4'><b>{}</b></span>";
              days = "<span color='#cdd6f4'><b>{}</b></span>";
              weeks = "<span color='#cdd6f4'><b>W{}</b></span>";
              weekdays = "<span color='#cdd6f4'><b>{}</b></span>";
              today = "<span color='#f38ba8'><b>{}</b></span>";
            };
          };
        };

        "cpu" = {
          interval = 10;
          format = " {usage}%";
          max-length = 10;
        };

        "niri/window" = {
          format = "  {}";
          max-length = 25;
        };

        "custom/icon" = {
          format = " ";
        };

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
          };
        };

        "pulseaudio" = {
          format = "{icon} <b>{volume}%</b>";
          format-muted = "󰝟 ";
          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
        };
        "pulseaudio/slider" = {
          min = 0;
          max = 100;
          orientation = "horizontal";
        };

        "tray" = {
          icon-size = 20;
          spacing = 10;
        };

        "custom/music" = {
          format = "{}";
          return-type = "json";
          exec = ''waybar-module-music --format "%player-icon%%artist% - %title%" --marquee --title-width 15'';
        };

        "memory" = {
          interval = 30;
          format = " {used}GiB";
          max-length = 10;
        };

      };
    };
    style = ''
      * {
        font-family: "Overpass", "JetBrains Mono Nerd Font";
        font-size: 20.0;
      }

      .modules-left {
        padding-right: 5px;
        padding-left: 13px;
      }

      .modules-center {
        padding-right: 5px;
        padding-left: 5px;
      }

      .modules-right {
        padding-right: 5px;
        padding-left: 5px;
      }

      #workspaces, #window, #clock, #cpu, #memory, #pulseaudio, #pulseaudio-slider, #custom-music, #tray {
        color: #cba6f7;
        background: #313244;
        border-radius: 5px;
        padding: 2px 5px;
        margin: 4px 2px;
      }

      #pulseaudio-slider {
      background: #313244;
      }

      #pulseaudio-slider slider {
        background-color: transparent;
        box-shadow: none;
      }

      #pulseaudio-slider trough {
        min-height: 10px;
        min-width: 80px;
        background: #11111b;
      }

      #pulseaudio-slider highlight {
        min-width: 10px;
        background: #cba6f7;
      }

      window#waybar {
          background-color: #1e1e2e;
      }

      #workspaces {
        padding: 0px 1px;
      }
      #workspaces button.focused label {
        color: #cba6f7;
      }


      #clock {
        padding-left: 10px;
        font-weight: bold;
      }

    '';

  };
}
