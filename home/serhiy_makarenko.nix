{
  home-manager.users.serhiy_makarenko = {
    programs = {
      ssh = {
      	enable = true;
      	matchBlocks = {
          "srv1.makarenko.home" = {
            hostname = "srv1.makarenko.home";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "srv2.makarenko.home" = {
            hostname = "srv2.makarenko.home";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "srv3.makarenko.home" = {
            hostname = "srv3.makarenko.home";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "srv4.makarenko.home" = {
            hostname = "srv4.makarenko.home";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "srv5.makarenko.home" = {
            hostname = "srv5.makarenko.home";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "rpi0.makarenko.home" = {
            hostname = "rpi0.makarenko.home";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "rpi1.makarenko.home" = {
            hostname = "rpi1.makarenko.home";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "gw1.makarenko.home" = {
            hostname = "gw1.makarenko.home";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "gw2.makarenko.home" = {
            hostname = "gw2.makarenko.home";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "gw2.makarenko.me" = {
            hostname = "srv2.makarenko.me";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "sw1.makarenko.home" = {
            hostname = "sw1.makarenko.home";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "sw2.makarenko.home" = {
            hostname = "sw2.makarenko.home";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "macbook-pro-serhiya-makarenka.makarenko.home" = {
            hostname = "macbook-pro-serhiya-makarenka.makarenko.home";
            user = "serhiy_makarenko";
            identityFile = "~/.ssh/rsa/SM.Home.rsa";
          };
          "github.com" = {
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh/rsa/SM.Github.rsa";
          };
          "gitlab.com" = {
            hostname = "gitlab.com";
            user = "git";
            identityFile = "~/.ssh/rsa/SM.Gitlab.rsa";
          };
          "gitlab.makarenko.home" = {
            hostname = "gitlab.makarenko.home";
            user = "git";
            identityFile = "~/.ssh/rsa/SM.Gitlub.rsa";
          };
      	};
      };
      git = {
        enable = true;
        userName = "Serhiy Makarenko";
        userEmail = "serhiy.makarenko@me.com";
      };
      gnome-terminal = {
        enable = true;
        showMenubar = false;
        profile = {
          "5ddfe964-7ee6-4131-b449-26bdd97518f7" = {
            default = true;
            visibleName = "Dracula Theme";
            font = "DejaVu Sans Mono 12";
            showScrollbar = false;
            colors = {
              foregroundColor = "rgb(248,248,242)";
              palette = [
                "rgb(38,38,38)"
                "rgb(227,86,167)"
                "rgb(66,230,108)"
                "rgb(228,243,74)"
                "rgb(155,107,223)"
                "rgb(230,71,71)"
                "rgb(117,215,236)"
                "rgb(239,165,84)"
                "rgb(122,122,122)"
                "rgb(255,121,198)"
                "rgb(80,250,123)"
                "rgb(241,250,140)"
                "rgb(189,147,249)"
                "rgb(255,85,85)"
                "rgb(139,233,253)"
                "rgb(255,184,108)"
              ];
              boldColor = "rgb(110,70,164)";
              backgroundColor = "rgb(40,42,54)";
            };
          };
        };
      };
      htop = {
        enable = true;
        fields = [ "PID" "USER" "PRIORITY" "NICE" "M_SIZE" "M_RESIDENT" "STATE" "PERCENT_CPU" "PERCENT_MEM" "TIME" "COMM" ];
        sortKey = "PERCENT_CPU";
        treeView = true;
        highlightBaseName = true;
        detailedCpuTime = true;
        cpuCountFromZero = true;
        meters = {
          left = [
            { kind = "LeftCPUs"; mode = 1; }
            { kind = "Blank"; mode = 2; }
            { kind = "Blank"; mode = 2; }
            { kind = "Memory"; mode = 1; }
            { kind = "Swap"; mode = 1; }
           ];
          right = [
            { kind = "RightCPUs"; mode = 1; }
            { kind = "Blank"; mode = 2; }
            { kind = "Tasks"; mode = 2; }
            { kind = "LoadAverage"; mode = 2; }
            { kind = "Uptime"; mode = 2; }
          ];
        };
      };
      fish = {
        enable = true;
        shellAliases = {
          ll = "ls -lah $argv";
        };
        promptInit = ''
          function fish_greeting
            echo -----------------------------------------------------------------
            echo Hostname is (set_color green)(hostname)(set_color normal)
            echo HP EliteBook 840 G5 running (set_color green)NixOS (nixos-version)(set_color normal)
            echo You logged in as (set_color green)(whoami)(set_color normal)
            if [ (ip addr show wlp1s0 | awk 'FNR == 1 {print $9}') = "UP" ]
              echo Wi-Fi connection status: IP is (set_color green)(ip addr show wlp1s0 | awk 'FNR == 3 {print $2}' | cut -d '/' -f1)(set_color normal)
            else
              echo Wi-Fi connection status: (set_color red)not connected(set_color normal)
            end
            if [ (ip addr show enp0s31f6 | awk 'FNR == 1 {print $9}') = "UP" ]
              echo Ethernet connection status: IP  is (set_color green)(ip addr show enp0s31f6 | awk 'FNR == 3 {print $2}' | cut -d '/' -f1)(set_color normal)
            else
              echo Ethernet connection status: (set_color red)not connected(set_color normal)
            end
            echo -----------------------------------------------------------------
            uptime
            echo -----------------------------------------------------------------
            who -aH
            echo -----------------------------------------------------------------
          end
          function fish_prompt
            set -l color_cwd
            set -l suffix
            set -l HOSTNAME (hostname)
            switch $USER
            case root toor
              if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
              else
                set color_cwd $fish_color_cwd
              end
                set suffix '#'
            case '*'
              set color_cwd $fish_color_cwd
              set suffix '>'
            end
            
            echo -n -s [(set_color $color_cwd)(date "+%H:%M")(set_color normal)] ' ' "$USER" @ "$HOSTNAME" ' ' [(set_color $color_cwd) "$PWD" (set_color normal)] ' '"$suffix "
          end
        '';
      };
    };
  };
}