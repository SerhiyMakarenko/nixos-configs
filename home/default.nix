let
  home-manager = fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "03162970cd6dadfac58f169cd50aed5a5aeec14f";
    ref = "release-19.09";
  };
in
{
  imports = [
    "${home-manager}/nixos"
    ./serhiy_makarenko/default.nix
    ./root/default.nix
  ];
}
