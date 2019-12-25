{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

 
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

   services.vsliveshare = {
       enable = true;
       enableWritableWorkaround = true;
       enableDiagnosticsWorkaround = true; 
   };
}
