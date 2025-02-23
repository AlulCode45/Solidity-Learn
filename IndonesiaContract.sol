// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract IndonesiaContract {
    struct IndonesiaPeople {
        uint256 kk;
        uint256 nik;
        string name;
        uint256 rupiahBalance;
    }

    mapping(uint256 => mapping(uint256 => uint256)) private dataIndex;
    
    IndonesiaPeople[] public indonesiaData;

    function storeData(uint256 kk, uint256 nik, string memory name, uint256 balance) public {
        require(dataIndex[kk][nik] == 0, "Data already exists");

        indonesiaData.push(IndonesiaPeople({
            kk: kk,
            nik: nik,
            name: name,
            rupiahBalance: balance
        }));

        dataIndex[kk][nik] = indonesiaData.length;
    }

    function addRupiahBalance(uint256 _kk, uint256 _nik, uint256 _balance) public {
        uint256 index = dataIndex[_kk][_nik];

        require(index > 0, "Data not found"); 

        indonesiaData[index - 1].rupiahBalance += _balance;
    }
}


//3522183878731,3522193892, Muhammad Khoyron,500000