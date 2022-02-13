pragma solidity ^0.8.0;

contract AccessControl{
    event GrantRole(bytes32 indexed role, address indexed account);
    event RevokeRole();
    mapping(bytes32 => mapping(address => bool)) public roles;

    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    bytes32 private constant USER = keccak256(abi.encodePacked("USER"));

    function _grantRole(bytes32 _role, address _account) internal {
        roles[_role][_account] = true;
        emit GrantRole(_role, _account);
    }

    constructor(){
        _grantRole(ADMIN, msg.sender);
    }
    function grantRole(bytes32 _role, address _account) external {
        require (roles[ADMIN][msg.sender], "Not Authorized");
        _grantRole(_role, _account);
    }


}