{ homedir, username, } @ args:
let
  serhiy_dotfiles = {
    libinput-gestures = (import ./libinput-gestures.nix) args;
    sublime-text-3 = (import ./sublime-text-3.nix) args;
    nixpkgs-config = (import ./nixpkgs-config.nix) args;
    cantata = (import ./cantata.nix) args;
  };
   root_dotfiles = {
    sublime-text-3 = (import ./sublime-text-3.nix) args;
  };
in
(if "${username}" == "serhiy_makarenko" then {
  home = {
    file = serhiy_dotfiles;
  };
} else {
  home = {
    file = root_dotfiles;
  };
})