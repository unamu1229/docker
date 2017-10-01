#! /usr/local/bin/zsh
# source docker-start.sh で実行しないと eval $(docker-machine env) の export の環境変数が受け継がれません。
docker-machine start
eval $(docker-machine env)
docker-compose start
docker exec -it -u="www" centos_php script -q -c "/bin/zsh" /dev/null
