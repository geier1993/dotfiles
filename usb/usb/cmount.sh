#!/bin/sh
# LICENSE: PUBLIC DOMAIN
# mount/unmount encrypted flash drives
#https://zuttobenkyou.wordpress.com/2012/12/08/how-to-encrypt-your-usb-flash-drives/
# usage: ./cmount.sh m 0 usb
#        ./cmount.sh u 0 usb
 
mp=$3
uuid=""
 
case $2 in
    "0")
        uuid="c6f7cf1a-58ef-406d-b0d7-4a57d9f599ef" # small 64GB transcend stick
        ;;
    "1")
        uuid="591002be-1481-41ce-9d13-7f626daf0bb3" # Seagate
        ;;
    #"1")
    #    uuid="cf169437-b937-4a39-86cb-7ca82bd9fe94" # my green one
    #    ;;
    #"2")
    #    uuid="57a0b7d5-d2a6-47e0-a0e3-adf69501d0cd" # my blue one
    #    ;;
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
        echo -n "Mounting partition on /media/$mp..."
        sudo mount -t ext4 /dev/mapper/$mp /media/$mp && echo "done."
        ;;
    "u")
        echo -n "Unmounting /media/$mp..."
        sudo umount /media/$mp && echo "done."
        echo -n "Closing encrypted partition /dev/mapper/$mp..."
        sudo cryptsetup luksClose $mp && echo "done."
        ;;
    *)
        ;;
esac
