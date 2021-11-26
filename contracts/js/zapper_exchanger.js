const axios = require("axios");
const Web3 = require("web3");
const schedule = require('node-schedule');
const HDWalletProvider = require("truffle-hdwallet-provider");
const wallet_url = 'https://bsc-dataseed1.defibit.io';
const API_KEY = '96e0cc51-a62e-42ca-acee-910ea7d2a241', BASE_URL = 'https://api.zapper.fi/';

const Contracts = {
    usdt: {
        address: '0x55d398326f99059fF775485246999027B3197955',
        abi: [
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
        ]
    }
};

// let web3 = new Web3(new HDWalletProvider('cruel venue remember project twist else congress cattle poverty midnight across draw', wallet_url, 3, 1));
let web3 = new Web3(new HDWalletProvider('cruel venue remember project twist else congress cattle poverty midnight across draw', wallet_url));
let contract = new web3.eth.Contract(Contracts.usdt.abi, Contracts.usdt.address);

let network = 'binance-smart-chain',
    buy_token = '0xbA2aE424d960c26247Dd6c32edC70B295c744C43',
    address = '0x9aA2e22c8F117a540CA1c008E12e84f6A2CD349f',
    // prv_key = '7585c9f18ed466822f8a0dc2941938effcbf7693d30e30357c7be1509c462a67',
    prv_key = '8c33da9cefc245dac92c9a5065304b1fc849c59a3c05d70a55234876553ab5e6',
    sell_amount = '1000000000000000000';

function exchange(gas_price) {
    console.log('生成交易数据...');
    axios.get(BASE_URL + 'v1/exchange/quote', {
        params: {
            network: network,
            api_key: API_KEY,
            sellTokenAddress: Contracts.usdt.address,
            buyTokenAddress: buy_token,
            sellAmount: sell_amount,
            gasPrice: gas_price + '000000000',
            ownerAddress: address,
            slippagePercentage: 0.03
        }
    }).then(rs => {
        console.log('生成交易数据成功，将交易发布到网络...');
        let trans = rs.data;
        let data = {
            data: trans.data,
            to: trans.to,
            from: address,
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
    }).catch(e => {
        console.log('生成交易数据失败：');
        console.log(e);
    });
}

console.log('获取gas price...');
axios.get(BASE_URL + 'v1/gas-price', {
    params: {network: network, api_key: API_KEY}
}).then(data => {
    let gas_price = data.data.standard;
    console.log('gas price: ' + gas_price + ' gwei');

    console.log('获取交易对价格信息...');
    axios.get(BASE_URL + 'v1/exchange/price', {
        params: {
            network: network,
            api_key: API_KEY,
            sellTokenAddress: Contracts.usdt.address,
            buyTokenAddress: buy_token,
            sellAmount: sell_amount,
            gasPrice: gas_price + '000000000'
        }
    }).then(rs => {
        let price_data = rs.data;
        console.log('交易对价格: ' + price_data.price);
        console.log('预计买入数量: ' + price_data.buyAmount);

        console.log('获取授权信息...');
        axios.get(BASE_URL + 'v1/approval-state', {
            params: {
                network: network,
                api_key: API_KEY,
                tokenAddress: Contracts.usdt.address,
                spenderAddress: price_data.allowanceTarget,
                ownerAddress: address,
                amount: sell_amount
            }
        }).then(rs => {
            console.log('授权信息结果: ' + (rs.data.isApproved ? '已授权' : '未授权, 开始授权...'));
            if (rs.data.isApproved) {
                exchange(gas_price);
            } else {
                contract.methods.approve(price_data.allowanceTarget, sell_amount + '0').send({from: address})
                    .on('receipt', function (receipt) {
                        console.log('授权成功，等待区块确认...');
                    })
                    .on('confirmation', function (confirm_count, receipt) {
                        if (confirm_count < 6)
                            console.log('区块确认数: ' + confirm_count);
                        else if (confirm_count === 6) {
                            console.log('区块确认数: ' + confirm_count + '. 等待区块确认完毕');
                            exchange(gas_price);
                        }
                    })
                    .on('error', function (err) {
                        console.log("授权失败:");
                        console.log(err);
                    })
            }
        });
    });
});