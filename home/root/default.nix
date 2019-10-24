{
  home-manager.users.root = {
  	programs = {
      ssh = import ./ssh.nix;
      git = import ../common/git.nix;
      htop = import ../common/htop.nix;
      fish = import ../common/fish.nix;
      command-not-found = import ../common/command-not-found.nix;
  	};
  };
}