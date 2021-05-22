let
  scripts = {
    screensaver-monitor-script = import ./screensaver-monitor-script.nix;
  };
in

{
  home = {
    file = scripts;
  };
}
