let
  username = "root";
in
{
  home-manager.users.${username} = ((import ../dotfiles/default.nix) {
    homedir = "/${username}";
    username = "${username}";
    }) // {
    programs = {
      ssh = import ./ssh.nix;
      git = import ../common/git.nix;
      htop = import ../common/htop.nix;
      fish = import ../common/fish.nix;
      command-not-found = import ../common/command-not-found.nix;
    };
  };
}