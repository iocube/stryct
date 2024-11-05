#!/bin/bash

# Input keypair
# or read keypair from cfg / previous
echo "This program accepts keypairs stored in the PKCS #8 syntax."
#TODO: test whether provided keys are in pkcs8 or pkcs1, convert or exit accordingly


function init_check{};
function parse_config{};
function loadkey {};

function s_encrypt {
    echo "Using key"
}

function s_decrypt {

}
#Choose mode
echo "Choose mode:
- 1) Encrypt
- 2) Decrypt
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
# Choose function
# encrypt or decrypt
