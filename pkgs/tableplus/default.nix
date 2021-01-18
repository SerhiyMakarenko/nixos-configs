with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "tableplus";
  version = "0.1.74";

  src = fetchurl {
    url = "https://deb.${name}.com/debian/pool/main/t/${name}/${name}_${version}_amd64.deb";
    sha256 = "0qnfdnh34f4h0fxnz62i3qqq3hf7gil5d0fyjb27b3p4i6hgrvk9";
  };

  buildInputs = [
    cairo
    dpkg
    gdk-pixbuf
    glib
    gtk3
    gtksourceview
    json-glib
    kerberos
    libgee
    libsecret
    openldap
    pango
  ];

  dontBuild = true;
  dontConfigure = true;
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/tableplus
    dpkg -x $src $out
    cp -R $out/opt/tableplus/* $out/share/tableplus
    rm -rf $out/opt

    mkdir -p $out/bin
    ln -s $out/share/tableplus/tableplus $out/bin/tableplus

    mkdir -p $out/share/applications/
    ln -s $out/share/tableplus/tableplus.desktop $out/share/applications/tableplus.desktop

    sed -i -e '$aCategories=Development;' $out/share/applications/tableplus.desktop
  '';

  postFixup = ''
    substituteInPlace $out/share/applications/tableplus.desktop \
      --replace "Exec=/usr/local/bin/tableplus" "Exec=$out/bin/tableplus"
    substituteInPlace $out/share/applications/tableplus.desktop \
      --replace "Icon=/opt/tableplus/resource/image/logo.png" "Icon=$out/share/tableplus/resource/image/logo.png"
    pushd $out/share/tableplus
    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" tableplus
    for file in $(find . -type f \( -name \*.node -o -name tableplus -o -name \*.so\* \) ); do
      ORIGIN=$(patchelf --print-rpath $file); \
      patchelf --set-rpath "${stdenv.lib.makeLibraryPath buildInputs}:$ORIGIN" $file
    done
    popd
  '';

  meta = with stdenv.lib; {
    homepage = https://tableplus.com/;
    description = "Modern, native, and friendly GUI tool for relational databases: MySQL, PostgreSQL, SQLite & more.";
    license = with licenses; [ mit ];
    platforms = [ "x86_64-linux" ];
    maintainers = [ stdenv.lib.maintainers.serhiy_makarenko ];
  };
}
