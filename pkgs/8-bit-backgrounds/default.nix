with import <nixpkgs> {};

stdenv.mkDerivation rec {
  pname = "8-bit-backgrounds";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "SerhiyMakarenko";
    repo = "8-bit-backgrounds";
    rev = version;
    sha256 = "19lwsy95hm0ybch836mz5hhrpk8sr9r1i37f1dmx1fx5z1mpwcdq";
  };

  nativeBuildInputs = [ meson ninja pkgconfig glib ];

  meta = with stdenv.lib; {
    description = "A 8-bit wallpaper collection for GNOME";
    homepage = "https://github.com/SerhiyMakarenko/8-bit-backgrounds";
    license = with licenses; [ gpl2 ];
    platforms = platforms.all;
    maintainers = [ stdenv.lib.maintainers.serhiy_makarenko ];
  };
}