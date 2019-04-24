# https://sid-kap.github.io/posts/2018-03-08-nix-pipenv.html
with import <nixpkgs> {};
let
  manyLinuxFile =
    writeTextDir "_manylinux.py"
      ''
        print("in _manylinux.py")
        manylinux1_compatible = True
      '';
  in
  buildFHSUserEnv {
    name = "my-python-env";
    targetPkgs = pkgs: with pkgs; [
      python3
      python36Packages.pyyaml
      python36Packages.pandas
      python36Packages.numpy
      python36Packages.scipy
      python36Packages.matplotlib
      pipenv
      which
      gcc
      binutils

      # All the C libraries that a manylinux_1 wheel might depend on:
      ncurses
      xorg.libX11
      xorg.libXext
      xorg.libXrender
      xorg.libICE
      xorg.libSM
      glib
    ];

    runScript = "$SHELL";
    profile = ''
      export PYTHONPATH=${manyLinuxFile.out}:/usr/lib/python3.6/site-packages
    '';
  }
