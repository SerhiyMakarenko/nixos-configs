with import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {};
with python38Packages;

buildPythonPackage rec {
  version = "1.7.0";
  pname = "organize-tool";

  src = fetchPypi {
    inherit pname version;
    sha256 = "15yyh3ycb1f7q5ig7gq5ppwaf1wpx5dr906w80rfzlkh0z8byvh3";
  };

  doCheck = false;

  propagatedBuildInputs = [
    send2trash
    appdirs
    colorama
    pyyaml
    docopt
    exifread
    pathlib2
  ];

  meta = with stdenv.lib; {
    description = "The file management automation tool";
    homepage = "https://github.com/tfeldmann/organize";
    license = with licenses; [ mit ];
    platforms = platforms.all;
    maintainers = [ stdenv.lib.maintainers.serhiy_makarenko ];
  };
}
