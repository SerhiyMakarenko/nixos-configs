with import <nixpkgs> {};

python38.withPackages (pkgs: with pkgs; [
  virtualenv
  setuptools
  pip
])
