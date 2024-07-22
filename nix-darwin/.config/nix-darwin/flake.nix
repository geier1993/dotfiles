{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
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
	      # pkgs.silver-searcher
	      pkgs.ripgrep
	      pkgs.ripgrep-all
	      pkgs.direnv
	      # pkgs.tmux
	      pkgs.kitty
	      # pkgs.alacritty
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
          # pkgs.python
          pkgs.python3
        ];



      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      # programs.zsh.enable = true;  # default shell on catalina
      programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      nixpkgs.config.allowUnfree = true;
      # nixpkgs.config.permittedInsecurePackages = [
      #                  "python-2.7.18.6"
      # ];
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Philipps-MBP
    darwinConfigurations."Philipps-MBP" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Philipps-MBP".pkgs;
  };
}