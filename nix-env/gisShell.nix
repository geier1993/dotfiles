with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "gisShell";

  buildInputs = with pkgs; [
    python37Packages.python
    python37Packages.pyyaml
    python37Packages.ipython
    python37Packages.pip
    python37Packages.virtualenvwrapper
    python37Packages.cython
  ];
}
