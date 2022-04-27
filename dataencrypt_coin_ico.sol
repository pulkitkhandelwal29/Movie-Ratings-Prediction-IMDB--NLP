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

    //Mapping from the investor address to its equity in dataencrypt_coins and USD
    mapping(address => uint) equity_dataencrypt_coins;
    mapping(address => uint) equity_usd;

    // Checking if an investor can buy dataencrypt_coins
    modifier can_buy_dataencrypt_coins(uint usd_invested) {
        require (usd_invested * usd_to_dataencrypt_coins + total_dataencrypt_coins_bought <= max_dataencrypt_coins);
        _;
    }

    //Getting the equity in dataencrypt_coins of an investor
    function equity_in_dataencrypt_coins(address investor) external constant returns (uint) {
        return equity_dataencrypt_coins[investor];
    }

    //Getting the equity in USD of an investor
    function equity_in_usd(address investor) external constant returns (uint) {
        return equity_usd[investor];
    }

    //Buying dataencrypt_coins
    function buy_dataencrypt_coins(address, investor, uint usd_invested) external 
    can_buy_dataencrypt_coins(usd_invested) {
        uint dataencrypt_coins_bought = usd_invested * usd_to_dataencrypt_coins;
        equity_dataencrypt_coins[investor] += dataencrypt_coins_bought;
        equity_usd[investor] = equity_dataencrypt_coins[investor] / 1000;
        total_dataencrypt_coins_bought += dataencrypt_coins_bought;
    }

    //Selling dataencrypt_coins
    function sell_dataencrypt_coins(address, investor, uint dataencrypt_coins_sold) external {
        equity_dataencrypt_coins[investor] -= dataencrypt_coins_sold;
        equity_usd[investor] = equity_dataencrypt_coins[investor] / 1000;
        total_dataencrypt_coins_bought -= dataencrypt_coins_sold;
    }

}