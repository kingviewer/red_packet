import {Contracts} from "./contracts.js";

const base_url = 'http://localhost:3000/';
const wallet_url = 'https://bsc-dataseed1.defibit.io';

import Web3 from 'web3';
import axios from "axios";

let web3 = new Web3(new Web3.providers.HttpProvider(wallet_url));
let contract_hero = new web3.eth.Contract(Contracts.hero.abi, Contracts.hero.address);

contract_hero.methods.userByIndex(8).call().then(addr => {
    console.log(addr);
    contract_hero.methods.parents(addr).call().then(user_amount => {
        console.log(user_amount);
    });
});