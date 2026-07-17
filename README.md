  # SimpleStorage

  一个用 Foundry 从零写起的最小 Solidity 合约: 能在链上存一个数、能把它读出来。
  这是我智能合约开发的第一个完整闭环项目 —— 写合约 → 单元测试 → 本地部署 → 测试网部署 → 源码验证。

  ## 技术栈
  - Solidity ^0.8.19
  - Foundry (forge / cast / anvil)
  - 部署网络: Ethereum Sepolia (chain id 11155111)

  ## 合约功能
  | 函数 | 说明 | 类型 |
  |------|------|------|
  | `store(uint256 newNumber)` | 把一个数存进链上状态变量 | 写, 花 gas |
  | `retrieve()` | 读出当前存的那个数 | view, 只读免费 |

  ## 已部署 & 已验证
  - 合约地址: `0x你的合约地址`
  - Etherscan: https://sepolia.etherscan.io/address/0x你的合约地址#code

  ## 本地运行

  ```bash
  git clone https://github.com/你的用户名/simple-storage-foundry.git
  cd simple-storage-foundry
  forge install          # 装依赖
  forge build            # 编译
  forge test -vv         # 跑测试
  ```

  ## 部署

  ```bash
  # 1. 把私钥加密存进 keystore(只需一次)
  cast wallet import sepoliaKey --interactive

  # 2. 配置 .env(参考 .env.example), 然后加载
  source .env

  # 3. 部署到 Sepolia 并自动验证
  forge script script/DeploySimpleStorage.s.sol:DeploySimpleStorage \
    --rpc-url $SEPOLIA_RPC_URL \
    --account sepoliaKey \
    --broadcast \
    --verify \
    --etherscan-api-key $ETHERSCAN_API_KEY
  ```

  > 注意: 本项目使用加密 keystore 管理私钥, 仓库中不包含任何私钥。

  ## 许可证
  MIT