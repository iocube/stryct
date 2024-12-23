#!/bin/bash

source config.sh


## Pre-checks
# Input keypair
# or read keypair from cfg / previous
#TODO: test whether provided keys are in pkcs8 or pkcs1, convert or exit accordingly

function init_check {
    function check_program {
	    program_name="$1"
	    check_program_result=$(which "$program_name")
	    if [[ -z "$check_program_result" ]];then
		    echo "Error with local binary of ${program_name} "
		    exit 1
	    fi
    }
    
    check_program ssh-keygen 
    check_program openssl
}

function choose_mode {
echo "Choose mode:
- 1) Encrypt
- 2) Decrypt
Currenttly unavailable:
$(if [[ $using_tmpkeypair -eq '1' ]]; then echo "- 3) Use temporary keypair (auto-generate)" ; else echo "- 3) Use existing keypair (currently using temporary) " ; fi )
"
read -p "Choice: " mode_choice
case $mode_choice in 
    1)
        echo "Encryption mode."
	"$script_dir"/"encrypt.sh"
        ;;
    2)
        echo "Decryption mode."
	echo "Encrypted text must be stored in ${ciphertext_loc} "
	read -p "Continue? [Y/N] " continue_choice
	case "$continue_choice" in
	    [Yy])			
                "$script_dir"/"decrypt.sh"
		;;
	    *)
		echo "Exiting." && exit 0
		;;
	esac
        ;;
    3)
	echo "Using temporary keypair."
	;;
    *)
        echo "Invalid mode choice." ; exit 1
        ;;
esac
}

# Choose function
# encrypt or decrypt

# Main
init_check
echo "This program accepts keypairs stored in the PKCS #8 syntax."
choose_mode
