#!/bin/bash

# Function to consume CPU resources
consume_cpu() {
    echo "Starting CPU-intensive task..."
    for i in {1..1000000}; do
        echo "scale=5000; a(1)*4" | bc -l >/dev/null
    done &
}

# Function to consume memory resources
consume_memory() {
    echo "Starting memory-intensive task..."
    declare -a arr
    while true; do
        arr+=($(seq 1 100000))
    done &
}

# Main script execution
echo "Simulating an overloaded server..."

# Run CPU-intensive task
consume_cpu

# Run memory-intensive task
consume_memory

# Keep the script running
wait
