#!/bin/bash

if [ -z "$models_dir" ]; then
    models_dir=/home/devel/stable-diffusion-webui/models
fi

hf_repo_id=$1
hf_model_file=$2
model_sub_path=$3
model_target_file=$4

hf_cache_path=$(huggingface-cli download ${hf_repo_id} ${hf_model_file})
file_name=$(basename "$hf_cache_path")

if [ -z "$model_target_file" ]; then
    model_target_file=${file_name}
fi

symbolic_link="${models_dir}/${model_sub_path}/${model_target_file}"
if [ -L "$symbolic_link" ]; then
    rm ${symbolic_link}
fi

ln -s "${hf_cache_path}" ${symbolic_link}
