# backup general files
sudo tar -cvpzf backup_general.tar.gz \
  $HOME/Desktop/backup_test \
  $HOME/Desktop/django_project/monitor_app/static/data_image \
  $HOME/Desktop/django_project/secure_data \
  $HOME/Desktop/django_project/monitor_app/static/data_3dConstruction_image \
  $HOME/Desktop/django_project/monitor_app/static/data_3dConstruction_meshJson

# backup root files
sudo tar -cvpzf backup_secure.tar.gz \
   $HOME/Desktop/django_project/data_directory \
   $HOME/Desktop/nginx_certbox_backup \
   $HOME/Desktop/host_nginx
