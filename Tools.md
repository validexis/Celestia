# 📌 Celestia Tools List  

A curated list of tools for Celestia, including guides, scripts, bots, security solutions, and more.  

## Table of Contents  

   🔐 **[Security and Monitoring](https://github.com/validexis/Celestia/blob/main/Tools.md#-security-and-monitoring)** ・ 🔧 **[Services](https://github.com/validexis/Celestia/blob/main/Tools.md#-services)** ・ 📖 **[Guides](https://github.com/validexis/Celestia/blob/main/Tools.md#-services)** ・ ⚙️ **[Automation & Scripts](https://github.com/validexis/Celestia/blob/main/Tools.md#%EF%B8%8F-automation--scripts)** ・ 🤖 **[Bots](#bots)**
  

---
---

## 🔐 Security and Monitoring

Security first! Protect your Celestia node and monitor its health.

### 🔒 Validator Security
For best practices and detailed instructions on securing your validator nodes, visit our guide on [Validator Security: Our Approach and Protection Measures](https://services.validexis.com/validator-security-our-approach-and-protection-measures).

### 📊 Node Monitoring
Set up monitoring to ensure your nodes are running optimally. Check out the [Node Monitoring Guide](https://services.validexis.com/monitoring) for tools and instructions.

---
---

## 🔧 Services

Celestia network services provided by Validexis, including API, RPC, gRPC, and peer connectivity solutions, and snapshots.  

### 🌐 API & RPC Services 

Access key infrastructure services to interact with the Celestia blockchain.  

### 🟢 Mainnet  
- **API Endpoint:** [api-celestia-mainnet.validexis.com](https://api-celestia-mainnet.validexis.com)  
- **RPC Endpoint:** [rpc-celestia-mainnet.validexis.com](https://rpc-celestia-mainnet.validexis.com)  
- **gRPC Endpoint:** grpc-celestia-mainnet.validexis.com:443  

### 🔵 Testnet  
- **API Endpoint:** [api-celestia-testnet.validexis.com](https://api-celestia-testnet.validexis.com)  
- **RPC Endpoint:** [rpc-celestia-testnet.validexis.com](https://rpc-celestia-testnet.validexis.com)


  
### 📡 Peer & AddrBook Services  
Reliable peer connections and network synchronization resources.  

### 🟢 Mainnet
### Peers:
       60d481edb7e49efe01fa0b49a346cf9f8400db19@peer-celestia-mainnet.validexis.com:26656

### AddrBook (Updated Hourly):
       wget -O $HOME/.celestia-app/config/addrbook.json https://mainnets.validexis.com/celestia/addrbook.json

### Genesis File:
       wget -O $HOME/.celestia-app/config/genesis.json https://mainnets.validexis.com/celestia/genesis.json

### 🔵 Testnet
### Peers:    
       fac5acd6540dd788dc804c8bd307b5169e666e68@peer-celestia-testnet.validexis.com:26656

### AddrBook (Updated Hourly): 
       wget -O $HOME/.celestia-app/config/addrbook.json https://testnets.validexis.com/celestia/addrbook.json

### Genesis File:
       wget -O $HOME/.celestia-app/config/genesis.json https://testnets.validexis.com/celestia/genesis.json


### 📸 Snapshots
Download the latest snapshots for fast synchronization.
- **Validator Node Snapshot** → [Testnet](https://services.validexis.com/testnets/celestia/snapshot) | [Mainnet](https://services.validexis.com/mainnets/celestia/snapshot)  
- **Full Node Snapshot** → [Testnet](https://services.validexis.com/testnets/celestia/snapshot)
- **Bridge Node Snapshot** → [Testnet](https://services.validexis.com/testnets/celestia/snapshot)

---       
---

## 📖 Guides

Master Celestia with detailed step-by-step guides. These tutorials will help you set up and configure nodes, understand the infrastructure, and participate in the network.

🔗 **Mainnet Guides** → [View](https://services.validexis.com/mainnets/celestia) 
🔗 **Testnet Guides** → [View](https://services.validexis.com/testnets/celestia) 

---
---

## ⚙️ Automation & Scripts  

Save time with powerful scripts for automation.  

###  Celestia Setup Scripts  
⚙️ **Validator Node Setup** → [Testnet](https://github.com/validexis/Celestia/blob/main/README.md#%EF%B8%8F-validator-node-setup) | [Mainnet](https://github.com/validexis/Celestia/blob/main/README.md#%EF%B8%8F-validator-node-setup-1)  
⚙️ **Full Node Setup** → [Testnet](https://github.com/validexis/Celestia/blob/main/README.md#%EF%B8%8F-full-node-setup) | [Mainnet](https://github.com/validexis/Celestia/blob/main/README.md#%EF%B8%8F-full-node-setup-1)  
⚙️ **Bridge Node Setup** → [Testnet](https://github.com/validexis/Celestia/blob/main/README.md#%EF%B8%8F-bridge-node-setup) | [Mainnet](https://github.com/validexis/Celestia/blob/main/README.md#%EF%B8%8F-bridge-node-setup-1)  

###  Celestia Upgrade Scripts  
🔄 **Upgrade Celestia App** → [Testnet](https://github.com/validexis/Celestia/blob/main/README.md#-upgrade-testnet-app) | [Mainnet](https://github.com/validexis/Celestia/blob/main/README.md#-upgrade-mainnet-app)  
🔄 **Upgrade Node** → [Testnet](https://github.com/validexis/Celestia/blob/main/README.md#-upgrade-testnet-node) | [Mainnet](https://github.com/validexis/Celestia/blob/main/README.md#-upgrade-mainnet-node)  

---
---

## 🤖 Bots

Stay informed with smart bots & alerts.


---
