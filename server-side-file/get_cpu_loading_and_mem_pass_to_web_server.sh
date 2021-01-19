source $HOME/Desktop/docker-script-private-git-server/server-side-file/env.sh
echo $SECRET_KEY_SSH

while :
do
  # get cpu loading
  mpstat -P ALL 1 1 | awk '/Average/ && $2 ~ /all/ {split($3, a, ".");print a[1]}' > ./b.txt
  value=`cat ./b.txt`
  echo "Cpu: $value"

  curl -X POST -H "Content-Type: application/json" \
 -d '{"raspberry_secret_key":"'$SECRET_KEY_SSH'", "number":'$value', "server_name":"BackupCpuPercentage"}' \
 https://plantmonitor.mooo.com/connectionsNumReceiver
  
  # mem loading

  free -m | awk '/Mem/ {split($3/$2*100, a, ".");print a[1]}' > ./c.txt
  value=`cat ./c.txt`
  echo "Mem: $value"

  curl -X POST -H "Content-Type: application/json" \
 -d '{"raspberry_secret_key":"'$SECRET_KEY_SSH'", "number":'$value', "server_name":"BackupMemPercentage"}' \
 https://plantmonitor.mooo.com/connectionsNumReceiver
  sleep 10
done

