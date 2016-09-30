- nfs-utils (file sharing, sudo systemctl start rpcbind nfs-client.target remote-fs.target)
- samba:
    - smbclient & samba package
    - scan open ports: nmap -p 139 -sT "192.168.1.*"
    - nmap -p 139 -sT "192.168.1.*"
    - For ip with opened port: nmblookup -A 192.168.1.200 
    - For service listing <20>: smbclient -L \\PENTAMIN-SERVER

