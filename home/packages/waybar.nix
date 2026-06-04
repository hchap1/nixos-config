{ ... }:

{
  programs.waybar = {
    enable = false;
/*
    settings = [
      {
        output = "HDMI-A-1";
        layer = "top";
        position = "top";
        height = 36;
        spacing = 4;
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;

        # ── Sections ──────────────────────────────────────────────
        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];
        modules-center = [
          "mpris"
        ];
        modules-right = [
          "temperature"
          "cpu"
          "memory"
          "separator"
          "network"
          "pulseaudio"
          "bluetooth"
          "separator"
          "clock#date"
          "clock#time"
        ];

        # ── Left ──────────────────────────────────────────────────

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
          };
          on-scroll-up = "niri msg action focus-workspace-up";
          on-scroll-down = "niri msg action focus-workspace-down";
        };

        "niri/window" = {
          format = "  {}";
          max-length = 60;
          rewrite = {
            "(.*) — Mozilla Firefox" = "󰈹  $1";
            "(.*) - fish" = "  $1";
            "(.*) - nvim" = "  $1";
            "(.*) - Code" = "󰨞  $1";
          };
        };

        # ── Center ────────────────────────────────────────────────

        mpris = {
          format = "{player_icon}  {dynamic}";
          format-paused = "{status_icon}  {dynamic}";
          format-stopped = "";
          player-icons = {
            default = "▶";
            spotify = "";
            mpd = "🎵";
          };
          status-icons = {
            paused = "";
          };
          dynamic-order = [ "title" "artist" ];
          dynamic-len = 40;
          max-length = 60;
          tooltip-format = "{title}\n{artist}\n{album}";
          on-click = "playerctl play-pause";
          on-click-right = "playerctl next";
          on-click-middle = "playerctl previous";
          on-scroll-up = "playerctl volume 0.05+";
          on-scroll-down = "playerctl volume 0.05-";
        };

        # ── Right ─────────────────────────────────────────────────

        temperature = {
          # Use `sensors` to find your chip; AMD = k10temp, Intel = coretemp.
          # If hwmon-path-abs doesn't auto-resolve, use: thermal-zone = 0;
          hwmon-path-abs = "/sys/class/hwmon";
          input-filename = "temp1_input";
          critical-threshold = 85;
          format-critical = "  {temperatureC}°C";
          format = "  {temperatureC}°C";
          interval = 3;
          tooltip = false;
        };

        cpu = {
          format = "  {usage}%";
          interval = 3;
          max-length = 10;
          tooltip = true;
          tooltip-format = "CPU: {usage}%\nLoad: {load}";
        };

        memory = {
          format = "  {used:0.1f} / {total:0.0f} GB";
          interval = 5;
          tooltip = true;
          tooltip-format = "Used: {used:0.1f} GB\nAvail: {avail:0.1f} GB\nSwap: {swapUsed:0.1f} / {swapTotal:0.0f} GB";
        };

        separator = {
          format = "|";
          interval = "once";
          tooltip = false;
        };

        network = {
          interface = "*";
          format-wifi = "  {essid}";
          format-ethernet = "󰈀  {ifname}";
          format-disconnected = "󰤭  Offline";
          tooltip-format-wifi = "{essid} ({signalStrength}%)\n{ipaddr}\nUp: {bandwidthUpBits}  Down: {bandwidthDownBits}";
          tooltip-format-ethernet = "{ifname}\n{ipaddr}";
          tooltip-format-disconnected = "Disconnected";
          max-length = 20;
          interval = 5;
          on-click = "nm-applet --indicator &";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "󰝟  Muted";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󰋎";
            headset = "󰋎";
            phone = "";
            portable = "";
            car = "";
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          scroll-step = 5;
          on-click = "pavucontrol";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          tooltip-format = "{volume}% ({desc})";
          max-length = 20;
        };

        bluetooth = {
          format = "󰂯";
          format-connected = "󰂱  {num_connections}";
          format-connected-battery = "󰂱  {device_alias} {device_battery_percentage}%";
          format-off = "󰂲";
          tooltip-format = "Bluetooth: {status}\n{controller_alias}";
          tooltip-format-connected = "{controller_alias}\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          on-click = "blueman-manager";
        };

        "clock#date" = {
          format = "  {:%a %d %b}";
          tooltip-format = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
          interval = 60;
        };

        "clock#time" = {
          format = "  {:%H:%M}";
          tooltip-format = "{:%A, %d %B %Y\n%H:%M:%S}";
          interval = 1;
        };
      }
    ];

    style = builtins.readFile ../config/waybar/style.css;
*/
  };
}
