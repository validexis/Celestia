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
git checkout v3.4.2
make install

celestia-appd config chain-id celestia
celestia-appd config keyring-backend file
celestia-appd config node tcp://localhost:26657

celestia-appd init Node --chain-id celestia

wget -O $HOME/.celestia-app/config/genesis.json https://mainnets.validexis.com/celestia/genesis.json
wget -O $HOME/.celestia-app/config/addrbook.json https://mainnets.validexis.com/celestia/addrbook.json

SEEDS="400f3d9e30b69e78a7fb891f60d76fa3c73f0ecc@celestia.rpc.kjnodes.com:12059"
PEERS="5001de72be39622c9dc34f2117eccc3f3fca8a7a@34.91.84.93:26756,ff476823607d3c73da21662238083b10040d3ecc@65.108.44.124:26001,24a607a217cf12be29bae5b2e8151391bde2d8c8@65.108.12.253:15007,d7adf0cf48c95224c2440072b75b91fd55bfb83f@49.12.83.235:26656,fa759f8aad712dd59ec673e3fbb434e4c959e509@3.125.200.144:26656"
sed -i -e 's|^seeds *=.*|seeds = "'$SEEDS'"|; s|^persistent_peers *=.*|persistent_peers = "'$PEERS'"|' $HOME/.celestia-app/config/config.toml
sed -i -e "s|^target_height_duration *=.*|timeout_commit = \"11s\"|" $HOME/.celestia-app/config/config.toml

sed -i -e "s|^minimum-gas-prices *=.*|minimum-gas-prices = \"0.002utia\"|" $HOME/.celestia-app/config/app.toml

sed -i -e "s/^pruning *=.*/pruning = \"custom\"/" $HOME/.celestia-app/config/app.toml 
sed -i -e "s/^pruning-keep-recent *=.*/pruning-keep-recent = \"100\"/" $HOME/.celestia-app/config/app.toml
sed -i -e "s/^pruning-interval *=.*/pruning-interval = \"19\"/" $HOME/.celestia-app/config/app.toml

sed -i -e "s|^recv_rate *=.*|recv_rate = 10485760|" -e "s|^send_rate *=.*|send_rate = 10485760|" -e "s|^ttl-num-blocks *=.*|ttl-num-blocks = 12|" $HOME/.celestia-app/config/config.toml

sudo modprobe tcp_bbr
echo "net.core.default_qdisc=fq" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

sudo tee /etc/systemd/system/celestia-appd.service > /dev/null <<EOF
[Unit]
Description=celestia
After=network-online.target
[Service]
User=$USER
ExecStart=$(which celestia-appd) start --home $HOME/.celestia-app/
Restart=on-failure
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF

curl -L https://mainnets.validexis.com/celestia/snap_celestia-prun.tar.lz4 | tar -Ilz4 -xf - -C $HOME/.celestia-app/

sudo systemctl daemon-reload
sudo systemctl enable celestia-appd
sudo systemctl restart celestia-appd && sudo journalctl -u celestia-appd -f
