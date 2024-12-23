\# Heavily in-progress. File structure and functionality are not final.

<div align="center">
<h2>Encrypt or decrypt plaintext strings using various cryptography functions.</h2>
</div>

#### A utility for encryption and decryption of text or data. To be used for secure transfer of confidential data over unencrypted channels.

Current progress:  
2024-12-23  
![output](https://github.com/user-attachments/assets/d1e88c36-dcb2-4241-885d-9911afed2a47)
</br>
2024-11-05  
![output](https://github.com/user-attachments/assets/1cc8895a-4a6c-4d51-8cc8-4a25a860ce80)



#### Theory and usage:
User 1 shares his public key via non-encrypted channel with User 2.  
User 2 uses User 1's public key to encrypt a message. The ciphertext is then converted to base64.  
The encrypted message (in base64) is then sent to User 1 once again over an unencrypted channel.  
User 1 decrypts the message using his private key.  
</br>
TODO:
- adjust ease of use for message sender
- ~~separate encryption and decryption (related to the above)~~
- ~~rewrite main.sh to undertake the role of an interactive main menu~~
- add signing and signing verification
