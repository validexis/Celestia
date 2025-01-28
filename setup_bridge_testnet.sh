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
rm -rf celestia-node
git clone https://github.com/celestiaorg/celestia-node
cd celestia-node/
git checkout tags/v0.21.3-mocha
make build 
sudo make install 
make cel-key

celestia bridge init --core.ip localhost --p2p.network mocha

cd $HOME/celestia-node
./cel-key list --node.type bridge --keyring-backend test --p2p.network mocha

sudo tee /etc/systemd/system/celestia-bridge.service > /dev/null <<EOF
[Unit]
Description=celestia Bridge
After=network-online.target
​[Service]
User=$USER
ExecStart=$(which celestia) bridge start \
--p2p.network mocha --archival \
--metrics.tls=true --metrics --metrics.endpoint otel.mocha.celestia.observer
Restart=on-failure
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable celestia-bridge
sudo systemctl restart celestia-bridge && sudo journalctl -u celestia-bridge -f
