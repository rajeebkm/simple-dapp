# simple-dapp

First install Ethereum TestRPC and Web3.js to create a simple user interface that allow us to interact with our actual Ethreum Smart Contract.

## Install and Run Ethreum TestRPC:

It's a node.js ethreum client for the testing and development of our smart contract. So, we have to install node.js if not installed. To check node.js to be installed in our system, check by ``` node -v ``` and ``` npm -v ``` . Otherwise, for downloads, follow this website ``` https://nodejs.org/en/ ```.

Install Ethereum TestRPC globally: ``` npm install -g ethereumjs.testrpc ```  (deprecated) or, Install Ganache (https://trufflesuite.com/docs/ganache/quickstart/)

When successfully installed, run ``` testrpc ```, we will get 10 different accounts with their private keys, along with a local server (like ganache-cli, personal blockchain for Ethreum development)

``` testrpc ``` is a Node.js based Ethereum client for testing and development. It uses ethereumjs to simulate full client behavior and make developing Ethereum applications much faster. 

## Create a new project directory

Create a new project directory ``` mkdir simple-dapp ``` and go to that directory ``` cd simple-dapp ```.
Then run, ``` npm init `` to create a package.json file, which will store the project dependencies

## Install web3.js

Run ``` npm install web3 ```

`-----------------------------------------------------------------------`
## Steps

Run ``` ganache-cli ``` to initiate personal blockchain.

Create smart contract file with ```.sol ``` extension (in REMIX IDE, and deploy in Web3 Provider (Ganache Provider) Environment, copy the contract address)

Create a ```index.html``` file and ```main.css``` file.

In ```index.html```:

1. Check for web3

```
<script>
 if (typeof web3 !== 'undefined') {
           web3 = new Web3(web3.currentProvider);
       } else {
           web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
       }
</script>
```
2. Set default account

``` web3.eth.defaultAccount = web3.eth.accounts[0]; ```

3. Intitialize or create the contract on an address with the help of ```web3.eth.Contract()``` method

It accepts one parameter called ABI (Application Binary Interface). ABI allows to call functions and receive data from smart contracts. Wecan get ABI from REMIX IDE after compilation. Go to compile section and click Compilation Details to get ABI and copy that ABI and pass into ```web3.eth.Contract()```

```
var abi = [
	{
		"inputs": [],
		"name": "getInstructor",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "_age",
				"type": "uint256"
			}
		],
		"name": "setInstructor",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
];

var LearnCourseContract = web3.eth.contract(abi);

```

4. Define the actual contract address

Copy the contract address from REMIX IDE after deployment and create a new instance at that contract address.

``` var LearnCourse = LearnCourseContract.at('0xc32F8B27E4fc2f446aBE3461B9EBd2B373F46e8A');```

## Lite-server

Install lite-server: ``` npm install lite-server --save ``

Start lite-server: ```npm run dev```
