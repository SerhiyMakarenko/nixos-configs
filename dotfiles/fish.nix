with import <nixpkgs> {};

{
  enable = true;
  shellInit = ''
    set -g current_bg 000
    set -q color_git_dirty_bg; or set color_git_dirty_bg yellow
    set -q color_git_dirty_str; or set color_git_dirty_str black
    set -q color_git_bg; or set color_git_bg green
    set -q color_git_str; or set color_git_str black
    set -q fish_git_prompt_untracked_files; or set fish_git_prompt_untracked_files normal
    set -g __fish_git_prompt_showdirtystate "yes"
    set -g __fish_git_prompt_char_dirtystate "±"
    set -g __fish_git_prompt_char_cleanstate ""
    if test -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
      fenv source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
    end
    if test -e "/nix/var/nix/profiles/default/etc/profile.d/nix.sh"
      fenv source "/nix/var/nix/profiles/default/etc/profile.d/nix.sh"
    end
    if test -d "$HOME/.ssh/rsa"
      setenv SSH_ENV "$HOME/.ssh/ssh_agent_env"
      if [ -n "$SSH_AGENT_PID" ]
        ps -ef | grep -q "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
        if [ $status -eq 0 ]
          test_identities
        end
      else
        if [ -f $SSH_ENV ]
          . $SSH_ENV > /dev/null
        end
        ps -ef | grep -q "$SSH_AGENT_PID" | grep -v grep | grep ssh-agent > /dev/null
        if [ $status -eq 0 ]
          test_identities
          else
          start_agent
        end
      end
    end
  '';
  promptInit = ''
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
      if test -n "$IN_NIX_SHELL"
        echo -n (set_color $color_cwd)"<nix-shell> "(set_color normal)
      end
      echo -n -s [(set_color $color_cwd)(date "+%H:%M")(set_color normal)] ' ' "$USER" ' ' [(set_color $color_cwd) "$PWD" (set_color normal)] ' '
    end
    function prompt_finish
      if [ -n $current_bg ]
        set_color normal
        set_color $current_bg
        echo -n " "
        set_color normal
      end
      set -g current_bg 000
    end
  '';
  shellAliases = {
    ll = "ls -lah";
  };
  functions = {
    test_identities = {
    body = "ssh-add -l | grep 'The agent has no identities' > /dev/null
  if [ $status -eq 0 ]
    ssh-add ~/.ssh/rsa/SM.Gitlab.rsa > /dev/null 2>&1
    if [ $status -eq 2 ]
      start_agent
    end
  end";
    };
    start_agent = {
    body = "ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
  chmod 600 $SSH_ENV 
  . $SSH_ENV > /dev/null
  ssh-add ~/.ssh/rsa/SM.Gitlab.rsa > /dev/null 2>&1";
    };
    fish_greeting = {
    body = "if test -n \"$IN_NIX_SHELL\"
  else
    set -l wireless (ls /sys/class/net/ | awk '/[w]l/{print}')
    set -l wired (ls /sys/class/net/ | awk '/[e]n/{print}')
    echo Hostname is (set_color green)(hostname)(set_color normal)
    echo HP ZBook 14u G6 running (set_color green)(cat /etc/os-release | awk -F \"\\\"\" 'FNR == 5 {print $2}')(set_color normal)
    echo You logged in as (set_color green)(whoami)(set_color normal)
    if [ (ip addr show $wireless | awk 'FNR == 1 {print $9}') = 'UP' ]
      echo Wi-Fi connection status: IP is (set_color green)(ip addr show $wireless | awk 'FNR == 3 {print $2}' | cut -d '/' -f1)(set_color normal)
    else
      echo Wi-Fi connection status: (set_color red)not connected(set_color normal)
    end
    if [ (ip addr show $wired | awk 'FNR == 1 {print $9}') = 'UP' ]
      echo Ethernet connection status: IP  is (set_color green)(ip addr show $wired | awk 'FNR == 3 {print $2}' | cut -d '/' -f1)(set_color normal)
    else
      echo Ethernet connection status: (set_color red)not connected(set_color normal)
    end
    echo -----------------------------------------------------------------
    uptime
    echo -----------------------------------------------------------------
    who -aH
    echo -----------------------------------------------------------------
  end";
    };
    fish_prompt = {
    body = "user_prompt
  if test -z \"$IN_NIX_SHELL\"
    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
      prompt_git
      prompt_finish
    end
  end
  user_suffix";
    };
    user_suffix = {
    body = "set -l suffix
  switch $USER
  case root toor
    set suffix '#'
  case '*'
    set suffix '>'
  end
  echo -n -s \"$suffix \"";
    };
    parse_git_dirty = {
    body = "if [ $__fish_git_prompt_showdirtystate = \"yes\" ]
    set -l submodule_syntax
    set submodule_syntax \"--ignore-submodules=dirty\"
    set untracked_syntax \"--untracked-files=$fish_git_prompt_untracked_files\"
    set git_dirty (command git status --porcelain $submodule_syntax $untracked_syntax 2> /dev/null)
    if [ -n \"$git_dirty\" ]
      echo -n \"$__fish_git_prompt_char_dirtystate\"
    else
      echo -n \"$__fish_git_prompt_char_cleanstate\"
    end
  end";
    };
  };
  plugins = [
    {
      name = "foreign-env";
      src = pkgs.fetchFromGitHub {
        owner = "oh-my-fish";
        repo = "plugin-foreign-env";
        rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
        sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
      };
    }
  ];
}