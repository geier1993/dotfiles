with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "pandocShell";

  #https://github.com/NixOS/nixpkgs/issues/24485
  buildInputs = with pkgs; [
    #texlive.combined.scheme-medium
    # texlive full required because of varwidth.sty 
    (texlive.combine {
      inherit (texlive) scheme-full xetex fontspec euenc;
    })
    #texlive.combined.scheme-full
    fontconfig
    lmodern
    python37Packages.python
    pandoc
    haskellPackages.pandoc-citeproc
    #haskellPackages.pandoc-crossref
    #haskellPackages.pandoc-include-code
    #haskellPackages.pandoc-include
    #haskellPackages.pandoc-placetable
    #haskellPackages.pandoc-csv2table
  ];
  FONTCONFIG_FILE = makeFontsConf { fontDirectories = [ lmodern ]; };
}

