{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left =
          [ "custom/icon" "niri/workspaces" "niri/window" "custom/spotify" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "memory" "cpu" "tray" ];

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

        "niri/window" = { format = "  {}"; };

        "custom/icon" = { format = "󱄅 "; };

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            visible = "";
            default = "";
            empty = "";
          };
        };

        "pulseaudio" = {
          format = "{icon} <b>{volume}%</b>";
          format-muted = "󰝟 ";
          format-icons = { default = [ "󰕿" "󰖀" "󰕾" ]; };
        };

        "tray" = {
          icon-size = 20;
          spacing = 10;
        };
        "custom/spotify" = {
          format = "{} ";
          max-length = 60;
          interval = "once";
          return-type = "json";
          exec = "~/.config/waybar/spotifyctl.zsh";
          on-click =
            "playerctl --player=spotify play-pause && pkill -RTMIN+30 waybar";
          on-click-right = "playerctl --player=spotify loop track";
          on-scroll-down =
            "playerctl --player=spotify previous && pkill -RTMIN+30 waybar";
          on-scroll-up =
            "playerctl --player=spotify next && pkill -RTMIN+30 waybar";
          on-click-middle = "pkill --signal TERM spotify";
          signal = 30;
          smooth-scrolling-threshold = 1.0;
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
        font-size: 18.0;
      }

      .modules-left {
        background-color: @base01;
        padding-right: 5px;
        padding-left: 13px;
      }

      .modules-center {
        background-color: @base01;
        padding-right: 5px;
        padding-left: 5px;
      }

      .modules-right {
        background-color: @base01;
        padding-right: 5px;
        padding-left: 5px;
      }

       #cpu, #memory, #pulseaudio, #custom-spotify, #custom-icon, #tray, #custom-notification {
        border-radius: 18px;
      }

      #custom-icon {
        color: @base0D;
      }

      window#waybar {
          background-color: @base01;
      }

      #workspaces {
        margin: 0px 1px 0px 1px;
        padding: 0px 1px;
      }

      #workspaces button {
        padding: 0px 2px;
        margin: 4px 2px;
      }

      #clock {
        padding-left: 10px;
        font-weight: bold;
      }

      #cpu, #memory, #pulseaudio, #tray {
        padding: 2px 5px;
        margin: 4px 2px;
      }

    '';

  };
}
