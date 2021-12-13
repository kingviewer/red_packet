const getWeb3 = () =>
    new Promise(async (resolve, reject) => {
        // Modern dapp browsers...
        if (window.ethereum) {
            const Web3 = require('web3');
            const web3 = new Web3(window.ethereum);
            try {
                // Request account access if needed
                await window.ethereum.enable();
                // Acccounts now exposed
                web3.eth.getChainId().then(function (result) {
                    if (result === 56)
                        resolve(web3);
                    else if (window.ethereum)
                        window.ethereum.request({
                            method: 'wallet_switchEthereumChain',
                            params: [{chainId: '0x38'}],
                        }).then(() => {
                            resolve(web3);
                        }).catch((err) => {
                            if (err.code === 4092) {
                                window.ethereum.request({
                                    method: 'wallet_addEthereumChain',
                                    params: [{
                                        chainId: '0x38',
                                        chainName: 'Binance Smart Chain Mainnet',
                                        nativeCurrency: {
                                            name: 'Binance Coin',
                                            symbol: 'BNB',
                                            decimals: 18
                                        },
                                        rpcUrls: ['https://bsc-dataseed1.defibit.io'],
                                        blockExplorerUrls: ['https://bscscan.com']
                                    }]
                                }).then((result) => {
                                    resolve(web3);
                                }).catch(() => {
                                    reject('请切换到币安智能链主网');
                                });
                            } else
                                reject('请切换到币安智能链主网');
                        });
                    else
                        reject('请切换到币安智能链主网');
                });
            } catch (error) {
                reject(error);
            }
        }
        // Legacy dapp browsers...
        else if (window.web3) {
            // Use Mist/MetaMask's provider.
            const web3 = window.web3;
            console.log("Injected web3 detected.");
            resolve(web3);
        }
        // Fallback to localhost; use dev console port by default...
        else {
            reject('No available wallet');
        }
    });