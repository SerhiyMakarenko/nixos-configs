{
  home-manager.users.serhiy_makarenko = ((import ./dotfiles/default.nix) {
    homedir = "/home/serhiy_makarenko";
    }) // {
    programs = {
      ssh = import ./ssh.nix;
      git = import ../common/git.nix;
      gnome-terminal = import ./gnome-terminal.nix;
      htop = import ../common/htop.nix;
      fish = import ../common/fish.nix;
      command-not-found = import ../common/command-not-found.nix;
    };
  };
}