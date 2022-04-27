// Dataencrypt_coin ICO

//version of compiler
pragma solidity ^0.8.7;

contract dataencrypt_coin_ico {

    // Introducing the maximum no. of dataencrypt_coins available in for sale
    uint public max_dataencrypt_coins = 1000000;

    // Introducing the USD to dataencrypt_coins conversion rate ($! = 1000 coins)
    uint public usd_to_dataencrypt_coins = 1000;

    // Introducing the total number of dataencrypt_coins that have been bought by the investors
    uint public total_dataencrypt_coins_bought = 0;

    //Mapping from the innvestor address to its equity in dataencrypt_coins and USD
    mapping(address => uint) equity_dataencrypt_coins;
    mapping(address => uint) equity_usd;

    // Checking if an investor can buy dataencrypt_coins
    modifier can_buy_dataencrypt_coins(uint usd_invested) {
        require (usd_invested * usd_to_dataencrypt_coins + total_dataencrypt_coins_bought <= max_dataencrypt_coins);
        _;
    }

}