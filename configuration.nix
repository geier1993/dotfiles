# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

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
  boot.loader = {
      systemd-boot = {
          enable = true;
          configurationLimit = 42;
      };
      efi = {
          # canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
      };

      # grub = {
      #     # despite what the configuration.nix manpage seems to indicate,
      #     # as of release 17.09, setting device to "nodev" will still call
      #     # `grub-install` if efiSupport is true
      #     # (the devices list is not used by the EFI grub install,
      #     # but must be set to some value in order to pass an assert in grub.nix)
      #     devices = [ "nodev" ];
      #     efiSupport = true;
      #     enable = true;
      #     # set $FS_UUID to the UUID of the EFI partition
      #     extraEntries = ''
      #       menuentry "Windows" {
      #         insmod part_gpt
      #         insmod fat
      #         insmod search_fs_uuid
      #         insmod chain
      #         search --fs-uuid --set=root $FS_UUID
      #         chainloader /EFI/Microsoft/Boot/bootmgfw.efi
      #       }
      #     '';
      #     version = 2;
      #     configurationLimit = 42;
      #   };
    };


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
  time.hardwareClockInLocalTime = true; # For windows iop

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
    # pmtools
    acpica-tools
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
    # pavucontrol
    # volnoti
    kakoune
    peek
    vscodium
    #kak-lsp
    cargo
    editorconfig-core-c
    elmPackages.elm
    elmPackages.elm-test
    elmPackages.elm-format
    elmPackages.elm-language-server
    tmux
    zellij
    jq
    mtm
    notcurses
    dmenu
    rofi
    # firefox
    firefox-wayland
    chromium
    thunderbird
    #vivaldi
    #vimb
    vlc
    # xfce.thunar
    # gnome3.nautilus
    gimp
    krita
    xournalpp
    openboard
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
    ripgrep
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
    # lsix
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
    xournalpp
    catdoc
    hunspell
    # hunspellDicts.de_DE
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
    # geeqie
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
    
    # pactl
    # Here we but a shell script into path, which lets us start sway.service (after importing the environment of the login shell).
    (
      pkgs.writeTextFile {
        name = "startsway";
        destination = "/bin/startsway";
        executable = true;
        text = ''
          #! ${pkgs.bash}/bin/bash

          # first import environment variables from the login manager
          systemctl --user import-environment

          # then start the service
          exec systemctl --user start sway.service
        '';
      }
    )
  ];


  networking = {
    hostName = "jimmy"; # Define your hostname.
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd"; # or "wpa_supplicant"
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
      extraGroups = [ "wheel" "lp" "networkmanager" "network" "dialout" "audio" "video" "sys" "scanner" "kvm" "optical" "storage" "input" "disk" "floppy" "uucp" "lock" "docker" "sway" "rfkill" ];
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

      #Flipper Zero serial port
      ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", ATTRS{manufacturer}=="Flipper Devices Inc.", TAG+="uaccess"
      #Flipper Zero DFU
      ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", ATTRS{manufacturer}=="STMicroelectronics", TAG+="uaccess"
    '';

    # kmscon = {
    #   enable = false; # disabled - as login with sway
    #   extraConfig = ''
    #     xkb-layout=us,de
    #       xkb-variant=dvorak,
    #       xkb-options=grp:switch,grp:menu_toggle
    #       xkb-repeat-delay=150
    #       xkb-repeat-rate=50
    #     '';
    #   hwRender = true;
    # };

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

    # privoxy.enable = true;
    # privoxy.enableTor = true;
    # tor = {
    #   enable = true;
    #   client = {
    #     enable = true;
    #   };
    #   tsocks.enable = true;
    # };

    # gammastep = {
    #       enable = true;
    #       location = {
    #         latitude = "49.398750";
    #         longitude = "8.672434";
    #       };
    #       #package = pkgs.redshift-wlr;
    # };

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

    # xserver = {
    #   enable = false;
    #   #enable = true;
    #   #autorun = false;
    #   exportConfiguration = true;
    #   autoRepeatDelay = 150;
    #   autoRepeatInterval = 50;

    #   modules = with pkgs; [
    #           xorg.xf86inputsynaptics # xf86-input-synaptics
    #           xorg.xf86videointel # xf86-video-intel
    #           xorg.xf86inputevdev # xf86-input-evdev
    #           xorg.xf86inputkeyboard
    #           xorg.xf86inputlibinput
    #           #libinput
    #           xorg.xrdb
    #           xorg.xinit
    #           xorg.xorgserver
    #           xorg.setxkbmap
    #           xorg.xrandr
    #           xorg.xauth
    #       ];

    #   # libinput.enable = true;
    #   # videoDrivers = ["intel" "mesa-noglu" "modesetting" "nvidia"];
    #   # videoDrivers = ["intel" "modesetting" "nvidia"];
    #   videoDrivers = ["intel" "nvidia"];
    #   # videoDrivers = ["intel" "mesa-noglu" ];
    #   # videoDrivers = ["modesetting" "nvidia"];
    #   # videoDrivers = ["nvidia"];

    #   layout = "us,de";
    #   xkbVariant = "dvorak,";
    #   xkbOptions = "grp:switch,grp:menu_toggle";

    #   inputClassSections = [''
    #           Identifier "touchpad"
    #           Driver "synaptics"
    #           MatchIsTouchpad "on"
    #               Option "TapButton1" "1"
    #               Option "TapButton2" "2"
    #               Option "TapButton3" "3"
    #               Option "VertEdgeScroll" "on"
    #               Option "VertTwoFingerScroll" "on"
    #               Option "HorizEdgeScroll" "on"
    #               Option "HorizTwoFingerScroll" "on"
    #               Option "CircularScrolling" "on"
    #               Option "CircScrollTrigger" "2"
    #               #Option "EmulateTwoFingerMinZ" "40"
    #               #Option "EmulateTwoFingerMinW" "8"
    #               #Option "CoastingSpeed" "0"
    #               #Option "FingerLow" "30"
    #               #Option "FingerHigh" "50"
    #               #Option "MaxTapTime" "125"
    #     ''
    #     ''
    #       Identifier "keyboard"
    #       MatchIsKeyboard "yes"
    #       Option "XkbLayout" "us,de"
    #       Option "XkbVariant" "dvorak,"
    #       Option "XkbOptions" "grp:switch,grp:menu_toggle"
    # Option "AutoRepeat" "150 50"
    #     ''];
    #   # Enable the KDE Desktop Environment.
    #   # displayManager = {
    #   #   sddm.enable = true;
    #   # };
    #   # desktopManager = {
    #   #   plasma5.enable = true;
    #   # };
    # };
  };

  programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true; # so that gtk works properly
      extraPackages = with pkgs; [
        # swaylock
        swaylock-effects
        swaybg
        swayidle
        xwayland # for legacy apps
        waybar # statusbar
        nwg-launchers
        # pactl
        wl-clipboard
        clipman
        mako # notification daemon
        # alacritty # Alacritty is the default terminal in the config
        foot
        wofi
        # dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native
        kanshi # autorandr
        brightnessctl
        light

        # Theming
        gtk-engine-murrine
        gtk_engines
        gsettings-desktop-schemas
        # qt5.qtbase.gtk
        # gsettings-qt
        glib
        lxappearance
        lxappearance-gtk2
        lxqt.lxqt-policykit
        # lxqt.lxqt-themes
        materia-theme
        material-design-icons
        material-icons
        gruvbox-dark-icons-gtk
        numix-solarized-gtk-theme
        numix-gtk-theme
        numix-sx-gtk-theme
        numix-icon-theme
        numix-cursor-theme
        numix-icon-theme-square
        numix-icon-theme-circle
        papirus-icon-theme
        papirus-maia-icon-theme
        luna-icons
        flat-remix-icon-theme
        flat-remix-gtk
        elementary-xfce-icon-theme
        zafiro-icons
        # sweet
        # adementary-theme
        # elementary-xfce-icon-theme
        # yaru-theme
        libsForQt5.grantleetheme
        adwaita-qt


        # More
        autotiling
        flashfocus
        gammastep
        geoclue2 # for gammastep
        wf-recorder
        grim
        slurp
        swappy

        pavucontrol
        volnoti
        pasystray
        ponymix
        networkmanagerapplet
        playerctl

        pcmanfm
        cinnamon.nemo

        

        # gtk3
        # gtk4
      ];
    };
  # environment = {
  #   etc = {
  #     # Put config files in /etc. Note that you also can put these in ~/.config, but then you can't manage them with NixOS anymore!
  #     "sway/config".source = /home/geier/dotfiles/sway/.config/sway/config;
  #     "xdg/waybar/config".source = /home/geier/dotfiles/waybar/.config/waybar/config;
  #     "xdg/waybar/style.css".source = /home/geier/dotfiles/waybar/.config/waybar/style.css;
  #   };
  # };
  # programs.qt5ct.enable = true;
  qt5 = {
    enable = true;
    platformTheme = "gtk2";
    style = "gtk2";
  };

  programs.waybar.enable = true;
  programs.nm-applet.enable = true;
  programs.nm-applet.indicator = true;
  programs.gnupg.agent.pinentryFlavor = "gtk2";
  systemd.user.targets.sway-session = {
    description = "Sway compositor session";
    documentation = [ "man:systemd.special(7)" ];
    bindsTo = [ "graphical-session.target" ];
    wants = [ "graphical-session-pre.target" ];
    after = [ "graphical-session-pre.target" ];
  };
  systemd.user.services.sway = {
    description = "Sway - Wayland window manager";
    documentation = [ "man:sway(5)" ];
    bindsTo = [ "graphical-session.target" ];
    wants = [ "graphical-session-pre.target" ];
    after = [ "graphical-session-pre.target" ];
    # We explicitly unset PATH here, as we want it to be set by
    # systemctl --user import-environment in startsway
    environment.PATH = lib.mkForce null;
    serviceConfig = {
      Type = "simple";
      ExecStart = ''
        ${pkgs.dbus}/bin/dbus-run-session ${pkgs.sway}/bin/sway --debug
      '';
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
  systemd.user.services.kanshi = {
    description = "Kanshi output autoconfig ";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      # kanshi doesn't have an option to specifiy config file yet, so it looks
      # at .config/kanshi/config
      ExecStart = ''
        ${pkgs.kanshi}/bin/kanshi
      '';
      RestartSec = 5;
      Restart = "always";
    };
  };
  systemd.user.services.swayidle = {
    description = "Idle Manager for Wayland";
    documentation = [ "man:swayidle(1)" ];
    wantedBy = [ "sway-session.target" ];
    partOf = [ "graphical-session.target" ];
    path = [ pkgs.bash ];
    serviceConfig = {
      ExecStart = '' ${pkgs.swayidle}/bin/swayidle -w -d \
        timeout 300 '${pkgs.sway}/bin/swaymsg "output * dpms off"' \
        resume '${pkgs.sway}/bin/swaymsg "output * dpms on"'
      '';
    };
  };
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addAdminRule(function(action, subject) {
        return ["unix-group:wheel"];
    });
    /* Allow users in admin group to run GParted without authentication */
    polkit.addRule(function(action, subject) {
        if (action.id.indexOf("org.archlinux.pkexec.gparted") == 0 && subject.isInGroup("wheel")) {
            return polkit.Result.YES;
        }
    });
    polkit.addRule(function(action, subject) {
      if (action.id.indexOf("org.freedesktop.NetworkManager.") == 0 && subject.isInGroup("network")) {
        return polkit.Result.YES;
      }
    });
  '';
  # systemd.user.services.waybar = {
  #   description = "Highly customizable Wayland bar for Sway and Wlroots based compositors.";
  #   documentation = [ https://github.com/Alexays/Waybar/wiki/ ];
  #   wantedBy = [ "sway-session.target" ];
  #   partOf = [ "graphical-session.target" ];
  #   path = [ pkgs.bash ];
  #   serviceConfig = {
  #     ExecStart = '' ${pkgs.waybar}/bin/waybar '';
  #   };
  # };
  # end sway

  # Pipewire
  # sound.enable = true;
  # pulseaudio = {
  #   enable = true;
  #   support32Bit = true;
  #   # systemWide = true;
  #   package = pkgs.pulseaudioFull;
  #   extraModules = [ pkgs.pulseaudio-modules-bt ];
  #   extraConfig = "
  #       load-module module-switch-on-connect
  #       load-module module-bluetooth-policy auto_switch=2
  #   ";
  #   # configFile = pkgs.writeText "default.pa" ''
  #   #     load-module module-bluetooth-policy
  #   #     load-module module-bluetooth-discover
  #   #     ## module fails to load with 
  #   #     ##   module-bluez5-device.c: Failed to get device path from module arguments
  #   #     ##   module.c: Failed to load module "module-bluez5-device" (argument: ""): initialization failed.
  #   #     # load-module module-bluez5-device
  #   #     # load-module module-bluez5-discover
  #   #   '';
  # };

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    XDG_CURRENT_DESKTOP = "sway";
  };


  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    wireplumber.enable = true;
    # media-session.enable = true;
    # media-session.config.bluez-monitor.rules = [
    #   {
    #     # Matches all cards
    #     matches = [ { "device.name" = "~bluez_card.*"; } ];
    #     actions = {
    #       "update-props" = {
    #         "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
    #         # mSBC is not expected to work on all headset + adapter combinations.
    #         "bluez5.msbc-support" = true;
    #         # SBC-XQ is not expected to work on all headset + adapter combinations.
    #         "bluez5.sbc-xq-support" = true;
    #       };
    #     };
    #   }
    #   {
    #     matches = [
    #       # Matches all sources
    #       { "node.name" = "~bluez_input.*"; }
    #       # Matches all outputs
    #       { "node.name" = "~bluez_output.*"; }
    #     ];
    #     actions = {
    #       "node.pause-on-idle" = false;
    #     };
    #   }
    # ];
    
  #   config.pipewire = {
  #     "context.properties" = {
  #       #"link.max-buffers" = 64;
  #       "link.max-buffers" = 16; # version < 3 clients can't handle more than this
  #       "log.level" = 2; # https://docs.pipewire.org/#Logging
  #       #"default.clock.rate" = 48000;
  #       #"default.clock.quantum" = 1024;
  #       #"default.clock.min-quantum" = 32;
  #       #"default.clock.max-quantum" = 8192;
  #     };
  #   };
  };
  environment.etc = {
      "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
          bluez_monitor.properties = {
              ["bluez5.enable-sbc-xq"] = true,
              ["bluez5.enable-msbc"] = true,
              ["bluez5.enable-hw-volume"] = true,
              ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
          }
      '';
  };

  xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-wlr
          xdg-desktop-portal-gtk
        ];
        gtkUsePortal = true;
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

    # Enable OpenTabletDriver
    # opentabletdriver.enable = true;
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
      font-awesome
      # font-awesome-ttf
      # libertine
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
      roboto
      roboto-mono
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
         # monospace = [ "Fira Mono" ];
         # sansSerif = [ "Fira Mono" ];
         # serif     = [ "Fira Mono" ];
         monospace = [ "Fira Code Light" ];
         sansSerif = [ "Fira Code Light" ];
         serif     = [ "Fira Code Light" ];
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



  powerManagement = {
    enable = true;
  };

  security.apparmor.enable = true;

  location = {
    latitude = 49.398750;
    longitude = 8.672434;
  };

}
