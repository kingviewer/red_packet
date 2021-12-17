import {Contracts} from "./contracts.js";

const base_url = 'http://localhost:3000/';
const wallet_url = 'https://bsc-dataseed1.defibit.io';

import Web3 from 'web3';
import axios from "axios";
import schedule from 'node-schedule';

let web3 = new Web3(new Web3.providers.HttpProvider(wallet_url));
let contract_hero = new web3.eth.Contract(Contracts.hero.abi, Contracts.hero.address);

function sniffer() {
    axios.get(base_url + 'node/global_configs/blocks_config', {}).then(function (result) {
        let data = result.data.data;
        let index = data.user_sniffer_index;
        contract_hero.methods.usersCount().call().then(function (count) {
            let total = parseInt(count);
            if (total <= index) {
                console.log('No new user');
                return;
            }
            for (let i = index; i < total; i ++) {
                contract_hero.methods.userByIndex(i).call().then(user => {
                    console.log(user);
                    contract_hero.methods.parents(user).call().then(parent => {
                        contract_hero.methods.userExists(parent).call().then(exist => {
                            let params = {user: user};
                            if (exist)
                                params['parent'] = parent;
                            axios.post(base_url + 'node/users/create', params).then(function (result) {
                                console.log(result.data);
                            });
                        });
                    });
                });
            }
            axios.post(base_url + 'node/global_configs/update_block_config', {user_sniffer_index: total}).then(function (result) {
                console.log(result.data);
            });
        });
    }).catch(function (result) {
        console.log(result);
    });
}

const snifferSchedual = () => {
    schedule.scheduleJob('40 * * * * *', () => {
        console.log('Loop sniffer users at:' + new Date());
        sniffer();
    });
};

snifferSchedual();