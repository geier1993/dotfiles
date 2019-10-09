with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "gisShell";

  buildInputs = with pkgs; [
    pkg-config
    xmlsec  # python3-saml
    libxslt # required by xmlsec
    libxml2
    libtool # libltdl
    zlib 
    python37Packages.python
    python37Packages.pyyaml
    python37Packages.ipython
    python37Packages.pip
    python37Packages.virtualenvwrapper
    python37Packages.cython
    python37Packages.Nuitka # Python compilation with CPython in background
    # pypy  # really fast python interpreter (Just-In-Time Compilation)
  ];
}
