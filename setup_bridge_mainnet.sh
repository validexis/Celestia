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
git clone https://github.com/celestiaorg/celestia-node.git
cd celestia-node/
git checkout tags/v0.20.4 
make build 
sudo make install 
make cel-key

mv $HOME/celestia-node/cel-key /usr/local/bin/ 
cel-key add bridge_wallet --keyring-backend test --node.type bridge --p2p.network celestia
cel-key list --node.type bridge --keyring-backend test --p2p.network celestia
celestia bridge init \
  --p2p.network celestia \
  --core.ip http://localhost \
  --core.rpc.port 26657 \
  --core.grpc.port 9090 \
  --gateway \
  --gateway.addr 0.0.0.0 \
  --gateway.port 26659 \
  --rpc.addr 0.0.0.0 \
  --rpc.port 26658 \
  --keyring.accname bridge_wallet

sudo tee /etc/systemd/system/celestia-bridge.service > /dev/null <<EOF
[Unit]
Description=celestia Bridge
After=network-online.target
​[Service]
User=$USER
ExecStart=$(which celestia) bridge start --archival \
--metrics.tls=true --metrics --metrics.endpoint otel.celestia.observer
Restart=on-failure
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable celestia-bridge
systemctl restart celestia-bridge && journalctl -u celestia-bridge -f -o cat  
