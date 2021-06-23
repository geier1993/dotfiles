with import <nixpkgs> {};

#stdenvNoCC.mkDerivation rec {
stdenv.mkDerivation rec {
  name = "poetryEnv";
  env = buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
      python3
      python38Packages.poetry
];

  shellHook = ''
    export KAKSESSION="$KAKSESSION-nix-poetryEnv"
  '';


}

