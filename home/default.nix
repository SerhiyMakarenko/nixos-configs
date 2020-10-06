let
  home-manager = fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    ref = "release-20.03";
  };
in
{
  imports = [
    "${home-manager}/nixos"
    ./serhiy_makarenko/default.nix
    ./root/default.nix
  ];
}
