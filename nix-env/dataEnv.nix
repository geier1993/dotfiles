let
    pkgs = import <nixpkgs> {};
    stable = import <stable> {};
in

#stdenvNoCC.mkDerivation rec {
pkgs.stdenv.mkDerivation rec {
  name = "dataEnv";
  env = pkgs.buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
      stable.python3
      stable.python38Packages.black
      stable.python38Packages.poetry
      stable.python38Packages.pyyaml
      stable.python38Packages.pandas
      stable.python38Packages.numpy
      stable.python38Packages.scipy
      stable.python38Packages.matplotlib
      # stable.python38Packages.pymc3
      stable.python38Packages.scikitlearn
      stable.python38Packages.databricks-cli
      stable.python38Packages.databricks-connect
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

      stable.python38Packages.python-language-server
      stable.python38Packages.pyls-black
      stable.python38Packages.pyls-mypy
      stable.python38Packages.pyls-isort

      stable.python38Packages.pyodbc
      stable.unixODBC
      stable.unixODBCDrivers.msodbcsql17
      # add more drivers if required...

      stable.azure-cli
];

  shellHook = ''
    export KAKSESSION="$KAKSESSION-nix-dataEnv"
    export MSODBCSQL17=${pkgs.unixODBCDrivers.msodbcsql17}/lib/libmsodbcsql-17.7.so.1.1
  '';


}

