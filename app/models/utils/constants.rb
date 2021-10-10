module Utils
  module Constants
    # BASE_URL = 'http://localhost:3000/'
    BASE_URL = 'https://www.bombgame.org/'
    # WALLET_URL = "http://localhost:8545"
    WALLET_URL = 'https://bsc-dataseed1.defibit.io'
    CONTRACTS = {
      usdt: {
        decimals: 18,
        # address: '0x9cb1C2C652E188f1ff16672D5eB3b754240ED6d0',
        address: '0x42F2fBa90ACF3ddfb413EEae4F58bC477D93F55d',
#         abi: <<EOS
#       [
#             {
#                 "inputs": [],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "constructor"
#             },
#             {
#                 "anonymous": false,
#                 "inputs": [
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "owner",
#                         "type": "address"
#                     },
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "spender",
#                         "type": "address"
#                     },
#                     {
#                         "indexed": false,
#                         "internalType": "uint256",
#                         "name": "value",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "Approval",
#                 "type": "event"
#             },
#             {
#                 "anonymous": false,
#                 "inputs": [
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "previousOwner",
#                         "type": "address"
#                     },
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "newOwner",
#                         "type": "address"
#                     }
#                 ],
#                 "name": "OwnershipTransferred",
#                 "type": "event"
#             },
#             {
#                 "anonymous": false,
#                 "inputs": [
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "from",
#                         "type": "address"
#                     },
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "to",
#                         "type": "address"
#                     },
#                     {
#                         "indexed": false,
#                         "internalType": "uint256",
#                         "name": "value",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "Transfer",
#                 "type": "event"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "_decimals",
#                 "outputs": [
#                     {
#                         "internalType": "uint8",
#                         "name": "",
#                         "type": "uint8"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "_name",
#                 "outputs": [
#                     {
#                         "internalType": "string",
#                         "name": "",
#                         "type": "string"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "_symbol",
#                 "outputs": [
#                     {
#                         "internalType": "string",
#                         "name": "",
#                         "type": "string"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "owner",
#                 "outputs": [
#                     {
#                         "internalType": "address",
#                         "name": "",
#                         "type": "address"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [],
#                 "name": "renounceOwnership",
#                 "outputs": [],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "newOwner",
#                         "type": "address"
#                     }
#                 ],
#                 "name": "transferOwnership",
#                 "outputs": [],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "getOwner",
#                 "outputs": [
#                     {
#                         "internalType": "address",
#                         "name": "",
#                         "type": "address"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "decimals",
#                 "outputs": [
#                     {
#                         "internalType": "uint8",
#                         "name": "",
#                         "type": "uint8"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "symbol",
#                 "outputs": [
#                     {
#                         "internalType": "string",
#                         "name": "",
#                         "type": "string"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "name",
#                 "outputs": [
#                     {
#                         "internalType": "string",
#                         "name": "",
#                         "type": "string"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "totalSupply",
#                 "outputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "",
#                         "type": "uint256"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "account",
#                         "type": "address"
#                     }
#                 ],
#                 "name": "balanceOf",
#                 "outputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "",
#                         "type": "uint256"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "recipient",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "transfer",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "owner",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "address",
#                         "name": "spender",
#                         "type": "address"
#                     }
#                 ],
#                 "name": "allowance",
#                 "outputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "",
#                         "type": "uint256"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "spender",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "approve",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "sender",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "address",
#                         "name": "recipient",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "transferFrom",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "spender",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "addedValue",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "increaseAllowance",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "spender",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "subtractedValue",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "decreaseAllowance",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "mint",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "burn",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             }
#         ]
# EOS
        abi: <<EOS
      [
            {
                "inputs": [],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "constructor"
            },
            {
                "anonymous": false,
                "inputs": [
                    {
                        "indexed": true,
                        "internalType": "address",
                        "name": "owner",
                        "type": "address"
                    },
                    {
                        "indexed": true,
                        "internalType": "address",
                        "name": "spender",
                        "type": "address"
                    },
                    {
                        "indexed": false,
                        "internalType": "uint256",
                        "name": "value",
                        "type": "uint256"
                    }
                ],
                "name": "Approval",
                "type": "event"
            },
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
                "anonymous": false,
                "inputs": [
                    {
                        "indexed": true,
                        "internalType": "address",
                        "name": "from",
                        "type": "address"
                    },
                    {
                        "indexed": true,
                        "internalType": "address",
                        "name": "to",
                        "type": "address"
                    },
                    {
                        "indexed": false,
                        "internalType": "uint256",
                        "name": "value",
                        "type": "uint256"
                    }
                ],
                "name": "Transfer",
                "type": "event"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "_decimals",
                "outputs": [
                    {
                        "internalType": "uint8",
                        "name": "",
                        "type": "uint8"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "_name",
                "outputs": [
                    {
                        "internalType": "string",
                        "name": "",
                        "type": "string"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "_symbol",
                "outputs": [
                    {
                        "internalType": "string",
                        "name": "",
                        "type": "string"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [
                    {
                        "internalType": "address",
                        "name": "owner",
                        "type": "address"
                    },
                    {
                        "internalType": "address",
                        "name": "spender",
                        "type": "address"
                    }
                ],
                "name": "allowance",
                "outputs": [
                    {
                        "internalType": "uint256",
                        "name": "",
                        "type": "uint256"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": false,
                "inputs": [
                    {
                        "internalType": "address",
                        "name": "spender",
                        "type": "address"
                    },
                    {
                        "internalType": "uint256",
                        "name": "amount",
                        "type": "uint256"
                    }
                ],
                "name": "approve",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [
                    {
                        "internalType": "address",
                        "name": "account",
                        "type": "address"
                    }
                ],
                "name": "balanceOf",
                "outputs": [
                    {
                        "internalType": "uint256",
                        "name": "",
                        "type": "uint256"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": false,
                "inputs": [
                    {
                        "internalType": "uint256",
                        "name": "amount",
                        "type": "uint256"
                    }
                ],
                "name": "burn",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "decimals",
                "outputs": [
                    {
                        "internalType": "uint8",
                        "name": "",
                        "type": "uint8"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": false,
                "inputs": [
                    {
                        "internalType": "address",
                        "name": "spender",
                        "type": "address"
                    },
                    {
                        "internalType": "uint256",
                        "name": "subtractedValue",
                        "type": "uint256"
                    }
                ],
                "name": "decreaseAllowance",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "getOwner",
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
                "inputs": [
                    {
                        "internalType": "address",
                        "name": "spender",
                        "type": "address"
                    },
                    {
                        "internalType": "uint256",
                        "name": "addedValue",
                        "type": "uint256"
                    }
                ],
                "name": "increaseAllowance",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "constant": false,
                "inputs": [
                    {
                        "internalType": "uint256",
                        "name": "amount",
                        "type": "uint256"
                    }
                ],
                "name": "mint",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "name",
                "outputs": [
                    {
                        "internalType": "string",
                        "name": "",
                        "type": "string"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
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
                "constant": true,
                "inputs": [],
                "name": "symbol",
                "outputs": [
                    {
                        "internalType": "string",
                        "name": "",
                        "type": "string"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "totalSupply",
                "outputs": [
                    {
                        "internalType": "uint256",
                        "name": "",
                        "type": "uint256"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
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
                "name": "transfer",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "constant": false,
                "inputs": [
                    {
                        "internalType": "address",
                        "name": "sender",
                        "type": "address"
                    },
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
                "name": "transferFrom",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
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
            }
        ]
EOS
        },
      cic: {
        decimals: 8,
        # address: '0xD69f983920ba029e1a090908c0576b526Aac53A0',
        address: '0x3890C270F69744e945b23471678F9F4891BAF432',
#         abi: <<EOS
# [
#             {
#                 "inputs": [],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "constructor"
#             },
#             {
#                 "anonymous": false,
#                 "inputs": [
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "owner",
#                         "type": "address"
#                     },
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "spender",
#                         "type": "address"
#                     },
#                     {
#                         "indexed": false,
#                         "internalType": "uint256",
#                         "name": "value",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "Approval",
#                 "type": "event"
#             },
#             {
#                 "anonymous": false,
#                 "inputs": [
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "previousOwner",
#                         "type": "address"
#                     },
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "newOwner",
#                         "type": "address"
#                     }
#                 ],
#                 "name": "OwnershipTransferred",
#                 "type": "event"
#             },
#             {
#                 "anonymous": false,
#                 "inputs": [
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "from",
#                         "type": "address"
#                     },
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "to",
#                         "type": "address"
#                     },
#                     {
#                         "indexed": false,
#                         "internalType": "uint256",
#                         "name": "value",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "Transfer",
#                 "type": "event"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "_decimals",
#                 "outputs": [
#                     {
#                         "internalType": "uint8",
#                         "name": "",
#                         "type": "uint8"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "_name",
#                 "outputs": [
#                     {
#                         "internalType": "string",
#                         "name": "",
#                         "type": "string"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "_symbol",
#                 "outputs": [
#                     {
#                         "internalType": "string",
#                         "name": "",
#                         "type": "string"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "owner",
#                 "outputs": [
#                     {
#                         "internalType": "address",
#                         "name": "",
#                         "type": "address"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [],
#                 "name": "renounceOwnership",
#                 "outputs": [],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "newOwner",
#                         "type": "address"
#                     }
#                 ],
#                 "name": "transferOwnership",
#                 "outputs": [],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "getOwner",
#                 "outputs": [
#                     {
#                         "internalType": "address",
#                         "name": "",
#                         "type": "address"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "decimals",
#                 "outputs": [
#                     {
#                         "internalType": "uint8",
#                         "name": "",
#                         "type": "uint8"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "symbol",
#                 "outputs": [
#                     {
#                         "internalType": "string",
#                         "name": "",
#                         "type": "string"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "name",
#                 "outputs": [
#                     {
#                         "internalType": "string",
#                         "name": "",
#                         "type": "string"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [],
#                 "name": "totalSupply",
#                 "outputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "",
#                         "type": "uint256"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "account",
#                         "type": "address"
#                     }
#                 ],
#                 "name": "balanceOf",
#                 "outputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "",
#                         "type": "uint256"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "recipient",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "transfer",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": true,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "owner",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "address",
#                         "name": "spender",
#                         "type": "address"
#                     }
#                 ],
#                 "name": "allowance",
#                 "outputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "",
#                         "type": "uint256"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "view",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "spender",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "approve",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "sender",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "address",
#                         "name": "recipient",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "transferFrom",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "spender",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "addedValue",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "increaseAllowance",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "spender",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "subtractedValue",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "decreaseAllowance",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "mint",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "constant": false,
#                 "inputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "burn",
#                 "outputs": [
#                     {
#                         "internalType": "bool",
#                         "name": "",
#                         "type": "bool"
#                     }
#                 ],
#                 "payable": false,
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             }
#         ]
# EOS
        abi: <<EOS
      [
            {
                "inputs": [],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "constructor"
            },
            {
                "anonymous": false,
                "inputs": [
                    {
                        "indexed": true,
                        "internalType": "address",
                        "name": "owner",
                        "type": "address"
                    },
                    {
                        "indexed": true,
                        "internalType": "address",
                        "name": "spender",
                        "type": "address"
                    },
                    {
                        "indexed": false,
                        "internalType": "uint256",
                        "name": "value",
                        "type": "uint256"
                    }
                ],
                "name": "Approval",
                "type": "event"
            },
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
                "anonymous": false,
                "inputs": [
                    {
                        "indexed": true,
                        "internalType": "address",
                        "name": "from",
                        "type": "address"
                    },
                    {
                        "indexed": true,
                        "internalType": "address",
                        "name": "to",
                        "type": "address"
                    },
                    {
                        "indexed": false,
                        "internalType": "uint256",
                        "name": "value",
                        "type": "uint256"
                    }
                ],
                "name": "Transfer",
                "type": "event"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "_decimals",
                "outputs": [
                    {
                        "internalType": "uint8",
                        "name": "",
                        "type": "uint8"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "_name",
                "outputs": [
                    {
                        "internalType": "string",
                        "name": "",
                        "type": "string"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "_symbol",
                "outputs": [
                    {
                        "internalType": "string",
                        "name": "",
                        "type": "string"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [
                    {
                        "internalType": "address",
                        "name": "owner",
                        "type": "address"
                    },
                    {
                        "internalType": "address",
                        "name": "spender",
                        "type": "address"
                    }
                ],
                "name": "allowance",
                "outputs": [
                    {
                        "internalType": "uint256",
                        "name": "",
                        "type": "uint256"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": false,
                "inputs": [
                    {
                        "internalType": "address",
                        "name": "spender",
                        "type": "address"
                    },
                    {
                        "internalType": "uint256",
                        "name": "amount",
                        "type": "uint256"
                    }
                ],
                "name": "approve",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [
                    {
                        "internalType": "address",
                        "name": "account",
                        "type": "address"
                    }
                ],
                "name": "balanceOf",
                "outputs": [
                    {
                        "internalType": "uint256",
                        "name": "",
                        "type": "uint256"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": false,
                "inputs": [
                    {
                        "internalType": "uint256",
                        "name": "amount",
                        "type": "uint256"
                    }
                ],
                "name": "burn",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "decimals",
                "outputs": [
                    {
                        "internalType": "uint8",
                        "name": "",
                        "type": "uint8"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": false,
                "inputs": [
                    {
                        "internalType": "address",
                        "name": "spender",
                        "type": "address"
                    },
                    {
                        "internalType": "uint256",
                        "name": "subtractedValue",
                        "type": "uint256"
                    }
                ],
                "name": "decreaseAllowance",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "getOwner",
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
                "inputs": [
                    {
                        "internalType": "address",
                        "name": "spender",
                        "type": "address"
                    },
                    {
                        "internalType": "uint256",
                        "name": "addedValue",
                        "type": "uint256"
                    }
                ],
                "name": "increaseAllowance",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "constant": false,
                "inputs": [
                    {
                        "internalType": "uint256",
                        "name": "amount",
                        "type": "uint256"
                    }
                ],
                "name": "mint",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "name",
                "outputs": [
                    {
                        "internalType": "string",
                        "name": "",
                        "type": "string"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
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
                "constant": true,
                "inputs": [],
                "name": "symbol",
                "outputs": [
                    {
                        "internalType": "string",
                        "name": "",
                        "type": "string"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": true,
                "inputs": [],
                "name": "totalSupply",
                "outputs": [
                    {
                        "internalType": "uint256",
                        "name": "",
                        "type": "uint256"
                    }
                ],
                "payable": false,
                "stateMutability": "view",
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
                "name": "transfer",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            },
            {
                "constant": false,
                "inputs": [
                    {
                        "internalType": "address",
                        "name": "sender",
                        "type": "address"
                    },
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
                "name": "transferFrom",
                "outputs": [
                    {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                    }
                ],
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
            }
        ]
EOS
      },
      game: {
        # address: '0xEB44bbC5fbD564Da789897bfbDfFBd236108A49B',
        address: '0x0A264E33f550546F1307F725dd402990918E9c75',
#         abi: <<EOS
# [
#             {
#                 "anonymous": false,
#                 "inputs": [
#                     {
#                         "indexed": false,
#                         "internalType": "address",
#                         "name": "user",
#                         "type": "address"
#                     },
#                     {
#                         "indexed": false,
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "Deposit",
#                 "type": "event"
#             },
#             {
#                 "anonymous": false,
#                 "inputs": [
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "previousOwner",
#                         "type": "address"
#                     },
#                     {
#                         "indexed": true,
#                         "internalType": "address",
#                         "name": "newOwner",
#                         "type": "address"
#                     }
#                 ],
#                 "name": "OwnershipTransferred",
#                 "type": "event"
#             },
#             {
#                 "inputs": [],
#                 "name": "geUnlockTime",
#                 "outputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "",
#                         "type": "uint256"
#                     }
#                 ],
#                 "stateMutability": "view",
#                 "type": "function",
#                 "constant": true
#             },
#             {
#                 "inputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "time",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "lock",
#                 "outputs": [],
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "inputs": [],
#                 "name": "owner",
#                 "outputs": [
#                     {
#                         "internalType": "address",
#                         "name": "",
#                         "type": "address"
#                     }
#                 ],
#                 "stateMutability": "view",
#                 "type": "function",
#                 "constant": true
#             },
#             {
#                 "inputs": [],
#                 "name": "renounceOwnership",
#                 "outputs": [],
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "newOwner",
#                         "type": "address"
#                     }
#                 ],
#                 "name": "transferOwnership",
#                 "outputs": [],
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "inputs": [],
#                 "name": "unlock",
#                 "outputs": [],
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "user",
#                         "type": "address"
#                     }
#                 ],
#                 "name": "quoteBalanceOf",
#                 "outputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "",
#                         "type": "uint256"
#                     }
#                 ],
#                 "stateMutability": "view",
#                 "type": "function",
#                 "constant": true
#             },
#             {
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "user",
#                         "type": "address"
#                     }
#                 ],
#                 "name": "peerBalanceOf",
#                 "outputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "",
#                         "type": "uint256"
#                     }
#                 ],
#                 "stateMutability": "view",
#                 "type": "function",
#                 "constant": true
#             },
#             {
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "recipient",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "withdrawQuote",
#                 "outputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "",
#                         "type": "uint256"
#                     }
#                 ],
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "recipient",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "withdrawPeer",
#                 "outputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "",
#                         "type": "uint256"
#                     }
#                 ],
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "user",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "addQuoteForUser",
#                 "outputs": [
#                     {
#                         "internalType": "uint256",
#                         "name": "",
#                         "type": "uint256"
#                     }
#                 ],
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "inputs": [
#                     {
#                         "internalType": "address[]",
#                         "name": "users",
#                         "type": "address[]"
#                     },
#                     {
#                         "internalType": "uint256[]",
#                         "name": "amounts",
#                         "type": "uint256[]"
#                     }
#                 ],
#                 "name": "addQuoteForUsers",
#                 "outputs": [],
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "inputs": [
#                     {
#                         "internalType": "address[]",
#                         "name": "users",
#                         "type": "address[]"
#                     },
#                     {
#                         "internalType": "uint256[]",
#                         "name": "amounts",
#                         "type": "uint256[]"
#                     }
#                 ],
#                 "name": "addPeerForUsers",
#                 "outputs": [],
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "recipient",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "withdrawQuoteAnyway",
#                 "outputs": [],
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             },
#             {
#                 "inputs": [
#                     {
#                         "internalType": "address",
#                         "name": "recipient",
#                         "type": "address"
#                     },
#                     {
#                         "internalType": "uint256",
#                         "name": "amount",
#                         "type": "uint256"
#                     }
#                 ],
#                 "name": "withdrawPeerAnyway",
#                 "outputs": [],
#                 "stateMutability": "nonpayable",
#                 "type": "function"
#             }
#         ]
# EOS
        abi: <<EOS
[
		{
			"anonymous": false,
			"inputs": [
				{
					"indexed": true,
					"internalType": "address",
					"name": "user",
					"type": "address"
				},
				{
					"indexed": true,
					"internalType": "address",
					"name": "token",
					"type": "address"
				},
				{
					"indexed": false,
					"internalType": "uint256",
					"name": "amount",
					"type": "uint256"
				}
			],
			"name": "Deposit",
			"type": "event"
		},
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
			"constant": false,
			"inputs": [
				{
					"internalType": "address[]",
					"name": "users",
					"type": "address[]"
				},
				{
					"internalType": "uint256[]",
					"name": "amounts",
					"type": "uint256[]"
				}
			],
			"name": "addPeerForUsers",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [
				{
					"internalType": "address[]",
					"name": "users",
					"type": "address[]"
				},
				{
					"internalType": "uint256[]",
					"name": "amounts",
					"type": "uint256[]"
				}
			],
			"name": "addQuoteForUsers",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [
				{
					"internalType": "uint256",
					"name": "amount",
					"type": "uint256"
				}
			],
			"name": "depositPeerForUser",
			"outputs": [
				{
					"internalType": "uint256",
					"name": "",
					"type": "uint256"
				}
			],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [
				{
					"internalType": "uint256",
					"name": "amount",
					"type": "uint256"
				}
			],
			"name": "depositQuoteForUser",
			"outputs": [
				{
					"internalType": "uint256",
					"name": "",
					"type": "uint256"
				}
			],
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
			"constant": true,
			"inputs": [
				{
					"internalType": "address",
					"name": "user",
					"type": "address"
				}
			],
			"name": "peerBalanceOf",
			"outputs": [
				{
					"internalType": "uint256",
					"name": "",
					"type": "uint256"
				}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
				{
					"internalType": "address",
					"name": "user",
					"type": "address"
				}
			],
			"name": "quoteBalanceOf",
			"outputs": [
				{
					"internalType": "uint256",
					"name": "",
					"type": "uint256"
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
					"name": "from",
					"type": "address"
				},
				{
					"internalType": "address",
					"name": "to",
					"type": "address"
				},
				{
					"internalType": "uint256",
					"name": "amount",
					"type": "uint256"
				}
			],
			"name": "transferQuote",
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
			"name": "withdrawPeer",
			"outputs": [
				{
					"internalType": "uint256",
					"name": "",
					"type": "uint256"
				}
			],
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
			"name": "withdrawQuote",
			"outputs": [
				{
					"internalType": "uint256",
					"name": "",
					"type": "uint256"
				}
			],
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
			"name": "withdrawQuoteAnyway",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		}
	]
EOS
      }
    }
  end
end