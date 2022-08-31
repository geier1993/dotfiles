{
  allowUnfree = true;
  allowBroken = true;

  # experimental-features = nix-command flakes;

  permittedInsecurePackages = [
    "webkitgtk-2.4.11"
    "python2.7-Pillow-6.2.2"
    "openssl-1.0.2u"
  ];


  packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
    nur_nixify = import (builtins.fetchTarball "https://github.com/kalbasit/nur-packages/archive/master.tar.gz") {
      inherit pkgs;
    };
    keepass-with-plugins = pkgs.keepass.override {
        plugins = [ pkgs.keepass-keepassrpc ];
    };
  };

  imports = [
    (builtins.fetchTarball {
      sha256 = "1qmq5zwd4qdxdxh4zxc7yr7qwajgnsjdw2npw0rfkyahmrqw3j02";
      url = "https://github.com/msteen/nixos-vsliveshare/archive/86624fe317c24df90e9451dd5741220c98d2249d.tar.gz";
    })
  ];

  services.vsliveshare = {
    enable = true;
    enableWritableWorkaround = true;
    enableDiagnosticsWorkaround = true;
    extensionsDir = "/home/geier/.vscode/extensions";
  };
}
