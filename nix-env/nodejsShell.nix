with import <nixpkgs> {};
#stdenvNoCC.mkDerivation rec {
stdenv.mkDerivation rec {
  name = "personalization";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
      nodejs
  ];
  shellHook = ''
    export KAKSESSION="$KAKSESSION-personalization"
  '';
}
