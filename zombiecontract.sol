//SPDX-Licensce-Identifier:Undefined;
pragma solidity >= 0.5.0 <0.9.0;

contract ZombieContract 
{
    //each and every zombie created has a length of 16
uint zombiednalen=16;
//whatever random number generated to provide length of 16
uint dnamodulus=10 ** 16; //** == exponential(^)
//to create a zombie user should provide name of zombie
//through the help of nameof zombie contract generates id 
//both are required to create a zombie
struct Zombie
{
    string name;
    uint id;
}
//dynamic array to store zombies created
Zombie [] public zombies;
//we need three function
//1=to add zombie to array
//2=to  genrate random id using name provided by user
//3=to create zombie and pass to add zombie to array function
//addd zombie to array
function createZombies(string memory _name,uint _id)private
{
zombies.push(Zombie(_name,_id));
}
//to generate randomk id using name
function _generateRandomid(string memory _Name)private returns(uint)
{
    //genrates randomid of 256 bits using keccak hasing algorithm
    uint randid=uint(keccak256(abi.encodePacked(_Name)));
    //returns id of length 16
    return randid % dnamodulus;

}

function _CreatingZombie(string memory _NAME)public
{
    //stores dna of zombie
    uint idforZombie=_generateRandomid(_NAME);
    //passes to array of zombies
    createZombies(_NAME, idforZombie);
}


}