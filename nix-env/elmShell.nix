with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "elmShell";

  #https://github.com/NixOS/nixpkgs/issues/24485
  buildInputs = with pkgs; [
    nodejs
    elmPackages.elm
    elmPackages.elm-test
    elmPackages.elm-format
    elmPackages.elm-language-server
    kak-lsp
  ];
}

