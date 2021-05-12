with import <nixpkgs> {};

#stdenvNoCC.mkDerivation rec {
stdenv.mkDerivation rec {
  name = "dataEnv";
  env = buildEnv { name = name; paths = buildInputs; };

  buildInputs = with pkgs; [
      python3
      python38Packages.pyyaml
      python38Packages.pandas
      python38Packages.numpy
      python38Packages.scipy
      python38Packages.matplotlib
      jre
      jdk
      scala
      spark
      hadoop
      maven
      pipenv
      which
      gcc
      binutils  
      readline
];

  shellHook = ''
    export KAKSESSION="$KAKSESSION-nix-dataEnv"
  '';


}

