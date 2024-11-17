#!/bin/sh

temp_output=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
utilization_output=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)

if [ $? -eq 0 ]; then
    echo "${temp_output}°C, ${utilization_output}%"
else
    echo "Error executing nvidia-smi"
fi

