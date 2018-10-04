@echo off

rem https://superuser.com/questions/540849/running-virtual-linux-using-qemu-on-windows 
rem ==================================
rem Replace with your values
rem ==================================
rem set "QEMUDIR=%USERPROFILE%\Documents\Warez\qemu-2.8.0-win64"
set QEMUDIR="C:\Program Files\qemu"
rem set ISOFILE="C:\Users\pgeier\Downloads\nixos-minimal-18.03.133245.d16a7abceb7-x86_64-linux.iso"
set ISOFILE="C:\Users\pgeier\Downloads\archlinux-2018.10.01-x86_64.iso"

set DEBIANDISK="C:\Users\pgeier\Downloads\debian_wheezy_i386_desktop.qcow2"

rem ==================================
rem You can add a w suffix to this if 
rem you don't want a console
rem ==================================
set "QEMUBIN=qemu-system-x86_64.exe"

rem ==================================
rem Run the virtual machine
rem ==================================
rem start "QEMU" 
rem %QEMUDIR%\%QEMUBIN% -drive file=hda.img,index=0,media=disk,format=raw -cdrom %ISOFILE% -m 4G -smp 2 -accel tcg,thread=multi -enable-kvm -L Bios -machine usb=on -device usb-mouse -device usb-kbd -k de  -boot menu=on -rtc base=localtime,clock=host -parallel none -serial none -name nixos -no-acpi -no-hpet -no-reboot
rem %QEMUDIR%\%QEMUBIN% -drive file=hda.img,index=0,media=disk,format=raw -cdrom %ISOFILE% -m 4G -accel hax  -L Bios -machine usb=on -device usb-mouse -device usb-kbd -k de  -boot menu=on -rtc base=localtime,clock=host -name nixos -parallel none -serial none -no-acpi -no-hpet -no-reboot
rem %QEMUDIR%\%QEMUBIN% -hda nixos.qcow2 -cdrom %ISOFILE% -boot d -m 4G -accel hax -k de -name nixos   
%QEMUDIR%\%QEMUBIN% -hda %DEBIANDISK% -m 4G -accel hax -k de -name nixos   
