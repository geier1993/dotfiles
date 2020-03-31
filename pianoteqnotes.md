ldd Pianoteq\ 6
readelf -a Pianoteq\ 6 | grep "Requesting program interpreter"
      [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]
 
ls /nix/store/ | grep glibc
ls /nix/store/ | grep glibc-2.27

or 

nix-locate -w ld-linux-x86-64

or run nix-shell pianoteqShell.nix
cat $NIX_CC/nix-support/dynamic-linker
patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" program
