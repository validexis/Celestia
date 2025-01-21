#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install curl git wget htop tmux build-essential jq make lz4 gcc unzip -y

sudo rm -rf /usr/local/go
curl -Ls https://go.dev/dl/go1.23.1.linux-amd64.tar.gz | sudo tar -xzf - -C /usr/local
eval $(echo 'export PATH=$PATH:/usr/local/go/bin' | sudo tee /etc/profile.d/golang.sh)
eval $(echo 'export PATH=$PATH:$HOME/go/bin' | tee -a $HOME/.profile)
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
source $HOME/.bash_profile

cd $HOME 
rm -rf celestia-app 
git clone https://github.com/celestiaorg/celestia-app.git 
cd celestia-app 
git checkout v3.2.0
make install

celestia-appd config chain-id celestia
celestia-appd config keyring-backend file
celestia-appd config node tcp://localhost:26657
​
celestia-appd init Node --chain-id celestia

curl -Ls https://snapshots.kjnodes.com/celestia/genesis.json > $HOME/.celestia-app/config/genesis.json
curl -Ls https://snapshots.kjnodes.com/celestia/addrbook.json > $HOME/.celestia-app/config/addrbook.json

sed -i -e "s|^seeds *=.*|seeds = \"400f3d9e30b69e78a7fb891f60d76fa3c73f0ecc@celestia.rpc.kjnodes.com:12059\"|" $HOME/.celestia-app/config/config.toml
sed -i -e "s|^target_height_duration *=.*|timeout_commit = \"11s\"|" $HOME/.celestia-app/config/config.toml
sed -i -e "s|^minimum-gas-prices *=.*|minimum-gas-prices = \"0.002utia\"|" $HOME/.celestia-app/config/app.toml

sed -i \
  -e 's|^pruning *=.*|pruning = "nothing"|' \
  $HOME/.celestia-app/config/app.toml

sed -i -e "s|^recv_rate *=.*|recv_rate = 10485760|" -e "s|^send_rate *=.*|send_rate = 10485760|" -e "s|^ttl-num-blocks *=.*|ttl-num-blocks = 12|" $HOME/.celestia-app/config/config.toml

sudo modprobe tcp_bbr
echo "net.core.default_qdisc=fq" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

sudo tee /etc/systemd/system/celestia-appd.service > /dev/null <<EOF
[Unit]
Description=Celestia node
After=network-online.target
[Service]
User=$USER
WorkingDirectory=$HOME/.celestia-app
ExecStart=$(which celestia-appd) start --home $HOME/.celestia-app
Restart=on-failure
RestartSec=5
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF

curl -L https://celestia-snapshots.kjnodes.com/celestia-archive/snapshot_latest.tar.lz4 | tar -Ilz4 -xf - -C $HOME/.celestia-app

sudo systemctl daemon-reload
sudo systemctl enable celestia-appd
sudo systemctl start celestia-appd && sudo journalctl -u celestia-appd -f
