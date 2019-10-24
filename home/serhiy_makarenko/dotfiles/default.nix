{ homedir, } @ args:
let
  file = {
    libinput-gestures = (import ./libinput-gestures.nix) args;
    sublime-text-3 = (import ./sublime-text-3.nix) args;
  };
in
{
  home = {
  	file = file;
  };
}