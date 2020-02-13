interface CryptIDFactory {
    Promise<CryptID> getInstance(); 
}

interface CryptID {
    SetupResult setup(SecurityLevel securityLevel);

    EncryptResult encrypt(PublicParameters publicParameters,
                          Identity identity,
                          DOMString message);

    ExtractResult extract(PublicParameters publicParameters,
                          BigIntegerString masterSecret,
                          Identity identity)

    DecryptResult decrypt(PublicParameters publicParameters
                          PrivateKey privateKey,
                          CipherTextTuple ciphertext);

    void dispose();
};

typedef Point PrivateKey;

typedef DOMString Base64String;

typedef DOMString BigIntegerString;

typedef object Identity;

enum SecurityLevel { "lowest", "low", "medium", "high", "highest" };

dictionary Point {
    BigIntegerString x;
    BigIntegerString y;
};

dictionary PublicParameters {
    BigIntegerString fieldOrder;
    BigIntegerString subgroupOrder;
    Point pointP;
    Point pointPpublic;
    SecurityLevel securityLevel;
};

dictionary CipherTextTuple {
    Point cipherU;
    Base64String cipherV;
    Base64String cipherW;
};

dictionary SetupResult {
    boolean success;
    BigIntegerString? masterSecret;
    PublicParameters? publicParameters;
};

dictionary EncryptResult {
    boolean success;
    CipherTextTuple? ciphertext;
};

dictionary ExtractResult {
    boolean success;
    PrivateKey? privateKey;
};

dictionary DecryptResult {
    boolean success;
    DOMString? plaintext;
};
