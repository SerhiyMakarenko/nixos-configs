{
  home-manager.users.root = {
  	programs = {
      ssh = {
        enable = true;
        matchBlocks = {
        "github.com" = {
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh/rsa/SM.Github.rsa";
          };
        };
      };
      git = {
      	enable = true;
        userName = "Serhiy Makarenko";
        userEmail = "serhiy.makarenko@me.com";
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