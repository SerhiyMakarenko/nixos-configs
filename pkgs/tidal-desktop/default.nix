with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "tidal-hifi";
  version = "2.0.0";

  src = fetchurl {
    url = "https://github.com/Mastermindzh/${name}/releases/download/${version}/${name}_${version}_amd64.deb";
    sha256 = "1vmyh4vypblshz23yfyy6vbbsmi71a01sjwsp5n9w6j7vkfm2ch3";
  };

  buildInputs = [
    alsaLib
    atk
    at-spi2-atk
    at-spi2-core
    cairo
    cups
    dbus
    dpkg
    expat
    gdk-pixbuf
    glib
    gtk3
    nspr
    nss
    pango
    stdenv.cc.cc.lib
    udev
    xlibs.libX11
    xlibs.libxcb
    xlibs.libXcomposite
    xlibs.libXcursor
    xlibs.libXdamage
    xlibs.libXext
    xlibs.libXfixes
    xlibs.libXi
    xlibs.libXrandr
    xlibs.libXrender
    xlibs.libXScrnSaver
    xlibs.libXtst
  ];

  dontBuild = true;
  dontConfigure = true;
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/tidal
    dpkg -x $src $out
    cp -R $out/opt/tidal-hifi/* $out/share/tidal
    rm -rf $out/opt

    mkdir -p $out/bin
    ln -s $out/share/tidal/tidal-hifi $out/bin/tidal-hifi

    mkdir -p $out/share/
    cp -R $out/usr/share/* $out/share/
  '';

  postFixup = ''
    substituteInPlace $out/share/applications/tidal-hifi.desktop \
      --replace "Name=tidal-hifi" "Name=Tidal Desktop"
    substituteInPlace $out/share/applications/tidal-hifi.desktop \
      --replace "Exec=/opt/tidal-hifi/tidal-hifi %U" "Exec=$out/bin/tidal-hifi %U"
    substituteInPlace $out/share/applications/tidal-hifi.desktop \
      --replace "Icon=assets/icon.png" "Icon=$out/share/icons/hicolor/0x0/apps/tidal-hifi.png"
    substituteInPlace $out/share/applications/tidal-hifi.desktop \
      --replace "Categories=Audio;" "Categories=AudioVideo;"
    pushd $out/share/tidal
    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" tidal-hifi
    for file in $(find . -type f \( -name \*.node -o -name tidal-hifi -o -name \*.so\* \) ); do
      ORIGIN=$(patchelf --print-rpath $file); \
      patchelf --set-rpath "${stdenv.lib.makeLibraryPath buildInputs}:$ORIGIN" $file
    done
    popd
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/Mastermindzh/tidal-hifi;
    description = "The web version of listen.tidal.com running in electron with hifi support thanks to widevine.";
    license = with licenses; [ mit ];
    platforms = [ "x86_64-linux" ];
    maintainers = [ stdenv.lib.maintainers.serhiy_makarenko ];
  };
}
