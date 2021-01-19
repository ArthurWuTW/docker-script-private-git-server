
source $HOME/Desktop/docker-script-private-git-server/server-side-file/env.sh
echo $SECRET_KEY_SSH

while :
do

  ss | grep -i ssh > ./a.txt
  lines=`wc -l ./a.txt`
  echo "hi"
  echo $lines

  print_output=($lines)
  number=${print_output[0]}
  echo $number

  curl -X POST -H "Content-Type: application/json" \
 -d '{"raspberry_secret_key":"'$SECRET_KEY_SSH'", "number":'$number', "server_name":"Backup"}' \
 https://plantmonitor.mooo.com/connectionsNumReceiver
 
  sleep 60
done
