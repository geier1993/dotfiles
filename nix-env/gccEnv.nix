with import <nixpkgs> {};
#stdenv.mkDerivation rec {
stdenvNoCC.mkDerivation rec {
  name = "cardlibs";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    glibc_multi
    #cmake
    cmakeCurses
    #gcc6
    gcc7
    #clang
    libcxx
    libcxxabi
    #openssl
    #wolfssl
    zlib
    sqlite
    libusb
  ];
  shellHook = ''
    export KAKSESSION="$KAKSESSION-nix-cardlibs"
  '';
}
