let
  dotfiles = {
    sublime-text-3 = import ./sublime-text-3.nix;
    cantata = import ./cantata.nix;
    mpd = import ./mpd.nix;
  };
in

{
  programs = {
    ssh = import ./ssh.nix;
    git = import ./git.nix;
    vim = import ./vim.nix;
    htop = import ./htop.nix;
    fish = import ./fish.nix;
    gnome-terminal = import ./gnome-terminal.nix;
  };
  home = {
    file = dotfiles;
  };
}
