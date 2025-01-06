<div align="center">
<h2>Encrypt or decrypt plaintext strings using various cryptography functions.</h2>
</div>

#### An interactive utility for asymetric encryption and decryption of text or data. Can be used for secure transfer of data over unencrypted channels.

![output5](https://github.com/user-attachments/assets/029d7dc8-1fb7-4072-9373-28c9577c9897)



#### Theory and usage:
User 1 shares his public key via non-encrypted channel with User 2.  
User 2 uses User 1's public key to encrypt a message. The ciphertext is then converted to base64.  
The encrypted message (in base64) is then sent to User 1 once again over an unencrypted channel.  
User 1 decrypts the message using his private key.  

#### How to run:
Clone repository and run 'stryct.sh'  

</br>
TODO: </br>
- adjust ease of use for message sender </br>
- <del>separate encryption and decryption (related to the above)</del> </br>
- <del>rewrite main.sh to undertake the role of an interactive main menu</del> </br>
- add signing and signing verification </br>
