const Contracts = {
    usdt: {
        // address: '0x9cb1C2C652E188f1ff16672D5eB3b754240ED6d0',
        address: '0x42F2fBa90ACF3ddfb413EEae4F58bC477D93F55d',
        to_real_amount: function (amount) {
            return Contracts.to_real_amount(amount, 18);
        },
        to_display_amount: function (real_amount) {
            return Contracts.to_display_amount(real_amount, 18);
        },
        // abi: [
        //     {
        //         "inputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "constructor"
        //     },
        //     {
        //         "anonymous": false,
        //         "inputs": [
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "owner",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "spender",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": false,
        //                 "internalType": "uint256",
        //                 "name": "value",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "Approval",
        //         "type": "event"
        //     },
        //     {
        //         "anonymous": false,
        //         "inputs": [
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "previousOwner",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "newOwner",
        //                 "type": "address"
        //             }
        //         ],
        //         "name": "OwnershipTransferred",
        //         "type": "event"
        //     },
        //     {
        //         "anonymous": false,
        //         "inputs": [
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "from",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "to",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": false,
        //                 "internalType": "uint256",
        //                 "name": "value",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "Transfer",
        //         "type": "event"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "_decimals",
        //         "outputs": [
        //             {
        //                 "internalType": "uint8",
        //                 "name": "",
        //                 "type": "uint8"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "_name",
        //         "outputs": [
        //             {
        //                 "internalType": "string",
        //                 "name": "",
        //                 "type": "string"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "_symbol",
        //         "outputs": [
        //             {
        //                 "internalType": "string",
        //                 "name": "",
        //                 "type": "string"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "owner",
        //         "outputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "",
        //                 "type": "address"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [],
        //         "name": "renounceOwnership",
        //         "outputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "newOwner",
        //                 "type": "address"
        //             }
        //         ],
        //         "name": "transferOwnership",
        //         "outputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "getOwner",
        //         "outputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "",
        //                 "type": "address"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "decimals",
        //         "outputs": [
        //             {
        //                 "internalType": "uint8",
        //                 "name": "",
        //                 "type": "uint8"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "symbol",
        //         "outputs": [
        //             {
        //                 "internalType": "string",
        //                 "name": "",
        //                 "type": "string"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "name",
        //         "outputs": [
        //             {
        //                 "internalType": "string",
        //                 "name": "",
        //                 "type": "string"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "totalSupply",
        //         "outputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "account",
        //                 "type": "address"
        //             }
        //         ],
        //         "name": "balanceOf",
        //         "outputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "recipient",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "transfer",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "owner",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "address",
        //                 "name": "spender",
        //                 "type": "address"
        //             }
        //         ],
        //         "name": "allowance",
        //         "outputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "spender",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "approve",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "sender",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "address",
        //                 "name": "recipient",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "transferFrom",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "spender",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "addedValue",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "increaseAllowance",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "spender",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "subtractedValue",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "decreaseAllowance",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "mint",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "burn",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     }
        // ]
        abi: [
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
    },
    cic: {
        // address: '0xac9816E5c6F42C6c04e2848a77A5ac67C3B13A2a',
        address: '0x3890C270F69744e945b23471678F9F4891BAF432',
        to_real_amount: function (amount) {
            return Contracts.to_real_amount(amount, 8);
        },
        to_display_amount: function (real_amount) {
            return Contracts.to_display_amount(real_amount, 8);
        },
        // abi: [
        //     {
        //         "inputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "constructor"
        //     },
        //     {
        //         "anonymous": false,
        //         "inputs": [
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "owner",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "spender",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": false,
        //                 "internalType": "uint256",
        //                 "name": "value",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "Approval",
        //         "type": "event"
        //     },
        //     {
        //         "anonymous": false,
        //         "inputs": [
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "previousOwner",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "newOwner",
        //                 "type": "address"
        //             }
        //         ],
        //         "name": "OwnershipTransferred",
        //         "type": "event"
        //     },
        //     {
        //         "anonymous": false,
        //         "inputs": [
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "from",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "to",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": false,
        //                 "internalType": "uint256",
        //                 "name": "value",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "Transfer",
        //         "type": "event"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "_decimals",
        //         "outputs": [
        //             {
        //                 "internalType": "uint8",
        //                 "name": "",
        //                 "type": "uint8"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "_name",
        //         "outputs": [
        //             {
        //                 "internalType": "string",
        //                 "name": "",
        //                 "type": "string"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "_symbol",
        //         "outputs": [
        //             {
        //                 "internalType": "string",
        //                 "name": "",
        //                 "type": "string"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "owner",
        //         "outputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "",
        //                 "type": "address"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [],
        //         "name": "renounceOwnership",
        //         "outputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "newOwner",
        //                 "type": "address"
        //             }
        //         ],
        //         "name": "transferOwnership",
        //         "outputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "getOwner",
        //         "outputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "",
        //                 "type": "address"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "decimals",
        //         "outputs": [
        //             {
        //                 "internalType": "uint8",
        //                 "name": "",
        //                 "type": "uint8"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "symbol",
        //         "outputs": [
        //             {
        //                 "internalType": "string",
        //                 "name": "",
        //                 "type": "string"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "name",
        //         "outputs": [
        //             {
        //                 "internalType": "string",
        //                 "name": "",
        //                 "type": "string"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "totalSupply",
        //         "outputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "account",
        //                 "type": "address"
        //             }
        //         ],
        //         "name": "balanceOf",
        //         "outputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "recipient",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "transfer",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "owner",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "address",
        //                 "name": "spender",
        //                 "type": "address"
        //             }
        //         ],
        //         "name": "allowance",
        //         "outputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "spender",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "approve",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "sender",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "address",
        //                 "name": "recipient",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "transferFrom",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "spender",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "addedValue",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "increaseAllowance",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "spender",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "subtractedValue",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "decreaseAllowance",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "mint",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "burn",
        //         "outputs": [
        //             {
        //                 "internalType": "bool",
        //                 "name": "",
        //                 "type": "bool"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     }
        // ]
        abi: [
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
    },
    game: {
        // address: '0x50Aec6Cb63dd2e522a03d78eEa7D56CD7F7B0651',
        address: '0x0A264E33f550546F1307F725dd402990918E9c75',
        // abi: [
        //     {
        //         "anonymous": false,
        //         "inputs": [
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "user",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "token",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": false,
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "Deposit",
        //         "type": "event"
        //     },
        //     {
        //         "anonymous": false,
        //         "inputs": [
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "previousOwner",
        //                 "type": "address"
        //             },
        //             {
        //                 "indexed": true,
        //                 "internalType": "address",
        //                 "name": "newOwner",
        //                 "type": "address"
        //             }
        //         ],
        //         "name": "OwnershipTransferred",
        //         "type": "event"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [],
        //         "name": "owner",
        //         "outputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "",
        //                 "type": "address"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [],
        //         "name": "renounceOwnership",
        //         "outputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "newOwner",
        //                 "type": "address"
        //             }
        //         ],
        //         "name": "transferOwnership",
        //         "outputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "user",
        //                 "type": "address"
        //             }
        //         ],
        //         "name": "quoteBalanceOf",
        //         "outputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": true,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "user",
        //                 "type": "address"
        //             }
        //         ],
        //         "name": "peerBalanceOf",
        //         "outputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "view",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "recipient",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "withdrawQuote",
        //         "outputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "recipient",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "withdrawPeer",
        //         "outputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "depositQuoteForUser",
        //         "outputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "depositPeerForUser",
        //         "outputs": [
        //             {
        //                 "internalType": "uint256",
        //                 "name": "",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address[]",
        //                 "name": "users",
        //                 "type": "address[]"
        //             },
        //             {
        //                 "internalType": "uint256[]",
        //                 "name": "amounts",
        //                 "type": "uint256[]"
        //             }
        //         ],
        //         "name": "addQuoteForUsers",
        //         "outputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address[]",
        //                 "name": "users",
        //                 "type": "address[]"
        //             },
        //             {
        //                 "internalType": "uint256[]",
        //                 "name": "amounts",
        //                 "type": "uint256[]"
        //             }
        //         ],
        //         "name": "addPeerForUsers",
        //         "outputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "recipient",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "withdrawQuoteAnyway",
        //         "outputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "recipient",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "withdrawPeerAnyway",
        //         "outputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     },
        //     {
        //         "constant": false,
        //         "inputs": [
        //             {
        //                 "internalType": "address",
        //                 "name": "from",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "address",
        //                 "name": "to",
        //                 "type": "address"
        //             },
        //             {
        //                 "internalType": "uint256",
        //                 "name": "amount",
        //                 "type": "uint256"
        //             }
        //         ],
        //         "name": "transferQuote",
        //         "outputs": [],
        //         "payable": false,
        //         "stateMutability": "nonpayable",
        //         "type": "function"
        //     }
        // ]
        abi: [
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
    },
    to_real_amount: function (amount, coin_decimals) {
        let decimals, _amount = amount + '';
        if (_amount.indexOf('.') === -1)
            decimals = 0;
        else
            decimals = _amount.length - _amount.indexOf('.') - 1;
        _amount = _amount.replace('.', '');
        for(let i = 0; i < coin_decimals - decimals; i ++) {
            _amount += '0'
        }
        return _amount;
    },
    to_display_amount: function (real_amount, coin_decimals) {
        let _amount = real_amount + '';
        if (real_amount.length < coin_decimals) {
            let count = coin_decimals - real_amount.length + 1;
            for (let i = 0; i < count; i ++)
                _amount = '0' + _amount;
        }
        _amount = _amount.substr(0, _amount.length - coin_decimals) + '.' +
            _amount.substr(_amount.length - coin_decimals);
        if (_amount.length - _amount.indexOf('.') - 1 > 6)
            _amount = _amount.substr(0, _amount.indexOf('.') + 7);
        return _amount;
    }
};