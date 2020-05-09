with import <nixpkgs> {};

stdenv.mkDerivation rec {
  pname = "mactelnet";
  version = "v0.4.4";

  src = fetchFromGitHub {
    owner = "haakonnessjoen";
    repo = "MAC-Telnet";
    rev = version;
    sha256 = "1z63dz22crrvrm0sh2cwpyqb7wqd9m45m6f2641mwmyp6hcpf4k4";
  };

  preConfigure = ''
    ./autogen.sh
  '';

  buildInputs = [ autoconf automake gettext ];

  makeFlags = [ "CFLAGS=-D_DEFAULT_SOURCE" ];

  installPhase = ''
    install -d $out/{bin,share/man/man1}
    install -c -m 644 /build/source/doc/mactelnet.1 $out/share/man/man1
    install -c -m 644 /build/source/doc/mndp.1 $out/share/man/man1
    install -c -m 644 /build/source/doc/macping.1 $out/share/man/man1
    install -c /build/source/src/mactelnet $out/bin
    install -c /build/source/src/macping $out/bin
    install -c /build/source/src/mndp $out/bin
  '';

  meta = with stdenv.lib; {
    description = "MAC Telnet client for connecting to Microtik RouterOS routers via MAC address.";
    homepage = https://github.com/haakonnessjoen/MAC-Telnet;
    license = with licenses; [ gpl2 ];
    platforms = platforms.unix;
    maintainers = [ stdenv.lib.maintainers.serhiy_makarenko ];
  };
}
