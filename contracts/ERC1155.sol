pragma solidity ^0.8.2;

contract ERC1155 {
    // Mapping from TokenID to account balances.
    mapping(uint256 => mapping(address => uint256)) internal _balances;
    // Gets the balance of an accounts tokens.
    function balanceOf(address account, uint256 id) public view returns(uint256) {
        require(account != address(0), "Address is zero.");
        return _balances[id][account];
    }

    // Gets the balance of multiple accounts tokens.
    function balanceOfBatch(address[] memory accounts, uint256[] memory ids) public returns(uint256[] memory) {
        require(accounts.length == ids.length, "Accounts and ids are not the same length.");
        uint256[] memory batchBalances = new uint256[](accounts.length);

        for (uint256 i = 0; i < accounts.length; i++) {
            batchBalances[i] = balanceOf(accounts[i], ids[i])
        }

        return batchBalances;
    }
}