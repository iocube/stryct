#!/bin/bash

source config.sh

## Load private key
echo "Loading private key."
privatekey="${script_dir}/id_rsa"

# Check if private key exists
if [[ ! -f ${script_dir}/id_rsa ]]; then
    echo "Private key not found."
    echo "Expected \"${script_dir}/id_rsa \" "
    read -p "Generate new keypair? [Y/N]" genkey_choice
    case "$genkey_choice" in
        [Yy])
            echo "Generating keypair in ${script_dir}"
            ssh-keygen -t RSA -m PEM -f "$script_dir"
            ;;
        *)
            echo "Exiting." ; exit 1
            ;;
    esac
fi

# Check private key format
if [[ $(cat "$privatekey" | grep -q 'BEGIN RSA PRIVATE KEY' ; echo "$?" ) -ne '0' ]];then 
    echo "Key is not stored in PKCS #8.
    Please generate a new one or convert the existing one.

    To generate a new key pair:
    # ssh-keygen -t RSA -m PEM"
    exit 1
else
    echo "Loaded private key."
fi

## Load public key
echo "Loading public key."
publickey="${script_dir}/id_rsa.pub"
if [[ $(cat "$publickey" | grep -q 'BEGIN PUBLIC KEY' ; echo "$?" ) -ne '0' ]];then 
    echo "Public key is not stored in PKCS #8.
    Please generate a new one or convert an existing one.

    To convert an existing public key to PKCS #8:
    #ssh-keygen -f <src_dir>/id_rsa.pub -e -m pkcs8 > <dst_dir>/id_rsa.pub.pkcs8
    "

    read -p "Convert in run-time? [Y/N] " choice_convert
    case "$choice_convert" in
        [Yy])
            runtime_pkey_filename="${working_dir}/id_rsa.pub.pkcs8_TMP"
            convert_public_key=$(ssh-keygen -f "$publickey" -e -m pkcs8 > "$runtime_pkey_filename")
            publickey="$runtime_pkey_filename"
            echo "Public key has been converted in run-time."
            ;;
        *)
            echo "Exiting." ; exit 1
            ;;
    esac
else
    echo "Loaded Public key."
fi


## Main

decrypted=$(openssl pkeyutl -decrypt -inkey "$privatekey" -in "$ciphertext_loc" -out "$decryptedtext_loc" ; cat "$decryptedtext_loc")

echo "Decrypted text is: ${decrypted}"
echo "Decrypted text stored in ${decryptedtext_loc}"
