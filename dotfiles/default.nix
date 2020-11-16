{
  home-manager.users.serhiy_makarenko = { pkgs, ... }: {
    programs = {
      ssh = import ./ssh.nix;
      git = import ./git.nix;
      fish = import ./fish.nix;
      htop = import ./htop.nix;
    };
  };
}