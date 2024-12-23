#!/bin/bash


## Setup
script_dir=$(realpath "$0" | sed -E 's#(^.*)/.*#\1#g')
working_dirname="tmp"
working_dir="${script_dir}/${working_dirname}"
if [[ ! -d "${working_dir}" ]];then
    mkdir "$working_dir"
    echo "Created ${working_dir}"
fi

decryptedtext_loc="$working_dir/decryptedtext"
ciphertext_loc="$working_dir/ciphertext"
