set -e

# rsync -rtuP ...
# rsync -avW --delete-after ...
#su - geier -c "gpg --export-ownertrust > /media/usb/philippgeier-ownertrust-gpg.txt"
#su - geier -c "gpg --export-secret-keys > /media/usb/philippgeier-secret-gpg.txt"
gpg --export-ownertrust > /media/usb/philippgeier-ownertrust-gpg.txt
gpg --export-secret-keys Philipp@geier.me> /media/usb/philippgeier-secret-gpg.asc

rsync -avrP  /home/geier/Documents /media/usb/
rsync -avrP  /home/geier/Pictures /media/usb/

#rsync -avrP --delete /home/geier/packages.yaml /media/usb/
rsync -avrP /home/geier/todo.yaml /media/usb/

rsync -avrP /home/geier/.config /media/usb/

rsync -avrP /home/geier/misc/Soilphysics /media/usb/misc/
rsync -avrP /home/geier/misc/Foundation5 /media/usb/misc/

rsync -avrP /home/geier/.gnupg /media/usb/
rsync -avrP /home/geier/.ssh /media/usb/

#rsync -avrP /home/geier/.pws.gpg /media/usb/

rsync -avrP --copy-links /home/geier/usb /media/usb/
rsync -avrP /home/geier/davis /media/usb/
