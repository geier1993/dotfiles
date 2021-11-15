{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  # wayland.windowManager.sway = {
  #   enable = true;
  #   wrapperFeatures.gtk = true ;
  #   xwayland = true ;
  # };
  home.packages = with pkgs; [
    # sway
    # swaylock
    swayidle
    wl-clipboard
    clipman
    xwayland
    waybar
    mako # notification daemon
    # alacritty # Alacritty is the default terminal in the config
    foot
    # dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native
    wofi
    kanshi
    light
    brightnessctl

    gtk-engine-murrine
    gtk_engines
    gsettings-desktop-schemas
    lxappearance

    autotiling
    flashfocus
    gammastep
    wf-recorder

    volnoti
    ponymix
    pasystray

    grim
    slurp
    swappy

    font-awesome

    kakoune
    ranger
    w3m
    lsix
    fasd
    keepass
    fzf
    silver-searcher
    direnv

    fish
    tmux
    mtm

    zellij
    notcurses
    vim
    vscode
    zathura
    git
    diff-so-fancy
    editorconfig-checker

    spotify
    gimp
    okular

    firefox-wayland
    chromium
    pavucontrol
    pcmanfm
    cinnamon.nemo

    # numix-solarized-gtk-theme
    # zafiro-icons

    # glibcLocales # install with nix-env
  ];

  # Home Manager setup
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    XDG_CURRENT_DESKTOP = "sway"; 
  };

  # programs.firefox = {
  #     enable = true;
  #     package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
  #       forceWayland = true;
  #       extraPolicies = {
  #         ExtensionSettings = {};
  #       };
  #     };
  #   };




  # programs.fish.enable = true;
 
  #programs.git = {
  #  enable = true;
  #  userName = "Philipp Geier";
  #  userEmail = "philipp@geier.me";
  #};

  #programs.spotify = {
  #  enable = true;
  #};


  #services.gpg-agent = {
  #  enable = true;
  #  defaultCacheTtl = 1800;
  #  enableSshSupport = true;
  #};

   #imports = [
   #     "${builtins.fetchTarball {
   #         url = "https://gist.github.com/phryneas/9f2a4f7f10907f02bc36d44c9254ce50/archive/28bd9dcd18ae7280ee3ea40bd3db8a934f5b68a9.tar.gz";
   #         sha256 = "0gpi682rj8r6a5dqsqa9gnxawkzj5xfwm3find5x17mlb53w79cf";
   #     }}/home-manager-module.nix"
   # ];

   # services.vsliveshare = {
   #     enable = true;
   #     enableWritableWorkaround = true;
   #     enableDiagnosticsWorkaround = true; 
   # };
}
