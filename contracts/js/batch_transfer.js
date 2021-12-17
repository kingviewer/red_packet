const Web3 = require("web3");
const axios = require("axios");
const schedule = require('node-schedule');
const HDWalletProvider = require("truffle-hdwallet-provider");

const base_url = 'http://localhost:3000/';
const wallet_url = 'https://bsc-dataseed1.defibit.io';

import {Contracts} from "./contracts.js";

const owner = '0x863a6bD040538E4d1dB26531C470Df59E843304A';

let web3 = new Web3(new HDWalletProvider('cruel venue remember project twist else congress cattle poverty midnight across draw', wallet_url, 3, 1));
let contract_game = new web3.eth.Contract(Contracts.game.abi, Contracts.game.address);

async function batchTransfer() {
    let page = 0, limit = 40;

    // CIC
    while (true) {
        let result;
        await axios.get(base_url + 'node/transfers/list', {
            params: {
                page: page,
                limit: limit
            }
        }).then(function (data) {
            result = data.data.data;
        });
        if (result.length > 0) {
            let users = [], amounts = [], ids = [];
            for (let i = 0; i < result.length; i++) {
                let item = result[i];
                users.push(item.address);
                amounts.push(Contracts.cic.to_real_amount(item.amount));
                ids.push(item.id);
            }
            await contract_game.methods.addForUsers(users, amounts).send({from: owner}).then(function () {
                axios.post(base_url + 'node/transfers/set_done', {ids: ids}).then(function () {
                    console.log('set cic done finished');
                }).catch(function (err) {
                    console.log('set cic done failed');
                    console.log(err);
                });
            }).catch(function (err) {
                console.log('call addQuoteForUsers failed');
                console.log(err);
            });
        }
        if (result.length < limit)
            break;
        page++;
    }
}

const transferSchedual = () => {
    schedule.scheduleJob('0 5,35 * * * *', () => {
        console.log('Loop sniffer request at:' + new Date());
        batchTransfer();
    });
};

transferSchedual();
// batchTransfer();