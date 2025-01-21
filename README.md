# Celestia

**Celestia** is building a modular consensus and data network, allowing anyone to deploy their own blockchain with ease. Its architecture aims to accelerate Web3 innovation in the next decade.

---
<div>
<h1 align="left" style="display: flex;"> Celestia Node Setup</h1>
</div>

---

## 🌟 Testnet Setup

### ⚙️ Validator Node Setup
This script sets up a **Validator Node** on the Mocha-4 testnet, ensuring secure and reliable participation in the network.
```bash
source <(curl -s https://raw.githubusercontent.com/validexis/Celestia/main/setup_validator_testnet.sh)
```

### ⚙️ Full Node Setup
Use this command to set up a **Full Node** on the testnet. Full nodes store the entire blockchain and validate transactions.
```bash
source <(curl -s https://raw.githubusercontent.com/validexis/Celestia/main/setup_fullnode_testnet.sh)
```

### ⚙️ Bridge Node Setup
The **Bridge Node** acts as a connector between the testnet and external networks. Set it up using the following script:
```bash 
source <(curl -s https://raw.githubusercontent.com/validexis/Celestia/main/setup_bridge_testnet.sh)
```

### 🔄 Upgrade Testnet App
Upgrade the Celestia app on your testnet node to the latest version.
```bash
source <(curl -s https://raw.githubusercontent.com/validexis/Celestia/main/upgrade_testnet_app.sh)
```

### 🔄 Upgrade Testnet Node
Ensure your testnet node is up-to-date with the latest protocol updates.
```bash
source <(curl -s https://raw.githubusercontent.com/validexis/Celestia/main/upgrade_testnet_node.sh)
```

---

## 🌟 Mainnet Setup

### ⚙️ Validator Node Setup
Set up a **Validator Node** on the Celestia mainnet to participate in securing the network and earning rewards.
```bash
source <(curl -s https://raw.githubusercontent.com/validexis/Celestia/main/setup_validator_mainnet.sh)
```

### ⚙️ Full Node Setup
A **Full Node** ensures complete data availability and validation on the Celestia mainnet.
```bash
source <(curl -s https://raw.githubusercontent.com/validexis/Celestia/main/setup_fullnode_mainnet.sh)
```

### ⚙️ Bridge Node Setup
Configure a **Bridge Node** to facilitate interoperability between the mainnet and other networks.
```bash 
source <(curl -s https://raw.githubusercontent.com/validexis/Celestia/main/setup_bridge_mainnet.sh)
```

### 🔄 Upgrade Mainnet App
Keep your Celestia app on the mainnet updated with the latest features and security fixes.
```bash
source <(curl -s https://raw.githubusercontent.com/validexis/Celestia/main/upgrade_mainnet_app.sh)
```

### 🔄 Upgrade Mainnet Node
Upgrade your mainnet node to ensure compatibility with the latest protocol updates.
```bash
source <(curl -s https://raw.githubusercontent.com/validexis/Celestia/main/upgrade_mainnet_node.sh)
```

---

## 📚 Additional Information
For more details, visit the [Celestia Documentation](https://services.validexis.com/mainnets/celestia) or open an issue for questions or support.

### Useful Resources
- [Celestia Whitepaper](https://celestia.org) - Learn more about the architecture and vision behind Celestia.
- [Community Forum](https://forum.celestia.org) - Join discussions with other developers and node operators.
- [Developer Tools](https://docs.celestia.org) - Explore tools and libraries to interact with Celestia.

