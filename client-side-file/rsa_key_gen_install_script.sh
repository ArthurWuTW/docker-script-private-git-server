sudo apt-get install git-core openssh-server
cd ~/.ssh
ssh-keygen -t rsa
rm ~/Backup/authorized_keys
cat id_rsa.pub >> ~/Backup/authorized_keys
ssh-add -D
ssh-add
scp ~/Backup/authorized_keys user@10.1.1.9:/home/user/.ssh
