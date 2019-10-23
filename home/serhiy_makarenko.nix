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
                "rgb(38,38,38)" "rgb(227,86,167)"
                "rgb(66,230,108)" "rgb(228,243,74)"
                "rgb(155,107,223)" "rgb(230,71,71)"
                "rgb(117,215,236)" "rgb(239,165,84)"
                "rgb(122,122,122)" "rgb(255,121,198)"
                "rgb(80,250,123)" "rgb(241,250,140)"
                "rgb(189,147,249)" "rgb(255,85,85)"
                "rgb(139,233,253)" "rgb(255,184,108)"
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
        shellInit = ''
          set segment_separator \u258C
          set -g current_bg 000
          set -q color_git_dirty_bg; or set color_git_dirty_bg yellow
          set -q color_git_dirty_str; or set color_git_dirty_str black
          set -q color_git_bg; or set color_git_bg green
          set -q color_git_str; or set color_git_str black
          set -q fish_git_prompt_untracked_files; or set fish_git_prompt_untracked_files normal
          set -g __fish_git_prompt_showdirtystate "yes"
          set -g __fish_git_prompt_char_dirtystate "±"
          set -g __fish_git_prompt_char_cleanstate ""
        '';
        promptInit = ''
          function fish_greeting
            set -l wireless (ls /sys/class/net/ | awk '/[w]l/{print}')
            set -l wired (ls /sys/class/net/ | awk '/[e]n/{print}')
            echo Hostname is (set_color green)(hostname)(set_color normal)
            echo HP EliteBook 840 G5 running (set_color green)NixOS (nixos-version)(set_color normal)
            echo You logged in as (set_color green)(whoami)(set_color normal)
            if [ (ip addr show $wireless | awk 'FNR == 1 {print $9}') = "UP" ]
              echo Wi-Fi connection status: IP is (set_color green)(ip addr show $wireless | awk 'FNR == 3 {print $2}' | cut -d '/' -f1)(set_color normal)
            else
              echo Wi-Fi connection status: (set_color red)not connected(set_color normal)
            end
            if [ (ip addr show $wired | awk 'FNR == 1 {print $9}') = "UP" ]
              echo Ethernet connection status: IP  is (set_color green)(ip addr show $wired | awk 'FNR == 3 {print $2}' | cut -d '/' -f1)(set_color normal)
            else
              echo Ethernet connection status: (set_color red)not connected(set_color normal)
            end
            echo -----------------------------------------------------------------
            uptime
            echo -----------------------------------------------------------------
            who -aH
            echo -----------------------------------------------------------------
          end
          function prompt_segment -d "Function to draw a segment"
            set -l bg
            set -l fg
            if [ -n "$argv[1]" ]
              set bg $argv[1]
            else
              set bg normal
            end
            if [ -n "$argv[2]" ]
              set fg $argv[2]
            else
              set fg normal
            end
            if [ "$current_bg" != '000' -a "$argv[1]" != "$current_bg" ]
              set_color -b $bg
              set_color $current_bg
              echo -n "$segment_separator "
              set_color -b $bg
              set_color $fg
            else
              set_color -b $bg
              set_color $fg
              echo -n " "
            end
            set current_bg $argv[1]
            if [ -n "$argv[3]" ]
              echo -n -s $argv[3] " "
            end
          end
          function prompt_git -d "Display the current git state"
            set -l ref
            set -l dirty
            if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
              set dirty (parse_git_dirty)
              set ref (command git symbolic-ref HEAD 2> /dev/null)
              if [ $status -gt 0 ]
                set -l branch (command git show-ref --head -s --abbrev | head -n1 2> /dev/null)
                set ref "➦ $branch "
              end
              set branch_symbol \uE0A0
              set -l branch (echo $ref | sed  "s-refs/heads/-$branch_symbol -")
              if [ "$dirty" != "" ]
                prompt_segment $color_git_dirty_bg $color_git_dirty_str "$branch $dirty"
              else
                prompt_segment $color_git_bg $color_git_str "$branch $dirty"
              end
            end
          end
          function parse_git_dirty
            if [ $__fish_git_prompt_showdirtystate = "yes" ]
              set -l submodule_syntax
              set submodule_syntax "--ignore-submodules=dirty"
              set untracked_syntax "--untracked-files=$fish_git_prompt_untracked_files"
              set git_dirty (command git status --porcelain $submodule_syntax $untracked_syntax 2> /dev/null)
              if [ -n "$git_dirty" ]
                  echo -n "$__fish_git_prompt_char_dirtystate"
              else
                  echo -n "$__fish_git_prompt_char_cleanstate"
              end
            end
          end
          function prompt_finish -d "Close open segments"
            if [ -n $current_bg ]
              set_color normal
              set_color $current_bg
              echo -n "$segment_separator "
              set_color normal
            end
            set -g current_bg 000
          end
          function user_prompt
            set -l color_cwd
            switch $USER
            case root toor
              if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
              else
                set color_cwd $fish_color_cwd
              end
            case '*'
              set color_cwd $fish_color_cwd
            end
            echo -n -s [(set_color $color_cwd)(date "+%H:%M")(set_color normal)] ' ' "$USER" ' ' [(set_color $color_cwd) "$PWD" (set_color normal)] ' '
          end
          function user_suffix
            set -l suffix
            switch $USER
            case root toor
              set suffix '#'
            case '*'
              set suffix '>'
            end
            echo -n -s "$suffix "
          end
          function fish_prompt
            user_prompt
            if [ -d .git ]
              type -q git; and prompt_git
              prompt_finish
            end
            user_suffix
          end
        '';
      };
      command-not-found = {
      	enable = true;
      };
    };
  };
}