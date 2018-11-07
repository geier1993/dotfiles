packages:
	- gcc-c++
	- gcc-core
	- make
 	- automake
	- binutils
	- wget
	- gnupg
	- zathura
	- vim
	- stow
	- cmake
	- tmux
	- git 
	- pkg-config
	- w3m (for ranger)
	- xorg-server
	- xinit
	- cygrunsrv
	- xsel
	- python2
	- python3
	- pip

manual:
	- kakoune
	- ranger
	- fasder
	- cygserver-config

tmux:
	- tmux new-session -A -s 0 -t DEFAULT

dos2unix
care about locale options in Options -> Text ...

Windows: Edit environmentvariables, add CYGWIN_HOME C:\cygwin64, add PATH c:\cygwin64\bin

SUDO: https://stackoverflow.com/questions/4090301/root-user-sudo-equivalent-in-cygwin
