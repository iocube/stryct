\# Heavily in-progress. File structure and functionality are not final.

<div align="center">
<h2>Encrypt or decrypt plaintext strings using various cryptography functions.</h2>
</div>

#### An interactive utility for assymetric encryption and decryption of text or data. Can be used for secure transfer of data over unencrypted channels.

Current progress:  
2024-12-23  
![output4](https://github.com/user-attachments/assets/f25c880b-de78-4aad-9c45-82ee88563b48)
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
