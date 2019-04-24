with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "my-environment";

  buildInputs = with pkgs; [
    texlive.combined.scheme-medium
    #texlive.combined.scheme-full
    pandoc
    haskellPackages.pandoc-citeproc
    haskellPackages.pandoc-crossref
  ];
}
