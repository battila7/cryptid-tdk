const { performance } = require('perf_hooks');
const CryptIDFactory = require('cryptid');

const MESSAGE = "Two hashes walk into a bar, one was a salted.";
const PUBLIC_KEY = {
    email: 'bob@example.com'
};

(async function main() {
    const CryptID = await CryptIDFactory.getInstance();

    console.log(`Original message: "${MESSAGE}"`);

    const start = performance.now();
    const { publicParameters, masterSecret } = CryptID.setup('lowest');

    const { ciphertext } = CryptID.encrypt(publicParameters, PUBLIC_KEY, MESSAGE);

    const { privateKey } = CryptID.extract(publicParameters, masterSecret, PUBLIC_KEY);

    const { plaintext } = CryptID.decrypt(publicParameters, privateKey, ciphertext);
    const runningTime = performance.now() - start;

    CryptID.dispose();

    console.log(`Decrypted message: "${plaintext}"`);
    console.log(`Completed in ${runningTime} ms`);
})();