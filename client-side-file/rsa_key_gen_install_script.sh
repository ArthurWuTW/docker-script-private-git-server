sudo apt-get install git-core openssh-server
cd ~/.ssh
ssh-keygen -t rsa
rm ~/Backup/authorized_keys
cat id_rsa.pub >> ~/Backup/authorized_keys
ssh-add -l # show all identities
ssh-add -D #remove all ssh identities
ssh-add #add ssh identity
scp ~/Backup/authorized_keys user@10.1.1.9:/home/user/.ssh
