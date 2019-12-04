with import <nixpkgs> {};

python37.withPackages (pkgs: with pkgs; [
  virtualenv
  setuptools
  pip
])