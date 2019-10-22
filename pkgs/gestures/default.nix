with import <nixpkgs> {};

python37Packages.buildPythonApplication rec {
  version = "0.2.2";
  pname = "gestures";

  src = fetchTarball {
    url = "https://gitlab.com/cunidev/gestures/-/archive/${version}/gestures-${version}.tar.gz";
    sha256 = "18n7j2yhh65q1rw5d3mc1b5j8my6w8nb8fgnvqlh9cf1y0yvkxa1";
  };

  doCheck = false;

  buildInputs = (with pkgs; [
    xdotool
  ]);

  propagatedBuildInputs = (with pkgs; [
    python37
    gobject-introspection
    gtk3
  ]) ++ (with python37.pkgs; [
    pygobject3
    setuptools
  ]);

  preConfigure = ''
    substituteInPlace setup.py \
      --replace "/usr/share/applications" "/share/applications"
    substituteInPlace setup.py \
      --replace "/usr/share/metainfo" "/share/metainfo"
    substituteInPlace setup.py \
      --replace "/usr/share/icons/hicolor/scalable/apps/" "/share/icons/hicolor/scalable/apps/"
  '';

  installFlags=["--install-option='--install-dir=$out'"];

  postFixup = ''
    cd $out/lib/python3.7/site-packages
    mv share ../../../
  '';

  meta = with stdenv.lib; {
    description = "A minimal Gtk+ GUI app for libinput-gestures";
    homepage = "https://gitlab.com/cunidev/gestures";
    license = with licenses; [ gpl2 ];
    platforms = platforms.all;
    maintainers = [ stdenv.lib.maintainers.serhiy_makarenko ];
  };
}