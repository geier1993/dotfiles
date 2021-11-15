let
    pkgs = import <nixpkgs> {};
    stable = import <stable> {};
in

#stdenvNoCC.mkDerivation rec {
pkgs.stdenv.mkDerivation rec {
  name = "dataEnv";
  env = pkgs.buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
      pkgs.python3
      pkgs.python38Packages.black
      pkgs.python38Packages.poetry
      pkgs.python38Packages.pyyaml
      pkgs.python38Packages.pandas
      pkgs.python38Packages.numpy
      pkgs.python38Packages.scipy
      pkgs.python38Packages.matplotlib
      # pkgs.python38Packages.pymc3
      pkgs.python38Packages.scikitlearn
      pkgs.python38Packages.databricks-cli
      pkgs.python38Packages.databricks-connect
      pkgs.jre
      pkgs.jdk
      pkgs.scala
      pkgs.spark
      # pkgs.hadoop
      pkgs.maven
      pkgs.pipenv
      pkgs.which
      pkgs.gcc
      pkgs.binutils  
      pkgs.readline

      pkgs.python38Packages.python-language-server
      pkgs.python38Packages.pyls-black
      pkgs.python38Packages.pyls-mypy
      pkgs.python38Packages.pyls-isort

      pkgs.python38Packages.pyodbc
      pkgs.unixODBC
      pkgs.unixODBCDrivers.msodbcsql17
      # add more drivers if required...

      stable.azure-cli
];

  shellHook = ''
    export KAKSESSION="$KAKSESSION-nix-dataEnv"
    export MSODBCSQL17=${pkgs.unixODBCDrivers.msodbcsql17}/lib/libmsodbcsql-17.7.so.1.1
  '';


}

