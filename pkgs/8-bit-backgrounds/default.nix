with import <nixpkgs> {};

stdenv.mkDerivation rec {
  pname = "8-bit-backgrounds";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "SerhiyMakarenko";
    repo = "8-bit-backgrounds";
    rev = version;
    sha256 = "1k9rp1srl781kmg4wn7wcna3nrqy512pmbc1l2jw791dl9f0sb4a";
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