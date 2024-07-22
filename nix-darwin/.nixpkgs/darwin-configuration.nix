{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ pkgs.kakoune
      pkgs.cargo # build kak-lsp
      pkgs.vim
      pkgs.zellij
      pkgs.fasd
      pkgs.ranger
      pkgs.fzf
      pkgs.silver-searcher
      pkgs.ripgrep
      pkgs.ripgrep-all
      pkgs.direnv
      pkgs.tmux
      pkgs.kitty
      pkgs.alacritty
      pkgs.nix-index
      pkgs.editorconfig-checker
      
      pkgs.mosh
      pkgs.bat
      pkgs.nnn
      pkgs.pistol

      # pkgs.spotify
      pkgs.zathura
      pkgs.git
      pkgs.diff-so-fancy
      pkgs.meld
      pkgs.teleport
      pkgs.stow
      pkgs.gnused

      # Python
      # pkgs.micromamba
      # pkgs.conda
      pkgs.python
      pkgs.python3
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.confkig/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  # programs.zsh.enable = true;  # default shell on catalina
  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
