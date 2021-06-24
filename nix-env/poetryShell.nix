with import <nixpkgs> {};

#stdenvNoCC.mkDerivation rec {
stdenv.mkDerivation rec {
  name = "poetryEnv";
  env = buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
      python3
      python38Packages.poetry

      python38Packages.python-language-server
      python38Packages.pyls-black
      python38Packages.pyls-mypy
      python38Packages.pyls-isort

];

  shellHook = ''
    export KAKSESSION="$KAKSESSION-nix-poetryEnv"
  '';


}

