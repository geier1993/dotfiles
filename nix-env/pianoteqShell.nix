with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "pianoteq";

  buildInputs = with pkgs; [
    xorg.libX11
    xorg.libXext
    freetype
    alsaLib
  ];

  LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";
}
