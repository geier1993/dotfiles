@echo off
rem ==================================
rem Replace with your values
rem ==================================
rem set "QEMUDIR=%USERPROFILE%\Documents\Warez\qemu-2.8.0-win6"
set QEMUDIR="C:\Program Files\qemu"
echo %QEMUDIR%

rem ==================================
rem Safety net
rem ==================================
if not exist nixos.qcow2 (
    rem CREATE a virtual hard disk 
    rem %QEMUDIR%\qemu-img.exe create hda.img 40G
    rem https://github.com/NixOS/nixpkgs/issues/36134
    %QEMUDIR%\qemu-img.exe create -f qcow2 nixos.qcow2 40G
) else (
    echo file hda.img already exist. Delete or move and try again.
    goto:eof
)
