with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "pandocShell";

  buildInputs = with pkgs; [
    #texlive.combined.scheme-medium
    # texlive full required because of varwidth.sty
    texlive.combined.scheme-full
    python36Packages.python
    pandoc
    haskellPackages.pandoc-citeproc
    haskellPackages.pandoc-crossref
    #haskellPackages.pandoc-include-code
    #haskellPackages.pandoc-include
    #haskellPackages.pandoc-placetable
    #haskellPackages.pandoc-csv2table
  ];
}
