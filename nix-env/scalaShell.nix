# with import <nixpkgs> {};
let
    pkgs = import <nixpkgs> {};
    stable = import <stable> {};
in
#stdenvNoCC.mkDerivation rec {
pkgs.stdenv.mkDerivation rec {
  name = "scalaEnv";
  env = pkgs.buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
      stable.azure-cli
      pkgs.sbt
      pkgs.scala
      pkgs.scalafmt
      pkgs.metals

      # Required for pyspark
      pkgs.jdk11
];

  shellHook = ''
    export KAKSESSION="$KAKSESSION-nix-scala"
    # fixes libstdc++ issues and libgl.so issues
    LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib/:/run/opengl-driver/lib/
    # fixes xcb issues :
    export QT_PLUGIN_PATH=${pkgs.qt5.qtbase}/${pkgs.qt5.qtbase.qtPluginPrefix}

    export DBW_PATH="/Users/philipp.geier@smart-digital.de"
  '';

}

