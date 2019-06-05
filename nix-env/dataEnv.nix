with import <nixpkgs> {};

#stdenvNoCC.mkDerivation rec {
stdenv.mkDerivation rec {
  name = "dataEnv";
  env = buildEnv { name = name; paths = buildInputs; };

  buildInputs = with pkgs; [
      python3
      python37Packages.pyyaml
      python37Packages.pandas
      python37Packages.numpy
      python37Packages.scipy
      python37Packages.matplotlib
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

