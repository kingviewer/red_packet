const axios = require("axios");
const Web3 = require("web3");
const HDWalletProvider = require("truffle-hdwallet-provider");
const wallet_url = 'https://rpc-mainnet.maticvigil.com';
const BASE_URL = 'https://polygon.api.0x.org/';

const Contracts = {
    usdt: {
        address: '0xc2132D05D31c914a87C6611C10748AEb04B58e8F',
        abi: [{"inputs": [], "stateMutability": "nonpayable", "type": "constructor"}, {
            "anonymous": false,
            "inputs": [{
                "indexed": true,
                "internalType": "address",
                "name": "owner",
                "type": "address"
            }, {"indexed": true, "internalType": "address", "name": "spender", "type": "address"}, {
                "indexed": false,
                "internalType": "uint256",
                "name": "value",
                "type": "uint256"
            }],
            "name": "Approval",
            "type": "event"
        }, {
            "anonymous": false,
            "inputs": [{
                "indexed": false,
                "internalType": "address",
                "name": "userAddress",
                "type": "address"
            }, {
                "indexed": false,
                "internalType": "address payable",
                "name": "relayerAddress",
                "type": "address"
            }, {"indexed": false, "internalType": "bytes", "name": "functionSignature", "type": "bytes"}],
            "name": "MetaTransactionExecuted",
            "type": "event"
        }, {
            "anonymous": false,
            "inputs": [{
                "indexed": true,
                "internalType": "bytes32",
                "name": "role",
                "type": "bytes32"
            }, {
                "indexed": true,
                "internalType": "bytes32",
                "name": "previousAdminRole",
                "type": "bytes32"
            }, {"indexed": true, "internalType": "bytes32", "name": "newAdminRole", "type": "bytes32"}],
            "name": "RoleAdminChanged",
            "type": "event"
        }, {
            "anonymous": false,
            "inputs": [{
                "indexed": true,
                "internalType": "bytes32",
                "name": "role",
                "type": "bytes32"
            }, {"indexed": true, "internalType": "address", "name": "account", "type": "address"}, {
                "indexed": true,
                "internalType": "address",
                "name": "sender",
                "type": "address"
            }],
            "name": "RoleGranted",
            "type": "event"
        }, {
            "anonymous": false,
            "inputs": [{
                "indexed": true,
                "internalType": "bytes32",
                "name": "role",
                "type": "bytes32"
            }, {"indexed": true, "internalType": "address", "name": "account", "type": "address"}, {
                "indexed": true,
                "internalType": "address",
                "name": "sender",
                "type": "address"
            }],
            "name": "RoleRevoked",
            "type": "event"
        }, {
            "anonymous": false,
            "inputs": [{
                "indexed": true,
                "internalType": "address",
                "name": "from",
                "type": "address"
            }, {"indexed": true, "internalType": "address", "name": "to", "type": "address"}, {
                "indexed": false,
                "internalType": "uint256",
                "name": "value",
                "type": "uint256"
            }],
            "name": "Transfer",
            "type": "event"
        }, {
            "inputs": [],
            "name": "CHILD_CHAIN_ID",
            "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [],
            "name": "CHILD_CHAIN_ID_BYTES",
            "outputs": [{"internalType": "bytes", "name": "", "type": "bytes"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [],
            "name": "DEFAULT_ADMIN_ROLE",
            "outputs": [{"internalType": "bytes32", "name": "", "type": "bytes32"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [],
            "name": "DEPOSITOR_ROLE",
            "outputs": [{"internalType": "bytes32", "name": "", "type": "bytes32"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [],
            "name": "ERC712_VERSION",
            "outputs": [{"internalType": "string", "name": "", "type": "string"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [],
            "name": "ROOT_CHAIN_ID",
            "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [],
            "name": "ROOT_CHAIN_ID_BYTES",
            "outputs": [{"internalType": "bytes", "name": "", "type": "bytes"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [{"internalType": "address", "name": "owner", "type": "address"}, {
                "internalType": "address",
                "name": "spender",
                "type": "address"
            }],
            "name": "allowance",
            "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [{"internalType": "address", "name": "spender", "type": "address"}, {
                "internalType": "uint256",
                "name": "amount",
                "type": "uint256"
            }],
            "name": "approve",
            "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
            "stateMutability": "nonpayable",
            "type": "function"
        }, {
            "inputs": [{"internalType": "address", "name": "account", "type": "address"}],
            "name": "balanceOf",
            "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [{"internalType": "string", "name": "name_", "type": "string"}],
            "name": "changeName",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        }, {
            "inputs": [],
            "name": "decimals",
            "outputs": [{"internalType": "uint8", "name": "", "type": "uint8"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [{"internalType": "address", "name": "spender", "type": "address"}, {
                "internalType": "uint256",
                "name": "subtractedValue",
                "type": "uint256"
            }],
            "name": "decreaseAllowance",
            "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
            "stateMutability": "nonpayable",
            "type": "function"
        }, {
            "inputs": [{"internalType": "address", "name": "user", "type": "address"}, {
                "internalType": "bytes",
                "name": "depositData",
                "type": "bytes"
            }], "name": "deposit", "outputs": [], "stateMutability": "nonpayable", "type": "function"
        }, {
            "inputs": [{"internalType": "address", "name": "userAddress", "type": "address"}, {
                "internalType": "bytes",
                "name": "functionSignature",
                "type": "bytes"
            }, {"internalType": "bytes32", "name": "sigR", "type": "bytes32"}, {
                "internalType": "bytes32",
                "name": "sigS",
                "type": "bytes32"
            }, {"internalType": "uint8", "name": "sigV", "type": "uint8"}],
            "name": "executeMetaTransaction",
            "outputs": [{"internalType": "bytes", "name": "", "type": "bytes"}],
            "stateMutability": "payable",
            "type": "function"
        }, {
            "inputs": [],
            "name": "getChainId",
            "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}],
            "stateMutability": "pure",
            "type": "function"
        }, {
            "inputs": [],
            "name": "getDomainSeperator",
            "outputs": [{"internalType": "bytes32", "name": "", "type": "bytes32"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [{"internalType": "address", "name": "user", "type": "address"}],
            "name": "getNonce",
            "outputs": [{"internalType": "uint256", "name": "nonce", "type": "uint256"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [{"internalType": "bytes32", "name": "role", "type": "bytes32"}],
            "name": "getRoleAdmin",
            "outputs": [{"internalType": "bytes32", "name": "", "type": "bytes32"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [{"internalType": "bytes32", "name": "role", "type": "bytes32"}, {
                "internalType": "uint256",
                "name": "index",
                "type": "uint256"
            }],
            "name": "getRoleMember",
            "outputs": [{"internalType": "address", "name": "", "type": "address"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [{"internalType": "bytes32", "name": "role", "type": "bytes32"}],
            "name": "getRoleMemberCount",
            "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [{"internalType": "bytes32", "name": "role", "type": "bytes32"}, {
                "internalType": "address",
                "name": "account",
                "type": "address"
            }], "name": "grantRole", "outputs": [], "stateMutability": "nonpayable", "type": "function"
        }, {
            "inputs": [{"internalType": "bytes32", "name": "role", "type": "bytes32"}, {
                "internalType": "address",
                "name": "account",
                "type": "address"
            }],
            "name": "hasRole",
            "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [{"internalType": "address", "name": "spender", "type": "address"}, {
                "internalType": "uint256",
                "name": "addedValue",
                "type": "uint256"
            }],
            "name": "increaseAllowance",
            "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
            "stateMutability": "nonpayable",
            "type": "function"
        }, {
            "inputs": [{"internalType": "string", "name": "name_", "type": "string"}, {
                "internalType": "string",
                "name": "symbol_",
                "type": "string"
            }, {"internalType": "uint8", "name": "decimals_", "type": "uint8"}, {
                "internalType": "address",
                "name": "childChainManager",
                "type": "address"
            }], "name": "initialize", "outputs": [], "stateMutability": "nonpayable", "type": "function"
        }, {
            "inputs": [],
            "name": "name",
            "outputs": [{"internalType": "string", "name": "", "type": "string"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [{"internalType": "bytes32", "name": "role", "type": "bytes32"}, {
                "internalType": "address",
                "name": "account",
                "type": "address"
            }], "name": "renounceRole", "outputs": [], "stateMutability": "nonpayable", "type": "function"
        }, {
            "inputs": [{"internalType": "bytes32", "name": "role", "type": "bytes32"}, {
                "internalType": "address",
                "name": "account",
                "type": "address"
            }], "name": "revokeRole", "outputs": [], "stateMutability": "nonpayable", "type": "function"
        }, {
            "inputs": [],
            "name": "symbol",
            "outputs": [{"internalType": "string", "name": "", "type": "string"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [],
            "name": "totalSupply",
            "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}],
            "stateMutability": "view",
            "type": "function"
        }, {
            "inputs": [{"internalType": "address", "name": "recipient", "type": "address"}, {
                "internalType": "uint256",
                "name": "amount",
                "type": "uint256"
            }],
            "name": "transfer",
            "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
            "stateMutability": "nonpayable",
            "type": "function"
        }, {
            "inputs": [{"internalType": "address", "name": "sender", "type": "address"}, {
                "internalType": "address",
                "name": "recipient",
                "type": "address"
            }, {"internalType": "uint256", "name": "amount", "type": "uint256"}],
            "name": "transferFrom",
            "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
            "stateMutability": "nonpayable",
            "type": "function"
        }, {
            "inputs": [{"internalType": "uint256", "name": "amount", "type": "uint256"}],
            "name": "withdraw",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        }]
    }
};

let web3 = new Web3(new HDWalletProvider('cruel venue remember project twist else congress cattle poverty midnight across draw', wallet_url)),
    sell_amount = '1000000',
    address = '0x9aA2e22c8F117a540CA1c008E12e84f6A2CD349f',
    prv_key = '8c33da9cefc245dac92c9a5065304b1fc849c59a3c05d70a55234876553ab5e6';
let contract = new web3.eth.Contract(Contracts.usdt.abi, Contracts.usdt.address);

contract.methods.decimals().call().then(rs => {
    console.log(rs);
});

// console.log('获取价格数据...');
// axios.get(BASE_URL + 'swap/v1/price', {
//     params: {sellToken: 'USDT', buyToken: 'DAI', sellAmount: sell_amount}
// }).then(rs => {
//     console.log('获取价格数据成功');
//     console.log('授权...');
//     contract.methods.approve(rs.data.allowanceTarget, '10000000000000000000000000000').send({from: address, chainId: 137})
//         .on('receipt', function (receipt) {
//             console.log('授权成功，等待区块确认...');
//         })
//         .on('confirmation', function (confirm_count, receipt) {
//             if (confirm_count < 6)
//                 console.log('区块确认数: ' + confirm_count);
//             else if (confirm_count === 6) {
//                 console.log('区块确认数: ' + confirm_count + '. 等待区块确认完毕');
//                 // exchange(gas_price);
//             }
//         })
//         .on('error', function (err) {
//             console.log("授权失败:");
//             console.log(err);
//         })
// });

console.log('获取交易数据...');
axios.get(BASE_URL + 'swap/v1/quote', {
    params: {sellToken: 'USDT', buyToken: 'DAI', sellAmount: sell_amount, takerAddress: address}
}).then(exchange => {
    console.log(exchange.data);
    console.log('获取交易数据成功');
    console.log('签名交易并发布...');
    let trans = exchange.data;
    let data = {
        data: trans.data,
        to: trans.to,
        from: trans.from,
        gas: trans.estimatedGas,
        gasPrice: trans.gasPrice
    };
    web3.eth.accounts.signTransaction(data, prv_key).then(signed => {
        web3.eth.sendSignedTransaction(signed.rawTransaction)
            .on('receipt', function (receipt) {
                console.log('交易成功, TX Hash:' + receipt.transactionHash);
            })
            .on('error', function (err) {
                console.log('交易失败: ');
                console.log(err);
            }).catch(err => {
                console.log('交易失败: ');
                console.log(err);
            }
        );
    }).catch(err => {
        console.log('签名交易失败：');
        console.log(err);
    });
}).catch(err => {
    console.log('获取交易数据失败:');
    console.log(err.response);
});