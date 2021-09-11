# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# let
#   nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
#     export __NV_PRIME_RENDER_OFFLOAD=1
#     export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
#     export __GLX_VENDOR_LIBRARY_NAME=nvidia
#     export __VK_LAYER_NV_optimus=NVIDIA_only
#     exec -a "$0" "$@"
#   '';
# in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
    #allowBroken = true;
    firefox = {
      enablePepperFlash = true;
    };

    # Explicit pulseaudio support in applications
    pulseaudio = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.kernelPatches = [ {
  #    name = "thunderbolt";
  #    patch = null;
  #    extraConfig = ''
  #      THUNDERBOLT y
  #      HOTPLUG_PCI y
  #      HOTPLUG_PCI_ACPI y
  #    '';
  # } ];


  # Select internationalisation properties.
  console = {
    font = "Lat2-Terminus16";
    keyMap = "dvorak";
    #defaultLocale = "en_GB.UTF-8";
    #defaultLocale = "en_US.UTF-8";
  };

  i18n = {
    #defaultLocale = "en_GB.UTF-8";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # environment.shells = with pkgs; [bashInteractive zsh];
  environment.shells = with pkgs; [bashInteractive fish];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # nvidia-offload
    ntfs3g  # to mount windows
    cifs-utils
    nfs-utils
    sshfs-fuse
    exfat
    parted
    gpart
    gparted
    hdf5
    nox
    nix-index # contains nix-locate
    # glibcLocales
    # #glibc = { locales = true; };
    # xorg.xf86inputsynaptics # xf86-input-synaptics
    # #xorg.xf86videointel # xf86-video-intel
    # xorg.xf86inputevdev # xf86-input-evdev
    # xorg.xf86inputkeyboard
    # xorg.xf86inputlibinput
    # #libinput
    # xorg.xrdb
    # xorg.xinit
    # xorg.xorgserver
    # xorg.setxkbmap
    # xorg.xrandr
    # xorg.xauth
    gnumake
    automake
    autoconf
    ninja
    libtool
    pkgconfig
    clang
    gcc
    gdb rr linuxPackages.perf
    socat
    gmp
    cmake
    cmakeCurses
    binutils
    zlib
    nix-serve
    nix-prefetch-git
    git
    gitAndTools.diff-so-fancy
    gitAndTools.gh
    subversion
    git-lfs
    stow
    # hdparm
    acpi
    acpid
    acpitool
    pmtools
    usbutils
    wget
    bash
    bash-completion
    bashInteractive
    kbd
    ffmpeg # for sway
    #gdk-pixbuf # for sway
    libjpeg
    imagemagick
    imagemagickBig
    # i3-gaps # required for sway configuration until everything is dropped
    # i3lock
    xautolock
    compton
    # i3status
    # i3blocks-gaps
    # i3blocks
    # wmctrl # required for i3+plasma
    # scrot # screenshot
    spectacle # KDE screenshot
    feh
    #poppler
    poppler_utils
    # arandr
    #autorandr
    # lm_sensors
    # sysstat
    playerctl
    pango
    perlPackages.Pango
    # xwayland
    # networkmanager
    # networkmanagerapplet
    # wpa_supplicant
    #dunst
    # pamixer
    # ponymix
    # pasystray
    pavucontrol
    # volnoti
    kakoune
    vscodium
    #kak-lsp
    cargo
    editorconfig-core-c
    elmPackages.elm
    elmPackages.elm-test
    elmPackages.elm-format
    elmPackages.elm-language-server
    tmux
    dmenu
    rofi
    firefox
    chromium
    thunderbird
    #vivaldi
    #vimb
    vlc
    # xfce.thunar
    # gnome3.nautilus
    gimp
    darktable
    enblend-enfuse # panorama images
    hugin # panorama images
    rxvt_unicode-with-plugins
    #st # terminal
    urxvt_perls
    terminator termite
    kitty
    zathura
    pdfgrep
    pdftk
    okular
    # ghc
    # stack
    # cabal-install
    nodejs
    nodePackages.typescript
    flow # static type checker
    direnv
    # bluez
    bluez-tools
    silver-searcher
    platinum-searcher
    #zsh
    #zsh-autosuggestions
    #zsh-completions
    #zsh-navigation-tools
    #zsh-syntax-highlighting
    # libva
    # libvdpau
    # libvdpau-va-gl
    # vaapiIntel # libva-intel-driver
    # vaapiVdpau # libva-vdpau-driver
    # microcodeIntel # microcode-intel
    # powertop #intel
    # intel-gpu-tools
    # beignet
    #brightnessctl light
    #bluetoothctl
    xsel
    #mesa_noglu
    libnotify
    # vtk
    unzip
    zip
    p7zip
    w3m
    ranger
    tree
    vim
    thermald
    pygmentex
    texlive.combined.scheme-full
    lmodern
    rsync
    #redshift
    #geoclue
    #despotify
    #python27
    ruby bundix
    python38Full
    python38
    python38Packages.pip
    python38Packages.ipython
    # python38Packages.numpy
    # python38Packages.scipy
    # python38Packages.matplotlib
    # python38Packages.seaborn
    # python38Packages.pandas
    # python38Packages.pandocfilters
    mlocate
    lm_sensors
    linuxHeaders
    libreoffice-fresh
    catdoc
    hunspell
    aspell
    aspellDicts.de
    aspellDicts.en
    aspellDicts.fr
    inkscape
    i7z
    htop
    ncurses
    gnupg pinentry
    #gpicview
    geeqie
    clutter clutter-gtk
    gpicview
    #gliv
    fasd
    fzf
    # pandoc
    biber
    # haskellPackages.pandoc-citeproc
    #haskellPackages.pandoc-crossref
    #haskellPackages.pandoc-csv2table
    dbus
    busybox
    cryptsetup
    clamav
    cmake
    #linuxPackages.cpupower
    # cpufrequtils
    boost
    mkpasswd
    meson
    cairo
    # conky
    dropbox
    #google-cloud-sdk
    jdk
    jre
    # eclipses.eclipse-cpp
    # eclipses.eclipse-java
    # eclipses.eclipse-scala-sdk
    # eclipses.eclipse-sdk
    # steam
    # steam-run
    # krohnkite
    # xorg.libX11
    # xorg.libXext
    lua
    perl
    spotify
    slack
    # xlibsWrapper
    #wine
    #winetricks
    #protontricks
    #steam-run
  ];


  networking = {
    hostName = "jimmy"; # Define your hostname.
    networkmanager.enable = true;
    wireless.enable = false;  # Enables wireless support via wpa_supplicant.
    wireless.userControlled.enable = true;
    wireless.userControlled.group = "network";

    extraHosts = ''
      127.0.0.1 db
    '';

    firewall = {
      # Open ports in the firewall.
      allowedTCPPorts = [
        # 22 # ssh - automaticall
        80 # HTTP
        443 # HTTPS
      ];
      allowedUDPPorts = [
        # 5353 # MDNS - multicast dns
        # 427 # SLP - server location protocol
      ];
      # Or disable the firewall altogether.
      enable = true;
      allowPing = true;
    };
  };



  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.extraUsers.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };

  # users.defaultUserShell = pkgs.zsh;
  users.defaultUserShell = pkgs.fish;
  #users.users.geier =
  users.extraUsers.geier =
    {
      isNormalUser = true;
      name = "geier";
      home = "/home/geier";
      hashedPassword = "$6$cG2jGEtZXcQ/4U4L$8z6a.OUetzdmy9/TZslXXMsoZ0QUhlftkxF.ZjPFz2qUQ2tk9RVRwwjdO45TkQmgAigmfjRDR/.chZgLVvcab0"; # mkpasswd -m sha-512
      initialHashedPassword = "$6$cG2jGEtZXcQ/4U4L$8z6a.OUetzdmy9/TZslXXMsoZ0QUhlftkxF.ZjPFz2qUQ2tk9RVRwwjdO45TkQmgAigmfjRDR/.chZgLVvcab0"; # mkpasswd -m sha-512
      uid = 1000;
      description = "Philpp Geier";
      extraGroups = [ "wheel" "lp" "networkmanager" "dialout" "audio" "video" "sys" "scanner" "kvm" "optical" "storage" "input" "disk" "floppy" "uucp" "lock" "docker" "sway" "rfkill" ];
      openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3fHurt4sgmcc9j5nw4DGcmy8j0zSp0IQcD0RMU0bsbkwq/RfyvEfrLqOEQ0Oj7oO+ESNuLmB14dgZAmJ1M8UIrZONqRijmYL6iat+rqXlJksFh9aLwt9Ubarg0bnfhJDBaWGBhtmP00tIKn2TKQqw5F5CIMMXc9GbKD0mWUCS2tR+acjj6SOOwDSUsk5SnEYZz5kTbBtYPxgDj/wkmTPI/s2dNb241P5gdBnhiSRnTWe608VzD1bJOb3jc/qIZekjOqAWbP5zOj/5OVakFmh1gaJ8md90kE+/FmnAw69cLTAYlz1QtfvpNhOVQAUhUE3ring69o8mO/zv/PAm1Mst geier@jimmy" ];
    };
  #users.mutableUsers = false;

  # The NixOS release to be compatible with for stateful data such as databases.
  system = {
    autoUpgrade.enable = true;
    stateVersion = "21.05";
  };

  systemd.services.kbdrate = {
    description = "Keyboard repeat rate in tty";
    serviceConfig = {
      Type = "simple";
      RemainAfterExit="yes";
      StandardInput="tty";
      StandardOutput="tty";
      #ExecStart = "${pkgs.ipfs}/bin/kbdrate -s -d 150 -r 50";
      ExecStart = "${pkgs.kbd}/bin/kbdrate -s -d 150 -r 50";
      #ExecStop = "pkill ....";
      Restart = "on-failure";
    };
    wantedBy = [ "multi-user.target" ];
    enable = true;
  };

  # # https://github.com/shosti/nixos-config/blob/master/configuration.nix
  # # Make sure screen is locked on suspend
  # systemd.services."i3lock" = {
  #   enable = true;
  #   description = "i3lock";
  #   wantedBy = [ "suspend.target" "hibernate.target" ];
  #   before = [ "systemd-suspend.service" "systemd-hibernate.target" ];
  #   serviceConfig = {
  #     Type = "forking";
  #     User = "geier"; # unfortunately necessary :(
  #   };
  #   script = "${pkgs.i3lock}/bin/i3lock";
  #   postStart = "${pkgs.coreutils}/bin/sleep 1";
  #   environment = { DISPLAY = ":0"; };
  # };

  # List services that you want to enable:
  services = {
    # syncthing = {
    #   user = "geier";
    #   enable = true;
    #   dataDir = "/home/geier/.syncthing";
    # };

    #ntp.enable = true;
    timesyncd.enable = true;

    locate = {
      enable = true;
      interval = "hourly";
      localuser = null;
      locate = pkgs.mlocate;
      extraFlags = [ "-n '.git .backups .Trash .mail .cache vendor'" ];
    };

    # allow access for user
    #udev.path = with pkgs; [utillinux];
    udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/%k/brightness"
      ACTION=="add", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/backlight/%k/brightness"
      ACTION=="add", SUBSYSTEM=="leds", RUN+="${pkgs.coreutils}/bin/chgrp input /sys/class/leds/%k/brightness"
      ACTION=="add", SUBSYSTEM=="leds", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/leds/%k/brightness"
      ACTION=="add", SUBSYSTEM=="thunderbolt", ATTR{authorized}=="0", ATTR{authorized}="1"
    '';

    kmscon = {
      enable = false; # disabled - as login with sway
      extraConfig = ''
        xkb-layout=us,de
          xkb-variant=dvorak,
          xkb-options=grp:switch,grp:menu_toggle
          xkb-repeat-delay=150
          xkb-repeat-rate=50
        '';
      hwRender = true;
    };

    acpid = {
      enable = true;
    };
    hdapsd = {
      enable = true;
    };

    # Enable the OpenSSH daemon.
    openssh = {
      permitRootLogin = "no";
      enable = true;
    };


    dnscrypt-proxy2 = {
      enable = true;
      #localPort = 43;
    };
    dnsmasq = {
      enable = true;
      servers = [ "127.0.0.1#43" ];
    };

    privoxy.enable = true;
    privoxy.enableTor = true;
    tor = {
      enable = true;
      client = {
        enable = true;
      };
      tsocks.enable = true;
    };

    redshift = {
          enable = true;
          #location = {
          #  latitude = "49.398750";
          #  longitude = "8.672434";
          #};
    };

    tlp = {
        enable = true;
        # settings = ''
        #   DEVICES_TO_DISABLE_ON_STARTUP="bluetooth"
        # '';
    };
    upower.enable = true;
    udisks2.enable = true;
    printing = {
      enable = true;
      browsing = true;
      drivers = with pkgs; [ splix hplip hplipWithPlugin gutenprint gutenprintBin cups cups-filters foomatic-filters cups-bjnp cups-dymo ]; # hplip hplipWithPlugins
    };
    avahi = {
      enable = true;
      nssmdns = true;
     };

    xserver = {
      #enable = false;
      enable = true;
      #autorun = false;
      exportConfiguration = true;
      autoRepeatDelay = 150;
      autoRepeatInterval = 50;

      modules = with pkgs; [
              xorg.xf86inputsynaptics # xf86-input-synaptics
              xorg.xf86videointel # xf86-video-intel
              xorg.xf86inputevdev # xf86-input-evdev
              xorg.xf86inputkeyboard
              xorg.xf86inputlibinput
              #libinput
              xorg.xrdb
              xorg.xinit
              xorg.xorgserver
              xorg.setxkbmap
              xorg.xrandr
              xorg.xauth
          ];

      # libinput.enable = true;
      # videoDrivers = ["intel" "mesa-noglu" "modesetting" "nvidia"];
      # videoDrivers = ["intel" "modesetting" "nvidia"];
      videoDrivers = ["intel" "nvidia"];
      # videoDrivers = ["intel" "mesa-noglu" ];
      # videoDrivers = ["modesetting" "nvidia"];
      # videoDrivers = ["nvidia"];

      layout = "us,de";
      xkbVariant = "dvorak,";
      xkbOptions = "grp:switch,grp:menu_toggle";

      inputClassSections = [''
              Identifier "touchpad"
              Driver "synaptics"
              MatchIsTouchpad "on"
                  Option "TapButton1" "1"
                  Option "TapButton2" "2"
                  Option "TapButton3" "3"
                  Option "VertEdgeScroll" "on"
                  Option "VertTwoFingerScroll" "on"
                  Option "HorizEdgeScroll" "on"
                  Option "HorizTwoFingerScroll" "on"
                  Option "CircularScrolling" "on"
                  Option "CircScrollTrigger" "2"
                  #Option "EmulateTwoFingerMinZ" "40"
                  #Option "EmulateTwoFingerMinW" "8"
                  #Option "CoastingSpeed" "0"
                  #Option "FingerLow" "30"
                  #Option "FingerHigh" "50"
                  #Option "MaxTapTime" "125"
        ''
        ''
          Identifier "keyboard"
          MatchIsKeyboard "yes"
          Option "XkbLayout" "us,de"
          Option "XkbVariant" "dvorak,"
          Option "XkbOptions" "grp:switch,grp:menu_toggle"
    Option "AutoRepeat" "150 50"
        ''];
      # Enable the KDE Desktop Environment.
      displayManager = {
        sddm.enable = true;
      };
      desktopManager = {
        plasma5.enable = true;
      };

    };
  };

  hardware = {
    #brightnessctl.enable = true;
    opengl = {
      enable = true;
      # extraPackages = with pkgs; [vaapiIntel vaapiVdpau libvdpau-va-gl glxinfo]; # mesa_drivers
      # extraPackages32 = with pkgs; [vaapiIntel vaapiVdpau libvdpau-va-gl glxinfo pkgsi686Linux.libva ]; # mesa_drivers
      driSupport = true;
      driSupport32Bit = true;
      # extraPackages = with pkgs; [
      #   vaapiIntel
      #   vaapiVdpau
      #   libvdpau-va-gl
      #   intel-media-driver 
      # ];
    };

    nvidia.modesetting.enable = true;
    nvidia.prime = {
      offload.enable = true;
      # sync.enable = true;
      # sync.allowExternalGpu = true;
      # enable = true;
      # allowExternalGpu = true;
      # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
      intelBusId = "PCI:0:2:0";

      # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
      nvidiaBusId = "PCI:6:0:0";
      # sync.enable = false;
    };

    enableAllFirmware = true;

    pulseaudio = {
      enable = true;
      support32Bit = true;
      # systemWide = true;
      package = pkgs.pulseaudioFull;
      extraModules = [ pkgs.pulseaudio-modules-bt ];
      extraConfig = "
          load-module module-switch-on-connect
          load-module module-bluetooth-policy auto_switch=2
      ";
      # configFile = pkgs.writeText "default.pa" ''
      #     load-module module-bluetooth-policy
      #     load-module module-bluetooth-discover
      #     ## module fails to load with 
      #     ##   module-bluez5-device.c: Failed to get device path from module arguments
      #     ##   module.c: Failed to load module "module-bluez5-device" (argument: ""): initialization failed.
      #     # load-module module-bluez5-device
      #     # load-module module-bluez5-discover
      #   '';
    };

    sane = {
      enable = true;
      #extraBackends = [ pkgs.hplipWithPlugin ];
    };

    bluetooth = {
      enable = true;
      powerOnBoot = false;
      # powerOnBoot = true;
      settings = {
        General = {
            Disable = "Headset";
            Enable = "Source,Sink,Media,Socket";
        };
      };
    };

    cpu.intel.updateMicrocode = true;
  };
  systemd.user.services.pulseaudio.enable = true;

  virtualisation.docker.enable = true;
  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;
  # users.extraGroups.vboxusers.members = [ "geier" ];

  fonts = {
    enableDefaultFonts = true;
    enableGhostscriptFonts = false;
    fontDir.enable = true;
    fonts = with pkgs; [
      corefonts
      dejavu_fonts
      freefont_ttf
      ttf_bitstream_vera
      terminus_font
      terminus_font_ttf
      symbola
      font-awesome-ttf
      libertine
      ubuntu_font_family
      liberation_ttf
      inconsolata
      # vistafonts
      unifont
      cm_unicode
      ipafont
      baekmuk-ttf
      source-han-sans-japanese
      source-han-sans-korean
      source-han-sans-simplified-chinese
      source-han-sans-traditional-chinese
      source-sans-pro
      source-serif-pro
      source-code-pro
      fira
      fira-code
      fira-mono
      hasklig
      noto-fonts
      google-fonts
      powerline-fonts
      ubuntu_font_family
      freetype
    ];
    fontconfig = {
      defaultFonts = {
         # monospace = [ "DejaVu Sans Serif" ];
         # sansSerif = [ "DejaVu Sans Serif" ];
         # serif     = [ "DejaVu Sans Serif" ];
         monospace = [ "Fira Mono" ];
         sansSerif = [ "Fira Mono" ];
         serif     = [ "Fira Mono" ];
      };
    };
  };

  programs.light = {
    enable = true;
  };

  # programs.zsh = {
  #   enable = true;
  #   #enableAutosuggestions = true;
  #   autosuggestions.enable = true;
  #   enableCompletion = true;
  #   syntaxHighlighting.enable = true;
  # };

  programs.fish = {
      enable = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  sound.enable = true;

  powerManagement = {
    enable = true;
  };

  security.apparmor.enable = true;

  location = {
    latitude = 49.398750;
    longitude = 8.672434;
  };

}
