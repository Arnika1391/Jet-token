async function connectWallet() {
    if (window.ethereum) {
        try {
            await window.ethereum.request({ method: 'eth_requestAccounts' });
            alert('Wallet Connected! Ready to buy JET.');
        } catch (error) {
            alert('Connection failed: ' + error.message);
        }
    } else {
        alert('Install MetaMask!');
    }
}
