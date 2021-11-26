// 公共变量常量定义
const contract_addr = '0x6a4A17eBDf955dDDcD421736733bCCD87424d795';
const contract_abi = [
    {
        "anonymous": false,
        "inputs": [
            {
                "indexed": true,
                "internalType": "address",
                "name": "previousOwner",
                "type": "address"
            },
            {
                "indexed": true,
                "internalType": "address",
                "name": "newOwner",
                "type": "address"
            }
        ],
        "name": "OwnershipTransferred",
        "type": "event"
    },
    {
        "constant": true,
        "inputs": [
            {
                "internalType": "address",
                "name": "addr",
                "type": "address"
            }
        ],
        "name": "addressExists",
        "outputs": [
            {
                "internalType": "bool",
                "name": "",
                "type": "bool"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [],
        "name": "buy",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "owner",
        "outputs": [
            {
                "internalType": "address",
                "name": "",
                "type": "address"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [],
        "name": "renounceOwnership",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [
            {
                "internalType": "address",
                "name": "newOwner",
                "type": "address"
            }
        ],
        "name": "transferOwnership",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [
            {
                "internalType": "address",
                "name": "recipient",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "amount",
                "type": "uint256"
            }
        ],
        "name": "withdrawPeerAnyway",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    }
];
const contract_whitelist = new web3.eth.Contract(contract_abi, contract_addr);
const usdt_addr = '0x55d398326f99059fF775485246999027B3197955';
const usdt_abi = [
    {
        "inputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "constructor"
    }, {
        "anonymous": false,
        "inputs": [{"indexed": true, "internalType": "address", "name": "owner", "type": "address"}, {
            "indexed": true,
            "internalType": "address",
            "name": "spender",
            "type": "address"
        }, {"indexed": false, "internalType": "uint256", "name": "value", "type": "uint256"}],
        "name": "Approval",
        "type": "event"
    }, {
        "anonymous": false,
        "inputs": [{
            "indexed": true,
            "internalType": "address",
            "name": "previousOwner",
            "type": "address"
        }, {"indexed": true, "internalType": "address", "name": "newOwner", "type": "address"}],
        "name": "OwnershipTransferred",
        "type": "event"
    }, {
        "anonymous": false,
        "inputs": [{"indexed": true, "internalType": "address", "name": "from", "type": "address"}, {
            "indexed": true,
            "internalType": "address",
            "name": "to",
            "type": "address"
        }, {"indexed": false, "internalType": "uint256", "name": "value", "type": "uint256"}],
        "name": "Transfer",
        "type": "event"
    }, {
        "constant": true,
        "inputs": [],
        "name": "_decimals",
        "outputs": [{"internalType": "uint8", "name": "", "type": "uint8"}],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }, {
        "constant": true,
        "inputs": [],
        "name": "_name",
        "outputs": [{"internalType": "string", "name": "", "type": "string"}],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }, {
        "constant": true,
        "inputs": [],
        "name": "_symbol",
        "outputs": [{"internalType": "string", "name": "", "type": "string"}],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }, {
        "constant": true,
        "inputs": [{"internalType": "address", "name": "owner", "type": "address"}, {
            "internalType": "address",
            "name": "spender",
            "type": "address"
        }],
        "name": "allowance",
        "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }, {
        "constant": false,
        "inputs": [{"internalType": "address", "name": "spender", "type": "address"}, {
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
        }],
        "name": "approve",
        "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    }, {
        "constant": true,
        "inputs": [{"internalType": "address", "name": "account", "type": "address"}],
        "name": "balanceOf",
        "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }, {
        "constant": false,
        "inputs": [{"internalType": "uint256", "name": "amount", "type": "uint256"}],
        "name": "burn",
        "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    }, {
        "constant": true,
        "inputs": [],
        "name": "decimals",
        "outputs": [{"internalType": "uint8", "name": "", "type": "uint8"}],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }, {
        "constant": false,
        "inputs": [{"internalType": "address", "name": "spender", "type": "address"}, {
            "internalType": "uint256",
            "name": "subtractedValue",
            "type": "uint256"
        }],
        "name": "decreaseAllowance",
        "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    }, {
        "constant": true,
        "inputs": [],
        "name": "getOwner",
        "outputs": [{"internalType": "address", "name": "", "type": "address"}],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }, {
        "constant": false,
        "inputs": [{"internalType": "address", "name": "spender", "type": "address"}, {
            "internalType": "uint256",
            "name": "addedValue",
            "type": "uint256"
        }],
        "name": "increaseAllowance",
        "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    }, {
        "constant": false,
        "inputs": [{"internalType": "uint256", "name": "amount", "type": "uint256"}],
        "name": "mint",
        "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    }, {
        "constant": true,
        "inputs": [],
        "name": "name",
        "outputs": [{"internalType": "string", "name": "", "type": "string"}],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }, {
        "constant": true,
        "inputs": [],
        "name": "owner",
        "outputs": [{"internalType": "address", "name": "", "type": "address"}],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }, {
        "constant": false,
        "inputs": [],
        "name": "renounceOwnership",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    }, {
        "constant": true,
        "inputs": [],
        "name": "symbol",
        "outputs": [{"internalType": "string", "name": "", "type": "string"}],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }, {
        "constant": true,
        "inputs": [],
        "name": "totalSupply",
        "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }, {
        "constant": false,
        "inputs": [{"internalType": "address", "name": "recipient", "type": "address"}, {
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
        }],
        "name": "transfer",
        "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    }, {
        "constant": false,
        "inputs": [{"internalType": "address", "name": "sender", "type": "address"}, {
            "internalType": "address",
            "name": "recipient",
            "type": "address"
        }, {"internalType": "uint256", "name": "amount", "type": "uint256"}],
        "name": "transferFrom",
        "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    }, {
        "constant": false,
        "inputs": [{"internalType": "address", "name": "newOwner", "type": "address"}],
        "name": "transferOwnership",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    }
];
const contract_usdt = new web3.eth.Contract(usdt_abi, usdt_addr);
const price = '100000000000000000000';

let address = ''; // 当前钱包地址

// 页面加载完成后，执行(判断当前地址是否已经购买过)
contract_whitelist.methods.addressExists(address).call().then(function (result) {
    if (result) { // 购买过
        // TODO 按钮文案变为 "已购买" 且不可点击
    } else {
        contract_usdt.methods.allowance(address, contract_addr).call().then(function (amount) {
            let BN = web3.utils.BN;
            let rs = new BN(amount).sub(new BN(price));
            if (rs.negative === 0) { // 已授权
                // TODO 按钮文案变为 购买，可点击
            } else { // 未授权
                // TODO 按钮文案变为 授权，可点击
            }
        });
    }
});

// 点击授权按钮执行(授权)
contract_usdt.methods.approve(contract_addr, price).send({from: address})
    .on('receipt', function (receipt) {
        // TODO 按钮文案变为 购买，可点击
    })
    .on('error', function (err) {
        // TODO 错误提示
        console.log(err);
    });

// 点击购买按钮执行(购买)
contract_whitelist.methods.buy().send({from: address, gas: 40000})
    .on('receipt', function (receipt) {
        // TODO 购买成功，按钮文案变为 "已购买" 且不可点击
    })
    .on('error', function (err) {
        // TODO 错误提示
        console.log(err);
    });
