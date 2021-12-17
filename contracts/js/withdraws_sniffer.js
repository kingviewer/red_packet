import Web3 from 'web3';
import axios from "axios";
import schedule from 'node-schedule';
import {Contracts} from "./contracts.js";

const base_url = 'http://localhost:3000/';
const wallet_url = 'https://bsc-dataseed1.defibit.io';

const blockLimit = 100;
let web3 = new Web3(new Web3.providers.HttpProvider(wallet_url));

let contract_game = new web3.eth.Contract(Contracts.game.abi, Contracts.game.address);

function sniffer() {
    axios.get(base_url + 'node/global_configs/blocks_config', {}).then(function (result) {
        let data = result.data.data;
        let from_block = data.withdraw_sniffer_block, to_block;
        web3.eth.getBlockNumber().then(function (cur_block) {
            while (true) {
                to_block = from_block + blockLimit;
                if (to_block > cur_block)
                    to_block = cur_block;

                contract_game.getPastEvents('Withdraw',
                    {
                        fromBlock: '0x' + from_block.toString(16),
                        toBlock: '0x' + to_block.toString(16),
                        filter: {}
                    }
                ).then(function (events) {
                    if (events.length === 0)
                        return;
                    let items = [];
                    for (let i = 0; i < events.length; i++) {
                        let event = events[i];
                        items.push({
                            tx_hash: event.transactionHash,
                            to: event.returnValues.user,
                            amount: Contracts.cic.to_display_amount(event.returnValues.amount),
                            asset_type: 'cigar'
                        });
                    }
                    axios.post(base_url + 'node/withdraws/new_withdraws', {items: items, transfer: false}).then(function (result) {
                        console.log(result.data);
                    });
                }).catch(function (err) {
                    console.log(err);
                });

                if (to_block >= cur_block)
                    break;
                from_block = to_block;
            }

            axios.post(base_url + 'node/global_configs/update_block_config', {withdraw_sniffer_block: cur_block}).then(function (result) {
                console.log(result.data);
            }).catch(function (err) {
                console.log(err);
            });
        });
    }).catch(function (result) {
        console.log(result);
    });
}

const snifferSchedual = () => {
    schedule.scheduleJob('0 * * * * *', () => {
        console.log('Loop sniffer request at:' + new Date());
        sniffer();
    });
};

snifferSchedual();