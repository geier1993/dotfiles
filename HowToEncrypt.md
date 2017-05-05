# How to Encrypt Your USB Flash Drives
December 8, 2012 by Shinobu	

Did you know that your modern Linux kernel comes with a built-in encryption
framework? I am talking about dm-crypt (device-mapper crypt) and the
user-friendly layer on top of it, called LUKS (Linux Unified Key Setup). I just
encrypted all of my USB flash drives two weeks ago using the dm-crypt + LUKS
method and I am very happy with the results.

The process itself is very simple.
	
## 1. 

Find the correct device.
 
~~~~
lsblk
~~~~
 
## 2. 
Wipe the device with random data. I prefer to target the disk by its UUID
because using the /dev/sdX convention is not very reliable (the letters can
change between boots/hotmounts). NOTE: You might be interested in
http://frandom.sourceforge.net/ if your device is over 16 GiB or so, because
using /dev/urandom can be very slow. If using Arch Linux, you can get it from
the AUR: https://aur.archlinux.org/packages/frandom/.
 
~~~~
dd if=/dev/urandom of=/dev/disk/by-uuid/XXX bs=4096
~~~~
 
## 3. Create the partition on the device.
 
~~~~
cfdisk /dev/disk/by-uuid/XXX
~~~~
 
## 4. 
Encrypt the partition and make it LUKS-compatible. See the manpage for
 cryptsetup(8).
   -c: cipher type to use
   -y: LUKS will ask you to input the passphrase; using -y will ask you twice
       and complain if the two do not match.
   -s: Key size in bits; the larget the merrier, but limited by the cipher/mode used.
 
~~~~
cryptsetup -c aes-xts-plain -y -s 512 luksFormat /dev/disk/by-uuid/XXX
~~~~
 
## 5. Open the partition with LUKS.
 
~~~~
cryptsetup luksOpen /dev/disk/by-uuid/XXX mycrypteddev
~~~~
 
The partition is now available from /dev/mapper/mycrypteddev as a "regular"
partition, since LUKS is now handling all block device encryption between the
user and the device.
 
## 6. Set up a filesystem on the partition.
 
mkfs.ext4 /dev/mapper/mycrypteddev
 
## 7. Close the partition with LUKS.
 
~~~~
cryptsetup luksClose /dev/mapper/mycrypteddev
~~~~
 
Encryption setup complete! Now every time you want to access the partition,
you must first open it with LUKS and then mount it. Then when you're done, do
the reverse: unmount and close it with LUKS.
 
## To mount and open with LUKS:
 
~~~~
cryptsetup luksOpen /dev/disk/by-uuid/XXX mycrypteddev
mount -t ext4 /dev/mapper/mycrypteddev /mnt/mount_point
~~~~
 
## To unmount and close with LUKS:
 
~~~~
umount /mnt/mount_point
cryptsetup luksClose mycrypteddev
~~~~

The mount/open and unmount/close steps necessary for using the device is
laborious. That’s why you should write a bash script to run them. I’ve written
the following bash script called cmount.sh to access my 3 USB drives this way:

	
~~~~~
#!/bin/zsh
# LICENSE: PUBLIC DOMAIN
# mount/unmount encrypted flash drives
 
mp=$3
uuid=""
 
case $2 in
    "0")
        uuid="11e102cd-dea1-46a8-ae9b-b3f74b536e64" # my red USB drive
        ;;
    "1")
        uuid="cf169437-b937-4a39-86cb-7ca82bd9fe94" # my green one
        ;;
    "2")
        uuid="57a0b7d5-d2a6-47e0-a0e3-adf69501d0cd" # my blue one
        ;;
    *)
        ;;
esac
 
if [[ $uuid == "" ]]; then
    echo "No predefined device specified."
    exit 0
fi
 
case $1 in
    "m")
        echo "Authorizing encrypted partition /dev/mapper/$mp..."
        sudo cryptsetup luksOpen /dev/disk/by-uuid/$uuid $mp
        echo -n "Mounting partition on /mnt/$mp..."
        sudo mount -t ext4 /dev/mapper/$mp /mnt/$mp && echo "done."
        ;;
    "u")
        echo -n "Unmounting /mnt/$mp..."
        sudo umount /mnt/$mp && echo "done."
        echo -n "Closing encrypted partition /dev/mapper/$mp..."
        sudo cryptsetup luksClose $mp && echo "done."
        ;;
    *)
        ;;
esac
~~~~~

To mount the green USB to /mnt/ef0 (“ef0” is just an arbitrary folder name):

~~~~
./cmount.sh m 1 ef0
~~~~

Then to unmount:
	
~~~~
./cmount.sh u 1 ef0
~~~~

Simple, eh? Go forth and encrypt all of your USB drives, so that when they get
lost, they can’t be read by curious strangers. You can use the above steps to
create and encrypt multiple partitions in the same device, or to only encrypt
one partition while leaving other partitions unencrypted (i.e., steps 4 through
7 are partition-specific). The choice is yours. I prefer partition-level (aka
“block device”) encryption over file/folder encryption because I don’t have to
mentally think every time “hey, do I want to encrypt this?” for every
file/folder I create.

If you want to look into encrypting your hard drives and swap partitions, read
through this disk encryption page, and particularly, this section. There are
many “levels” of encryption, and you should consider the many options available
to you.
