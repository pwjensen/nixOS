{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "DP-1"
          "HDMI-A-1"
        ];
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "tray"
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "clock"
        ];
        "hyprland/workspaces" = {
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          format = "{name}";
        };
        "hyprland/window" = {
          max-length = 100;
          separate-outputs = true;
        };
        "tray" = {
          spacing = 10;
        };
        "clock" = {
          timezone = "America/New_York";
          format = "{:%I:%M %p}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%m-%d-%Y}";
        };
        "cpu" = {
          format = "{usage}% ";
        };
        "memory" = {
          format = "{}% ";
          on-click = "kitty -e btop";
        };
        "network" = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          format-disconnected = "Disconnected ⚠";
        };
        "pulseaudio" = {
          scroll-step = 5;
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
                headphones = "";
                handsfree = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = [ "" "" ];
            };
            on-click = "pavucontrol";
        };

      };
    };
    style =
    ''
    * {
        border: none;
        border-radius: 0;
        font-family: "Hack Nerd Font";
        font-size: 13px;
        min-height: 0;
    }

    window#waybar {
        background: transparent;
        color: white;
    }


    #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: white;
        border-top: 2px solid transparent;
    }

    #workspaces button:hover {
        background: rgba(0, 0, 0, 0.2);
    }

    #workspaces button.focused {
        background-color: #64727D;
        border-top: 2px solid #64727D;
    }

    #workspaces button.urgent {
        background-color: #eb4d4b;
    }

    #mode {
        background-color: #64727D;
        border-bottom: 3px solid white;
    }

    #clock, #cpu, #memory, #disk, #temperature, #network, #pulseaudio, #custom-spotify, #tray, #mode, #idle_inhibitor {
        padding: 0 6px;
        margin: 0 2px;
    }

    #window,
    #workspaces {
        margin: 0 4px;
    }

    /* If workspaces is the leftmost module, omit left margin */
    .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
    }

    /* If workspaces is the rightmost module, omit right margin */
    .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
    }

    #clock {
        font-weight: bold;
    }

    @keyframes blink {
        to {
            background-color: #ffffff;
            color: #000000;
        }
    }

    label:focus {
        background-color: #000000;
    }
    '';
  };
}
