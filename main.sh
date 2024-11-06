#!/bin/bash

# Input keypair
# or read keypair from cfg / previous
echo "This program accepts keypairs stored in the PKCS #8 syntax."
#TODO: test whether provided keys are in pkcs8 or pkcs1, convert or exit accordingly


function init_check {
    which ssh-keygen ; echo $?
    which openssl ; echo $?
}

#function parse_config {}  #TODO: define config

function loadkey {};

function s_encrypt {
    
}

function s_decrypt {

}

function choose_mode {
echo "Choose mode:
- 1) Encrypt
- 2) Decrypt
- 3) Start chat client mode
$(if [[ $using_tmpkeypair -eq '1' ]]; then echo "- X) Use temporary keypair (auto-generate)" ; else echo "- X) Use existing keypair (currently using temporary) " ; fi )
"
read -p "Choice: " mode_choice
case $mode_choice in 
    1)
        echo "Encryption mode."
        ;;
    2)
        echo "Decryption mode."
        ;;
    *)
        echo "Invalid mode choice." ; exit 1
        ;;
esac
}

# Choose function
# encrypt or decrypt
