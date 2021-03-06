pragma solidity ^0.4.21;

import './FixedSupplyToken.sol';

contract Exchange is Owned {
    
    struct Offer {
        address trader;
        uint amount;
    }
    
    struct OrderBook {
        
        uint higherPrice;
        uint lowerPrice;
        
        mapping(uint => Offer) offers;
        
        //to represent a stack
        uint offers_key;
        uint offer_length;
    }
    
    struct Token {
        string symbolName;
        
        address tokenContract;
        
        // price is the key for order book linkedlist
        mapping(uint => OrderBook) buyOrderBook;
        //HEAD of the linkedlist for the buy order book
        uint currentBuyPrice;
        //TAIL of the linkedlist for the buy order book
        uint lowestBuyPrice;
        uint amountBuyPrices;
        
        // price is the key for order book linkedlist
        mapping(uint => OrderBook) sellOrderBook;
        //HEAD of the linked list for the sell order book
        uint currentSellPrice;
        //TAIL of the linked list for the sell order book
        uint highestSellPrice;
        uint amountSellPrices;
        
        
    }
    
    //uint8, we support maximum 255 contracts as we start from 1
    mapping(uint8 => Token) tokens;
    uint8 tokenIndex;
    
    mapping(address => mapping(uint8 => Token)) tokenBalancesForAddress;
    
    mapping(address => uint) etherBalanceForAddress;
    
    //////////////
    /// EVENTS ///
    //////////////
    
    
    ////////////////////////////////
    /// ETHER DEPOSIT & WITHDRAW ///
    ////////////////////////////////
    
    function depositEther(uint amountInWei) {
        
    }
    
    function withdrawEther(uint amountInWei) {
        
    }
    
    function getBalanceInWei() {
        
    }
    
    ////////////////////////
    /// TOKEN MANAGEMENT ///
    ////////////////////////
    
    // Only admin function
    function addToken(string symbolName,address tokenContract) public onlyOwner {
        require(! hasToken(symbolName));
        require(tokenIndex < 255);
        
        tokenIndex ++;
        tokens[tokenIndex].symbolName = symbolName;
        tokens[tokenIndex].tokenContract = tokenContract;
    }
    
    function hasToken(string symbolName) public constant returns (bool) {
        uint8 index = getSymbolIndex(symbolName); 
        return (index > 0);
    }
    
    function getSymbolIndex(string symbolName) internal returns (uint8) {
        for (uint8 i = 1; i <= tokenIndex; i++) {
            Token storage token = tokens[i];
            if (stringsEqual(symbolName,token.symbolName)) {
                return i;
            }
        }
        return 0;
    }
    
    function stringsEqual(string memory strA,string storage strB) internal returns (bool) {
        bytes memory strA_bytes = bytes(strA);
        bytes storage strB_bytes = bytes(strB);
        
        if (strB_bytes.length != strB_bytes.length) {
            return false;
        }
        for (uint8 i= 0; i < strA_bytes.length; i++) {
            if (strA_bytes[i] != strB_bytes[i]) {
                return false;
            }
        }
        return true;
    }
    
    
    ////////////////////////////////
    /// TOKEN DEPOSIT & WITHDRAW ///
    ////////////////////////////////
    
    
    function depositToken(string symbolName,uint amount) {
        
    }
    
    function withdrawToken(string symbolName,uint amount) {
        
    }
    
    function getBalanceToken(string symbolName) constant returns (uint) {
        
    }
    
    /////////////////////////////
    /// ORDER BOOK MANAGEMENT ///
    /////////////////////////////
    
    function getBuyOrderBook(string symbolName) constant returns (?) {
        
    }
    
    function getSellOrderBook(string symbolName) constant returns (?) {
        
    }
    
    function buyToken(string symbolName, uint amount, uint priceInWei) {
        
    }
    
    function sellToken(string symbolName, uint amount, uint priceInWei) {
        
    }
    
    function cancelLimitOrder(string symbolName, bool isSellOrder, uint amount, uint priceInWei) {
        
    }
}
