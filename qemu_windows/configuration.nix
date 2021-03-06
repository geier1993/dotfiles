# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
    #allowBroken = true;
    #permittedInsecurePackages = [ "webkitgtk-2.4.11" ];
    firefox = {
      enableGoogleTalkPlugin = true;
      enablePepperFlash = true;
      #enableAdobeFlash = true;
      #enableGTK3 = true; # recompilation required :(
      # ffmpegSupport = false;
      # jre = true;
      # enableMPlayer = true; # will use MPV instead, see: https://addons.mozilla.org/en-US/firefox/addon/watch-with-mpv/
      icedtea = true;
    };
    #chromium = {
    #  enablePepperFlash = true;
    #  enablePepperPDF = true;
      #enableAdobeFlash = true; # for Chromium
    #  enableWideVine = true;
      # hiDPISupport = true; # recompilation required :(
      # jre = true;
    #  icedtea = true;
    #};
    pulseaudio = true;

    packageOverrides = pkgs:  
      { 
        #sway = pkgs.sway.overrideAttrs (oldAttrs: { buildInputs = oldAttrs.buildInputs ++ [pkgs.gdk_pixbuf];});
        #polybar = pkgs.polybar.overrideAttrs (oldAttrs: { i3Support = true; jsoncpp =true; });
      };

  };



  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/sda";
  boot.initrd.checkJournalingFS = false;

  fileSystems."/U_DRIVE" = {
    fsType = "vboxsf";
    device = "U_DRIVE";
    options = [ "rw" ];
  };

  fileSystems."/vmshare" = {
    fsType = "vboxsf";
    device = "vmshare";
    options = [ "rw" ];
  };


  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "dvorak";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  environment.shells = with pkgs; [bashInteractive zsh];

  #virtualization.virtualbox.guest = {
  #  enable = true;
  #  x11 = true;
  #};

  virtualisation.libvirtd.enable = true; # qemu


  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    #virtualbox
    gnumake
    automake
    autoconf
    ninja
    libtool
    pkgconfig
    clang
    gcc
    binutils
    zlib
    nix-repl
    nix-serve
    nix-prefetch-git
    git
    stow 
    hdparm
    acpi
    acpid
    acpitool
    pmtools
    wget
    bash
    bash-completion
    bashInteractive
    kbd
    #way-cooler
    #lemonbar
    #polybar
    sway	
    ffmpeg # for sway
    #gdk-pixbuf # for sway
    libjpeg
    #imagemagick
    imagemagickBig
    # i3-gaps required for sway configuration until everything is dropped
    i3lock
    # i3status
    # i3blocks-gaps
    i3blocks
    scrot # screenshot
    feh
    #arandr
    #autorandr
    lm_sensors
    sysstat
    playerctl
    pango
    perlPackages.Pango
    xwayland
    networkmanager
    networkmanagerapplet
    wpa_supplicant
    #dunst
    pamixer
    ponymix
    pasystray
    pavucontrol
    volnoti
    kakoune
    tmux
    dmenu
    firefox
    thunderbird
    #vivaldi
    #vimb
    vlc
    xfce.thunar
    gnome3.nautilus
    darktable
    rxvt_unicode-with-plugins
    #st # terminal
    urxvt_perls
    terminator termite
    zathura
    #fontconfig-ultimate
    #freetype
    ghc
    stack
    cabal-install
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
    powertop #intel
    intel-gpu-tools
    beignet
    #brightnessctl light
    #bluetoothctl
    xsel
    #mesa_noglu
    libnotify
    vtk
    unzip
    #dejavu_fonts
    #freefont_ttf
    #ttf_bitstream_vera
    w3m ranger tree
    vim
    thermald
    texlive.combined.scheme-full
    rsync
    #redshift
    #geoclue
    #despotify
    #python27
    ruby bundix
    #python35
    ##python27Packages.numpy
    #python35Packages.numpy
    ##python27Packages.scipy
    #python35Packages.scipy
    ##python27Packages.matplotlib
    #python35Packages.matplotlib
    ##python27Packages.seaborn
    #python35Packages.seaborn
    ##python27Packages.pandas
    #python35Packages.pandas
    ##python27Packages.ipython
    #python35Packages.ipython
    ##python27Packages.pandocfilters
    #python35Packages.pandocfilters
    ##python27Packages.pypandoc
    ##python35Packages.pypandoc
    #paraview
    #pygmentex
    mlocate
    lm_sensors
    linuxHeaders
    libreoffice-fresh
    hunspell
    aspell
    aspellDicts.de
    aspellDicts.en
    aspellDicts.fr
    inkscape
    i7z
    htop
    # cups
    # cups-filters
    # hplip
    # gutenprint
    # gutenprintBin # cups_gutenprint_binary
    # foomatic-filters
    # cups-bjnp
    # cups-dymo
    gpart
    gparted
    hdf5
    ncurses
    gnupg pinentry
    #gpicview
    geeqie
    clutter clutter-gtk
    gpicview
    #gliv
    fasd
    pandoc
    stack
    dbus
    cryptsetup
    clamav
    cmake
    chromium
    #linuxPackages.cpupower
    cpufrequtils
    boost
    mkpasswd
    meson
    cairo
    #kmscon
    #libtsm
    conky
    dropbox
    exfat
  ];


  networking = {
    hostName = "pgeier"; # Define your hostname.
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
        22 # ssh - automaticall 
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

  users.defaultUserShell = pkgs.zsh;
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
      extraGroups = [ "wheel" "networkmanager" "audio" "video" "sys" "scanner" "kvm" "optical" "storage" "input" "disk" "floppy" "uucp" "lock" "docker" "sway"];
    };
  #users.mutableUsers = false;

  # The NixOS release to be compatible with for stateful data such as databases.
  system = {
    autoUpgrade.enable = true;
    stateVersion = "18.03";
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

  # https://github.com/shosti/nixos-config/blob/master/configuration.nix
  # Make sure screen is locked on suspend
  systemd.services."i3lock" = {
    enable = true;
    description = "i3lock";
    wantedBy = [ "suspend.target" "hibernate.target" ];
    before = [ "systemd-suspend.service" "systemd-hibernate.target" ];
    serviceConfig = {
      Type = "forking";
      User = "geier"; # unfortunately necessary :(
    };
    script = "${pkgs.i3lock}/bin/i3lock";
    postStart = "${pkgs.coreutils}/bin/sleep 1";
    environment = { DISPLAY = ":0"; };
  };

  # List services that you want to enable:
  services = {

    syncthing = {
      user = "geier";
      enable = true;
      dataDir = "/home/geier/.syncthing";
    };

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
  

    dnscrypt-proxy = {
      enable = true;
      localPort = 43;
    };
    dnsmasq = {
      enable = true;
      servers = [ "127.0.0.1#43" ];
    };

    privoxy.enable = true;
    tor = {
      enable = true;
      client = {
      	enable = true;
      	privoxy.enable = true;
      };
      tsocks.enable = true;
    };

    redshift = {
          enable = true;
          latitude = "49.398750";
          longitude = "8.672434";
    };

    tlp = {
        enable = true;
        extraConfig = ''
          DEVICES_TO_DISABLE_ON_STARTUP="bluetooth"
        '';
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
      enable = false;
      autorun = false;
      exportConfiguration = true;
      autoRepeatDelay = 150;
      autoRepeatInterval = 50;

      modules = with pkgs; [
              xorg.xf86inputsynaptics # xf86-input-synaptics
              #xorg.xf86videointel # xf86-video-intel
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

      libinput.enable = true;
      #videoDrivers = ["intel" "mesa-noglu"];
      videoDrivers = ["intel" "mesa-noglu"];

      layout = "us,de";
      xkbVariant = "dvorak,";
      xkbOptions = "grp:switch,grp:menu_toggle";

      #windowManager.i3.enable = true;
      #windowManager.i3.package = pkgs.i3-gaps;
      #windowManager.sway.enable = true;
      #windowManager.waycooler.enable = true;

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
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
      desktopManager = {
        gnome3.enable = true;
        default = "none";
      };
    };
  };

  hardware = {
    #brightnessctl.enable = true;
    opengl = {
      enable = true;
      extraPackages = with pkgs; [vaapiIntel vaapiVdpau libvdpau-va-gl glxinfo]; # mesa_drivers
      extraPackages32 = with pkgs; [vaapiIntel vaapiVdpau libvdpau-va-gl glxinfo]; # mesa_drivers
      driSupport = true;
      #driSupport32Bit = true;
      s3tcSupport = true;
    };

    enableAllFirmware = true;

    pulseaudio = {
      enable = true;
      #support32Bit = true;
      package = pkgs.pulseaudioFull;
    };

    sane = {
      enable = true;
      #extraBackends = [ pkgs.hplipWithPlugin ];
    };

    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    #cpu.intel.updateMicrocode = true;
  };
  systemd.user.services.pulseaudio.enable = true;

  virtualisation.docker.enable = true;

  fonts = {
    enableDefaultFonts = true;
    enableCoreFonts = true;
    enableGhostscriptFonts = false;
    enableFontDir = true;
    fonts = with pkgs; [
      dejavu_fonts
      freefont_ttf
      ttf_bitstream_vera
      terminus_font
      terminus_font_ttf
      siji	# for i3blocks
      symbola
      font-awesome-ttf
      libertine
      # code2000
      # code2001
      # code2002
      terminus_font
      ubuntu_font_family
      liberation_ttf
      inconsolata
      vistafonts
      freefont_ttf
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
    ];
    fontconfig = {
      #defaultFonts = {
      #  # monospace = [ "Source Code Pro" ];
      #  # sansSerif = [ "Source Sans Pro" ];
      #  # serif     = [ "Source Serif Pro" ];
      #  # monospace = [ "DejaVu Sans Serif" ];
      #  # sansSerif = [ "DejaVu Sans Serif" ];
      #  # serif     = [ "DejaVu Sans Serif" ];
      #};
      penultimate = {
        enable = true;
      };
    };
  };

  programs.sway = {
    enable = true;
  };
  programs.light = {
    enable = true;
  };

  programs.zsh = {
    enable = true; 
    enableAutosuggestions = true;
    #autosuggestions.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  sound.enable = true;

  powerManagement = {
    enable = true;
    #cpuFreqGovernor = "ondemand"; #"powersave"; tlp does it
    #powerDownCommands = "${pkgs.hdparm}/sbin/hdparm -B 255 /dev/sda"; 
    #powerUpCommands = "${pkgs.hdparm}/sbin/hdparm -B 255 /dev/sda";
    #scsiLinkPolicy = "medium_power"; # tlp does it
      # "min_power"
      # "max_performance"
      # "medium_power"
      # "med_power_with_dipm"
  };


  #services.logind.extraConfig = "HandleLidSwitch=ignore";
  #security.pam
  security.apparmor.enable = true;
 
}
