pragma solidity  ^0.5.0; 
// --------------------------------------
// ERC20 Standard used to create my Token
// --------------------------------------
contract RGToken{

    string public RGname;
    string public RGsymbol;
    uint8 public RGdecimals;
    uint256 TotalRGTokens;
    
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);
    
    mapping (address => uint256) balances;
    mapping (address => mapping(address => uint256)) allowed; 
    
    constructor() public {
        RGname = "RGToken";
        RGsymbol = "RGT";
        RGdecimals = 18;
        
        TotalRGTokens = 1000000000000;
        balances[msg.sender] = TotalRGTokens;
    }
    
    function totalSupply() public view returns (uint256){
        return TotalRGTokens;
    }
    
    function balance(address RGTokenUser) public view returns(uint){
        return balances[RGTokenUser];
    }
    
    
    function RGtransfer(address receiver,uint tknQty) public returns (bool){
        require(tknQty <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender] - tknQty;
        balances[receiver] = balances[receiver] + tknQty;
        emit Transfer(msg.sender, receiver, tknQty);
        return true;
    }
}